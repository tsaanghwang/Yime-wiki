# Wiki 统一维护与发布

## 唯一真源

所有正文只在独立仓库
[`tsaanghwang/Yime-wiki`](https://github.com/tsaanghwang/Yime-wiki)
的 `main` 分支维护。

以下入口都是发布产物，不是第二套正文：

- `Yime-prototype` 仓库的原生 Wiki；
- Windows `Yime` 仓库的原生 Wiki；
- `Yime-wiki` 的 GitHub Pages 网站。

不要直接在两个原生 Wiki 的网页编辑器中修改正文。若误改，先把改动取回真源并审查，不能让镜像产生独立版本。

## 原生 Wiki 同步

在真源仓库工作区干净、`main` 已推送后运行：

```powershell
.\scripts\sync-native-wikis.ps1
```

脚本只执行快进同步。若目标 Wiki 含有真源尚未吸收的提交，脚本会停止并要求先合并历史；它不会强制覆盖远端。

GitHub 只有在仓库 Wiki 网页中创建过至少一个页面后，才会建立对应的 `<repository>.wiki.git`。新目标第一次接入时，应先创建占位首页，再把该初始提交以 `ours` 策略并入真源，最后运行同步脚本。

## 独立网页

`.github/workflows/deploy-pages.yml` 在 `main` 更新时从同一批 Markdown 和静态资源构建 GitHub Pages。网页构建不复制另一套可维护正文，临时构建目录只存在于 CI 运行期间。
