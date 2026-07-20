[CmdletBinding()]
param(
    [switch]$SkipUnavailable
)

$ErrorActionPreference = "Stop"

$repositoryRoot = (git rev-parse --show-toplevel).Trim()
Set-Location -LiteralPath $repositoryRoot

if ((git status --porcelain).Count -ne 0) {
    throw "Canonical wiki worktree is not clean. Commit and push main before publishing mirrors."
}

$branch = (git branch --show-current).Trim()
if ($branch -ne "main") {
    throw "Canonical wiki must be published from main; current branch is '$branch'."
}

$targets = @(
    @{
        Name = "Yime prototype native Wiki"
        Url = "git@github.com:tsaanghwang/Yime-prototype.wiki.git"
    },
    @{
        Name = "Windows Yime native Wiki"
        Url = "git@github.com:tsaanghwang/Yime.wiki.git"
    }
)

$unavailable = @()

foreach ($target in $targets) {
    Write-Host "Checking $($target.Name)..."
    $symref = & git ls-remote --symref $target.Url HEAD 2>&1
    if ($LASTEXITCODE -ne 0) {
        $unavailable += $target.Name
        Write-Warning "$($target.Name) is not initialized or cannot be reached."
        continue
    }

    $headLine = $symref | Where-Object { $_ -match '^ref:\s+refs/heads/' }
    if (-not $headLine) {
        throw "Cannot determine the default branch of $($target.Name)."
    }
    $targetBranch = ($headLine -replace '^ref:\s+refs/heads/', '' -replace '\s+HEAD$', '').Trim()

    & git fetch --quiet $target.Url $targetBranch
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to fetch $($target.Name)."
    }

    & git merge-base --is-ancestor FETCH_HEAD HEAD
    if ($LASTEXITCODE -ne 0) {
        throw "$($target.Name) contains history not incorporated into canonical main. Merge it before publishing."
    }

    & git push $target.Url "HEAD:$targetBranch"
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to publish $($target.Name)."
    }
}

if ($unavailable.Count -gt 0 -and -not $SkipUnavailable) {
    throw "Some native Wikis were unavailable: $($unavailable -join ', '). Initialize them and rerun, or use -SkipUnavailable."
}

Write-Host "Native Wiki synchronization completed."
