# Yime 音元系统文库

本仓库收录“音元系统”的说明文档，主要讨论现代通用汉语（现代汉语普通话）的语音分析与拼音方案。

音元系统把语音看作由“音元”构成的系统：音节是音元组成的序列，音元是表示“片音”的变元，而片音是能够单独发出的最小短音。文库在梳理既有与现行析音方法的基础上，介绍唱音分析、片音分析、音元分析及音元拼音法。

> 本仓库 `main` 分支是文档的唯一维护源。其他 Yime 仓库中的原生 Wiki 均为发布镜像，请勿分别修改。

## 在线阅读

- [GitHub Pages 文库](https://tsaanghwang.github.io/Yime-wiki/)
- [GitHub Wiki 仓库](https://github.com/tsaanghwang/Yime-wiki)

初次阅读建议先看[摘要](摘要.md)了解基本概念，再按[目录](目录.md)顺序阅读正文。

## 内容导航

| 部分 | 内容 |
| --- | --- |
| [摘要](摘要.md) | 文库范围与音元系统的核心特征 |
| [绪论](绪论.md) | 研究背景、基本问题与论述起点 |
| [已有析音法](已有析音法.md) | 既有析音方法的分类、分代及相关问题 |
| [现行析音法](现行析音法.md) | 节调、节质、干音等现行分析框架 |
| [唱音分析法](唱音分析法.md) | 唱音的划分、音值、拼音方法及其困难 |
| [片音分析概要](片音分析概要.md) | 片音分析的简要说明 |
| [音元分析法](音元分析法.md) | 首音、干音、音节及音元的分析模型 |
| [音元拼音法](音元拼音法.md) | 音元、音符、发音、记音与拼音规则 |
| [结论](结论.md) | 全文结论 |
| [注释](注释.md) · [附录](附录.md) · [文献](文献.md) | 补充说明、资料与参考文献 |

完整的章节级索引见[目录](目录.md)。

## 仓库结构

```text
.
├─ Home.md                 # 各发布入口共用的 Wiki 首页
├─ 摘要.md、绪论.md……       # 文库正文
├─ images/                 # 插图及相关静态资源
├─ YIME_Theory/flowchart/  # Mermaid 图表与公式源文件
├─ .pages/                 # GitHub Pages / MkDocs 配置
├─ .github/workflows/      # 自动构建与发布流程
└─ scripts/                # 原生 Wiki 镜像同步脚本
```

## 参与完善

欢迎通过 [Issues](https://github.com/tsaanghwang/Yime-wiki/issues) 提交勘误、建议或阅读中遇到的问题。修改正文时，请直接修改本仓库中的 Markdown 源文件，并保持内部链接和相关图表同步更新。

## 维护与发布

推送到 `main` 后，GitHub Actions 会使用 MkDocs 自动构建并发布 GitHub Pages。向原型版和 Windows 版原生 Wiki 发布镜像前，请确认工作区干净且 `main` 已推送，然后在 Windows PowerShell 中运行：

```powershell
.\scripts\sync-native-wikis.cmd
```

同步脚本仅执行快进发布，不会强制覆盖目标 Wiki。首次接入、冲突处理及完整维护约定请参阅[维护文档](MAINTENANCE.md)。
