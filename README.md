# UESTC-Thesis-Latex-Template
**20220224 format standard special edition**

**特别适配了2022年新标准**

## 使用说明

参考main.tex中关于本模板使用的各项说明，正文写法可参考[一份其实很短的 LaTeX 入门文档](https://liam.page/2014/09/08/latex-introduction/)

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
\school{计算机科学与工程学院(网络空间安全学院)}{School of Computer Science and Engineering(School of Cyberspace Security)} % 学院信息
\major{计算机科学与技术}{Computer Science and Technology} % 专业信息
\studentnumber{xxxxx} % 学号
```

#### 设置专业学位领域（专业硕士专用）

```tex
\ProfessionalDegreeArea{随便学学} % 专业硕士专用：专业学位领域
```

#### 分类号、密级、UDC号

* UDC编号查询：https://udcsummary.info/php/index.php?lang=chi&pr=Y
* 分类号查询：http://pss.uestc.edu.cn:8080/chineseSearch.action

```tex
\ClassificationNumber{TP309.2} % 分类号
\ClassifiedClass{公开} % 密级
\UDCNumber{004.78} % UDC号
```

### 图、表、缩略词目录设置

```tex
\thesisfigurelist % 图目录
\thesistablelist % 表目录
\thesisglossarylist % 缩略词目录
```

### 使用代码模板

如下所示，使用代码环境。其中style用于指定语言进行代码高亮；caption用于设置代码段标题；label用于生成代码段标签，以便在正文中引用。这里三项参数均为非必填项（但不填style会导致没有任何格式和高亮）。
现支持的代码语言高亮包括：c++，shell，python，json，solidity

```tex
\begin{lstlisting}[style=shell, caption={xxxx},label{xxxx}]
sudo apt install xxx
\end{lstlisting}
```

### 专硕设置专业学位领域

```tex
\ProfessionalDegreeArea{随便学学}
```


### 不显示作者姓名

由于目前将author设置为空会导致error，可采用以下方法进行设置（即设置为空格）

```tex
\author{$\quad$}{$\quad$}
```

### 参考文献数量超过100时的悬挂缩进问题

引入参考文献时设置间距为large（如下所示）：

```tex
\thesisbibliography[large]{reference}
```

### overleaf备注

可能存在中文摘要无页码的问题，解决方案如下：
在cls文件的439和440行之间增加\setcounter{page}{1}\setcounter{pseudopage}{1}

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
