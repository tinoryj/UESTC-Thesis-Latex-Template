# UESTC-Thesis-Latex-Template

**[English version of the README](README_Eng.md)**

## 目录

- [使用说明](#%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E)
  - [设置论文相关信息](#%E8%AE%BE%E7%BD%AE%E8%AE%BA%E6%96%87%E7%9B%B8%E5%85%B3%E4%BF%A1%E6%81%AF)
    - [学位信息设置（选择对应模板）](#%E5%AD%A6%E4%BD%8D%E4%BF%A1%E6%81%AF%E8%AE%BE%E7%BD%AE%E9%80%89%E6%8B%A9%E5%AF%B9%E5%BA%94%E6%A8%A1%E6%9D%BF)
    - [作者、导师、题目等基本信息](#%E4%BD%9C%E8%80%85%E5%AF%BC%E5%B8%88%E9%A2%98%E7%9B%AE%E7%AD%89%E5%9F%BA%E6%9C%AC%E4%BF%A1%E6%81%AF)
    - [设置专业学位领域（专业硕士/博士专用）](#%E8%AE%BE%E7%BD%AE%E4%B8%93%E4%B8%9A%E5%AD%A6%E4%BD%8D%E9%A2%86%E5%9F%9F%E4%B8%93%E4%B8%9A%E7%A1%95%E5%A3%AB%E5%8D%9A%E5%A3%AB%E4%B8%93%E7%94%A8)
    - [答辩委员会主席](#%E7%AD%94%E8%BE%A9%E5%A7%94%E5%91%98%E4%BC%9A%E4%B8%BB%E5%B8%AD)
    - [设置合作导师](#%E8%AE%BE%E7%BD%AE%E5%90%88%E4%BD%9C%E5%AF%BC%E5%B8%88)
      - [专业学位硕士/博士（请按照以下步骤操作）](#%E4%B8%93%E4%B8%9A%E5%AD%A6%E4%BD%8D%E7%A1%95%E5%A3%AB%E5%8D%9A%E5%A3%AB%E8%AF%B7%E6%8C%89%E7%85%A7%E4%BB%A5%E4%B8%8B%E6%AD%A5%E9%AA%A4%E6%93%8D%E4%BD%9C)
      - [学术学位硕士/博士（请按照以下步骤操作）](#%E5%AD%A6%E6%9C%AF%E5%AD%A6%E4%BD%8D%E7%A1%95%E5%A3%AB%E5%8D%9A%E5%A3%AB%E8%AF%B7%E6%8C%89%E7%85%A7%E4%BB%A5%E4%B8%8B%E6%AD%A5%E9%AA%A4%E6%93%8D%E4%BD%9C)
    - [分类号、密级、UDC号](#%E5%88%86%E7%B1%BB%E5%8F%B7%E5%AF%86%E7%BA%A7udc%E5%8F%B7)
  - [图、表目录设置](#%E5%9B%BE%E8%A1%A8%E7%9B%AE%E5%BD%95%E8%AE%BE%E7%BD%AE)
  - [缩略词/符号表目录设置](#%E7%BC%A9%E7%95%A5%E8%AF%8D%E7%AC%A6%E5%8F%B7%E8%A1%A8%E7%9B%AE%E5%BD%95%E8%AE%BE%E7%BD%AE)
  - [使用代码模板](#%E4%BD%BF%E7%94%A8%E4%BB%A3%E7%A0%81%E6%A8%A1%E6%9D%BF)
  - [(盲审提交用)不显示作者姓名](#%E7%9B%B2%E5%AE%A1%E6%8F%90%E4%BA%A4%E7%94%A8%E4%B8%8D%E6%98%BE%E7%A4%BA%E4%BD%9C%E8%80%85%E5%A7%93%E5%90%8D)
  - [参考文献数量超过100时的悬挂缩进问题](#%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE%E6%95%B0%E9%87%8F%E8%B6%85%E8%BF%87100%E6%97%B6%E7%9A%84%E6%82%AC%E6%8C%82%E7%BC%A9%E8%BF%9B%E9%97%AE%E9%A2%98)
  - [禁止英语单词截断换行](#%E7%A6%81%E6%AD%A2%E8%8B%B1%E8%AF%AD%E5%8D%95%E8%AF%8D%E6%88%AA%E6%96%AD%E6%8D%A2%E8%A1%8C)
  - [数字/罗马字符加粗显示](#%E6%95%B0%E5%AD%97%E7%BD%97%E9%A9%AC%E5%AD%97%E7%AC%A6%E5%8A%A0%E7%B2%97%E6%98%BE%E7%A4%BA)
  - [overleaf备注](#overleaf%E5%A4%87%E6%B3%A8)
- [常见问题](#beamer-slides-template)
- [Beamer Slides Template](#beamer-slides-template)
- [更新日志](#%E6%9B%B4%E6%96%B0%E6%97%A5%E5%BF%97)

## 使用说明

参考main.tex中关于本模板使用的各项说明，正文写法可参考[一份其实很短的 LaTeX 入门文档](https://liam.page/2014/09/08/latex-introduction/)

**注意，请尽量使用texlive 2021或之后的版本进行编译，模板仅在这些版本的latex下进行过相关测试**

### 设置论文相关信息

以下所有内容均需设置在正文开始（\begin{document}）之前

#### 学位信息设置（选择对应模板）

main.tex第一行进行设置，应用thesis-uestc模板，设置学位信息：

* bachelor：本科
* master：学硕
* promaster：专硕
* doctor：博士
* engdoctor：工程博士

操作方式如下所示：

```tex
\documentclass[master]{thesis-uestc}
```

#### 作者、导师、题目等基本信息

```tex
\title{中文题目}{English Title} % 论文题目
\author{姓名}{English Name} % 作者姓名
\setdate[submit]{2022年3月17日} % 论文提交日期，可留空
\setdate[oral]{2022年4月15日}  % 答辩日期，可留空
\setdate[confer]{2022年6月8日} % 学位授予日期，可留空
\advisor{导师姓名\chinesespace 导师职称}{English name English title}
\coAdvisor{合作导师姓名\chinesespace 导师职称}{Co advisor English name English title} % 仅专业硕士/博士使用，在扉页/英文首页添加合作导师
\school{计算机科学与工程学院(网络空间安全学院)}{School of Computer Science and Engineering(School of Cyberspace Security)} % 学院信息
\major{计算机科学与技术}{Computer Science and Technology} % 专业信息
\studentnumber{xxxxx} % 学号
\Chairman{xxxxx} % 答辩委员会主席
```

#### 设置专业学位领域（专业硕士/博士专用）

```tex
\ProfessionalDegreeArea{随便学学} % 专业硕士/博士专用：专业学位领域
```

#### 答辩委员会主席

![chairman pos](./READMEFig/chairman.png)

由于学校20220224格式规范中明确显示该内容左对齐，本模板进行了同步，若为了美学设计，请在cls文件中搜索`\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}p{4.35in}` ，并全局替换为`\centering\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}p{4.35in}`完成对该内容的居中显示。

#### 设置合作导师

##### 专业学位硕士/博士（请按照以下步骤操作）

1. 在main.tex中，对以下内容取消注释并设置：
```tex
\coAdvisor{合作导师姓名\chinesespace 导师职称}{Co advisor English name English title} % 仅专业硕士/博士使用，在扉页/英文首页添加合作导师
```
2. 在thesis-uestc.cls中修改以下内容（修改后如下所示）：
  * 1126-1127取消注释；1129行修改为12bp
    ```tex
    1126    合作导师 & {\bfseries\zh@thecoadvisor} \\
    1127    \cline{2-2}
    1128    & \fontsize{12pt}{12pt}\selectfont（姓名、职称、单位名称）
    1129    \end{tabular}  \\ [12bp]
    ```
  * 1215-1216行取消注释；
    ```tex
    1215    Co-Supervisor: & \en@thecoadvisor \\
    1216    \cline{2-2}
    ```

##### 学术学位硕士/博士（请按照以下步骤操作）

1. 在main.tex中，对以下内容取消注释并设置：
```tex
\coAdvisor{合作导师姓名\chinesespace 导师职称}{Co advisor English name English title} % 仅专业硕士/博士使用，在扉页/英文首页添加合作导师
```
2. 在thesis-uestc.cls中修改以下内容（修改后如下所示）：
  * 1008-1009取消注释；1011行修改为24bp
    ```tex
    1008    合作导师 & {\bfseries\zh@thecoadvisor} \\
    1009    \cline{2-2}
    1010    & \fontsize{12pt}{12pt}\selectfont（姓名、职称、单位名称）
    1011    \end{tabular}  \\ [24bp]
    ```
  * 1091-1092行取消注释；
    ```tex
    1091    Co-Supervisor: & \en@thecoadvisor \\
    1092    \cline{2-2}
    ```

#### 分类号、密级、UDC号

* UDC编号查询：https://udcsummary.info/php/index.php?lang=chi&pr=Y
* 分类号查询：http://pss.uestc.edu.cn:8080/chineseSearch.action

```tex
\ClassificationNumber{TP309.2} % 分类号
\ClassifiedClass{公开} % 密级
\UDCNumber{004.78} % UDC号
```

### 图、表目录设置

```tex
\thesisfigurelist % 图目录
\thesistablelist % 表目录
```

### 缩略词/符号表目录设置

注意，模板为了便于操作，对glossary设置了automake，会导致在不使用这部分功能时发生编译错误，请在注释main.tex中的`\makeglossaries`的基础上，在cls文件中取消27行的注释，并将28行注释，如下所示：

```tex
%\RequirePackage[nopostdot]{glossaries}
\RequirePackage[toc,nopostdot,style=long,automake,acronym]{glossaries}
```

在使用缩略词/符号表时,请在导言区填写缩略语条目并使能glossary宏包(如下所示,详细使用方法见[main.tex](main.tex)):

```tex
\makeglossaries % 产生缩略词表/符号表专用,不使用时请注释
\newacronym[description=逻辑卷管理器]{lvm}{LVM}{Logical Volume Manager} % 定义缩略词/符号:以本项为例,逻辑卷管理器为中文名称;lvm用于文内引用;LVM为显示的应为缩略语或符号;Logical Volume Manager为显示的英文全称/描述
```

若要添加缩略词/符号表目录,请在需要的位置进行以下设置:

```tex
% \glsaddall % 默认仅显示被正文引用的项,取消注释以显示所有已定义的缩略词/符号
\thesisglossarylist % 缩略词目录
\thesissymbollist % 符号表
```

### 使用代码模板

如下所示，使用代码环境。其中style用于指定语言进行代码高亮；caption用于设置代码段标题；label用于生成代码段标签，以便在正文中引用。这里三项参数均为非必填项（但不填style会导致没有任何格式和高亮）。
现支持的代码语言高亮包括：c++，shell，python，json，solidity

```tex
\begin{lstlisting}[style=shell, caption={xxxx},label{xxxx}]
sudo apt install xxx
\end{lstlisting}
```

### (盲审提交用)不显示作者姓名

采用以下方法进行设置（即设置为空格）

```tex
\author{$\quad$}{$\quad$}
```

### 参考文献数量超过100时的悬挂缩进问题

引入参考文献时设置间距为large（如下所示）：

```tex
\thesisbibliography[large]{reference}
```

### 禁止英语单词截断换行

在main.tex中取消注释以下内容，用于禁止文中换行处的英语单词自动截断换行。

```tex
% \tolerance=1
% \emergencystretch=\maxdimen
% \hyphenpenalty=10000
% \hbadness=10000
```

### 数字/罗马字符加粗显示

本模板中请使用`\pmb{1234}`对公式中数字/罗马字符加粗，效果如：$\pmb{1234}$

### overleaf备注

可能存在中文摘要无页码的问题，解决方案如下：
在cls文件的439和440行之间增加\setcounter{page}{1}\setcounter{pseudopage}{1}

### macOS上设置字体
如果Mac上安装了Microsoft Word，可将uestc-thesis.cls中的代码
```tex
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{STHeiti}
  \newfontfamily{\heiti@letter}{STHeiti}
```
改为
```tex
  \def\WordPath{/Applications/Microsoft Word.app/Contents/Resources/DFonts/}
  \setCJKmainfont[AutoFakeBold=true,Path=\WordPath]{SimSun.ttf}
  \newCJKfontfamily{\heiti}[Path=\WordPath]{SimHei.ttf}
  \newfontfamily{\heiti@letter}[Path=\WordPath]{SimHei.ttf}
```
## 常见问题

1. 需要更多层级的目录：[Issue 25](https://github.com/tinoryj/UESTC-Thesis-Latex-Template/issues/25)
2. 英文封面专业名称不需要双行（减少下划线）：[Issue 42](https://github.com/tinoryj/UESTC-Thesis-Latex-Template/issues/42)
3. 学院名称单行不够，需要多行：[Issue 31](https://github.com/tinoryj/UESTC-Thesis-Latex-Template/issues/31)
4. 删除空白页：请使用Adobe Acrobat等PDF软件直接删除页面。模板中的空白页为了打印而准备，电子版提交时请删除。

## Beamer Slides Template

* Slides模板位于`./slides`目录下，使用时直接参照slides中内容进行修改即可，编译链为xelate->bibtex->xelatex*2
* 改模板源自overleaf，可直接在overleaf中使用

## 更新日志

* 2022.3.17：新版cls模板提供了分类号、密级、UDC号的设置功能，使用方法如下所示(在main.tex中\begin{document}之前加入，与作者等信息等同)：
  ![UDC](READMEFig/UDCID.png)
  * UDC编号查询：https://udcsummary.info/php/index.php?lang=chi&pr=Y
* 2022.3.17：修正英文封面中学号和姓名顺序错误的问题（对调）
* 2022.3.17：修正“答辩委员会主席”后下划线长度不足的问题
* 2022.3.18：增加专业硕士专用封面：
  * 新增\ProfessionalDegreeArea{}用于设置“专业学位领域”，如下所示：
  ![UDC](READMEFig/promaster.png)
* 2022.3.18：修正页眉下划线宽度为0.75磅，修正专硕英文封面学号和姓名顺序
* 2022.3.27: 章节编号加粗（目录不加粗），目前版本完整适配20220224新标准
* 2022.4.16: 增加主要符号表，修订缩略词表各栏宽度
* 2022.5.30: 增加合作导师设置，修正“指导老师”为“指导教师”；默认展示PDF修订为专硕版本
* 2022.6.30：新增了答辩slides的beamer模板
* 2023.3.01: bug修复，更新README

## QQ讨论群

建立了QQ群便于讨论和改进模板：

![QQ Group](./READMEFig/QQGroup.jpg)
