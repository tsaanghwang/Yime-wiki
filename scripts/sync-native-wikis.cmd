@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync-native-wikis.ps1" %*
exit /b %ERRORLEVEL%
