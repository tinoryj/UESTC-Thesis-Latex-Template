\ProvidesClass{thesis-uestc}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{silence} 
\WarningsOff[everypage] % Suppression of everypage warnings

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage{xpatch}
\newcommand\uestcwarning[1]{%
  \ClassWarning{thesis-uestc}{#1}%
}

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6bp]{caption}

\RequirePackage{array}
\RequirePackage{booktabs}
\setlength{\heavyrulewidth}{0.9pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\arrayrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}

\RequirePackage{setspace}
\RequirePackage{adjustbox}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
% \RequirePackage{lmodern}
\RequirePackage{microtype}
% \RequirePackage[toc,nopostdot,style=long,acronym]{glossaries}
\RequirePackage[sort=use,nopostdot,style=long,automake,acronym]{glossaries}
% \RequirePackage{mathspec}
\RequirePackage[math-style=ISO,bold-style=ISO,warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
\RequirePackage{enumerate}
\RequirePackage{xeCJK}
\RequirePackage{xspace}
\RequirePackage{algpseudocode}
\RequirePackage{makecell}
\RequirePackage{xcolor}
\RequirePackage{ifplatform}
% Listing lstlisting -------
\definecolor{commentColor}{RGB}{53,129,34}
\definecolor{keywordColor}{RGB}{172, 62, 158}
\definecolor{stringColor}{RGB}{194, 62, 42}
\definecolor{preprocessorColor}{RGB}{114, 75, 48}
\definecolor{characterColor}{RGB}{31, 53, 207}
\definecolor{numberColor}{RGB}{166, 166, 166}
\definecolor{oglobalColor}{RGB}{97, 64, 154}
\definecolor{globalColor}{RGB}{89, 127, 134}
\definecolor{functionColor}{RGB}{56, 36, 124}
\definecolor{backgroundColor}{RGB}{249, 241, 165}
\RequirePackage{fontspec}
\RequirePackage{listings}
\RequirePackage[noadjust]{cite}

% https://tex.stackexchange.com/questions/180168/fontspec-xecjk-autofakebold-and-copyable-chinese-characters-in-pdf
% value > 0
\def\xeCJKembold{0.40}

% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}

% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol

% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}

\newCJKfontfamily{\titlefontzh}[Path=fonts/]{STZhongsong.ttf}
\newfontfamily{\titlefonten}[Path=fonts/]{timesbd.ttf}
\DeclareTextFontCommand{\emph}{\CJKfakebold{\titlefontzh}\titlefonten}

\ifwindows
  \setCJKmainfont[AutoFakeBold=4]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
  \newfontfamily{\heiti@letter}{SimHei}
  \newCJKfontfamily{\titlefont}[Path=fonts/]{STZhongsong.ttf}
  \setmainfont{Times New Roman}
  % \setmathfont[Path=./fonts/]{latinmodern-math.otf}
  \setmathfont{Times New Roman}
  \newfontfamily\codefont{Times New Roman}
\else
\ifmacosx
  \setCJKmainfont[AutoFakeBold=4]{Songti SC}
  % \newCJKfontfamily{\heiti}{STHeiti}
  % \newfontfamily{\heiti@letter}{STHeiti}
  \newCJKfontfamily{\heiti}[Path=fonts/]{fzhei.ttf}
  \newfontfamily{\heiti@letter}[Path=fonts/]{fzhei.ttf}
  \setmainfont{Times New Roman}
  % \setmathfont[Path=./fonts/]{latinmodern-math.otf}
  \setmathfont{Times New Roman}
  \newfontfamily\codefont{Times New Roman}
\else
  \setCJKmainfont[AutoFakeBold=true, Path=fonts/]{fzsong.ttf}
  \newCJKfontfamily{\heiti}[Path=fonts/]{fzhei.ttf}
  \newfontfamily{\heiti@letter}[Path=fonts/]{fzhei.ttf}
  \newCJKfontfamily{\titlefont}[Path=fonts/]{STZhongsong.ttf}
  \setmainfont[Path=fonts/,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf}
  % \setmathfont[Path=./fonts/]{latinmodern-math.otf}
  \setmathfont[Path=fonts/]{times.ttf}
  \newfontfamily\codefont[Path=fonts/]{times.ttf}
\fi
\fi



\lstdefinestyle{c++}{language=C++,
basicstyle=\sffamily\codefont,
keywordstyle=\color{keywordColor}\sffamily\codefont,
commentstyle=\color{commentColor}\sffamily\codefont,
stringstyle=\color{stringColor}\sffamily\codefont,
showstringspaces=false,
columns=fixed,keepspaces,
breaklines=true,
frameround = tttt,
framexleftmargin=8mm,
frame = trbl,
rulecolor=\color{gray}, %框架颜色设置
rulesepcolor=\color{yellow!15}, %框架阴影颜色设置
backgroundcolor = \color{yellow!5}, 
numbers=left, %在左侧显示行数, right %在右侧显示行, none, %去掉行数显示
stepnumber=1, %每两行标号一次
% numbersep=5pt, %数字右端(若为左侧显示数字)水平距离代码5pt
numberstyle=\color{numberColor}\footnotesize\codefont,
escapechar=\$,
morecomment=*[s][\color{stringColor}\sffamily\codefont]{<}{>},
morecomment=[s][\color{characterColor}\sffamily\codefont]{'}{'},
keywords=[2]{cout, cin, std, uint64_t, uint32_t},
keywordstyle = [2]{\color{oglobalColor}\sffamily\codefont},
keywords=[3]{endl, printf, scanf, setw, setfill, setbase, setprecision, time, ctime, rand, map,set,multimap,multiset, string, unordered_map,unordered_set, unordered_multiset,unordered_multimap,vector,string,list,deque, array,stack,forwared_list,iostream,memory,shared_ptr,unique_ptr, random,bitset,ostream,istream,cout,cin,endl,move,default_random_engine, uniform_int_distribution,iterator,algorithm,functional,bing,numeric},
keywordstyle = [3]{\color{functionColor}\sffamily\codefont},
keywords=[4]{\#include},
keywordstyle =[4]{\color{preprocessorColor}\ssfamily\codefont},
literate={
    {<<}{{{\color{black}<<}}}1
    {>>}{{{\color{black}>>}}}1
    {*}{{{*}}}1
    % {0}{{{\color{characterColor}0}}}1
    % {1}{{{\color{characterColor}1}}}1
    % {2}{{{\color{characterColor}2}}}1
    % {3}{{{\color{characterColor}3}}}1
    % {4}{{{\color{characterColor}4}}}1
    % {5}{{{\color{characterColor}5}}}1
    % {6}{{{\color{characterColor}6}}}1
    % {7}{{{\color{characterColor}7}}}1
    % {8}{{{\color{characterColor}8}}}1
    % {9}{{{\color{characterColor}9}}}1
    },
tabsize=4
}

\lstdefinestyle{shell}{language=bash,
basicstyle=\sffamily\codefont,
keywordstyle=\color{keywordColor}\sffamily\codefont,
commentstyle=\color{commentColor}\sffamily\codefont,
stringstyle=\color{stringColor}\sffamily\codefont,
showstringspaces=false,
columns=fixed,keepspaces,
breaklines=true,
frameround = tttt,
frame = trbl,
rulecolor=\color{gray}, %框架颜色设置
rulesepcolor=\color{yellow!15}, %框架阴影颜色设置
backgroundcolor = \color{yellow!5}, 
numbers=none,
morekeywords={chmod, sudo, apt},
tabsize=4
}

\colorlet{punct}{red!60!black}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}
\lstdefinestyle{json}{
	basicstyle=\sffamily\codefont,
  	keywordstyle=\color{keywordColor}\sffamily\codefont,
  	commentstyle=\color{commentColor}\sffamily\codefont,
  	stringstyle=\color{stringColor}\sffamily\codefont,
  	showstringspaces=false,
  	columns=fixed,keepspaces,
  	breaklines=true,
  	frameround = tttt,
  	frame = trbl,
  	rulecolor=\color{gray}, %框架颜色设置
  	rulesepcolor=\color{yellow!15}, %框架阴影颜色设置
  	backgroundcolor = \color{yellow!5}, 
  	string=[s]{"}{"},
  	comment=[l]{:\ "},
  	morecomment=[l]{:"},
  	literate=
   	*{0}{{{\color{numb}0}}}{1}
   	 {1}{{{\color{numb}1}}}{1}
   	 {2}{{{\color{numb}2}}}{1}
   	 {3}{{{\color{numb}3}}}{1}
   	 {4}{{{\color{numb}4}}}{1}
   	 {5}{{{\color{numb}5}}}{1}
   	 {6}{{{\color{numb}6}}}{1}
   	 {7}{{{\color{numb}7}}}{1}
   	 {8}{{{\color{numb}8}}}{1}
   	 {9}{{{\color{numb}9}}}{1}
   	 {:}{{{\color{punct}{:}}}}{1}
   	 {,}{{{\color{punct}{,}}}}{1}
   	 {\{}{{{\color{delim}{\{}}}}{1}
   	 {\}}{{{\color{delim}{\}}}}}{1}
   	 {[}{{{\color{delim}{[}}}}{1}
   	 {]}{{{\color{delim}{]}}}}{1},
  	tabsize=4
}

\definecolor{darkred}{rgb}{0.6,0.0,0.0}
\definecolor{darkgreen}{rgb}{0,0.50,0}
\definecolor{lightblue}{rgb}{0.0,0.42,0.91}
\definecolor{orange}{rgb}{0.99,0.48,0.13}
\definecolor{grass}{rgb}{0.18,0.80,0.18}
\definecolor{pink}{rgb}{0.97,0.15,0.45}
\lstdefinestyle{python}{ 
	basicstyle=\sffamily\codefont,
  	showstringspaces=false,
  	columns=fixed,keepspaces,
  	breaklines=true,
  	frameround = tttt,
  	frame = trbl,
	framexleftmargin=8mm,
  	rulecolor=\color{gray}, %框架颜色设置
  	rulesepcolor=\color{yellow!15}, %框架阴影颜色设置
  	backgroundcolor = \color{yellow!5}, 
	numbers=left, %在左侧显示行数, right %在右侧显示行, none, %去掉行数显示
	stepnumber=1, %每两行标号一次
  	morekeywords=[1]{import,as,assert,nonlocal,with,yield,self,True,False,None}, % Python builtin
  	morekeywords=[2]{,__init__,__add__,__mul__,__div__,__sub__,__call__,__getitem__,__setitem__,__eq__,__ne__,__nonzero__,__rmul__,__radd__,__repr__,__str__,__get__,__truediv__,__pow__,__name__,__future__,__all__,}, % magic methods
  	morekeywords=[3]{,object,type,isinstance,copy,deepcopy,zip,enumerate,reversed,list,set,len,dict,tuple,range,xrange,append,execfile,real,imag,reduce,str,repr,}, % common functions
  	morekeywords=[4]{,Exception,NameError,IndexError,SyntaxError,TypeError,ValueError,OverflowError,ZeroDivisionError,}, % errors
  	morekeywords=[5]{,ode,fsolve,sqrt,exp,sin,cos,arctan,arctan2,arccos,pi, array,norm,solve,dot,arange,isscalar,max,sum,flatten,shape,reshape,find,any,all,abs,plot,linspace,legend,quad,polyval,polyfit,hstack,concatenate,vstack,column_stack,empty,zeros,ones,rand,vander,grid,pcolor,eig,eigs,eigvals,svd,qr,tan,det,logspace,roll,min,mean,cumsum,cumprod,diff,vectorize,lstsq,cla,eye,xlabel,ylabel,squeeze,}, % numpy / math
  	commentstyle=\color{darkgreen}\slshape,
  	keywordstyle=\color{blue}\bfseries\itshape,
  	keywordstyle=[2]\color{blue}\bfseries,
  	keywordstyle=[3]\color{grass},
  	keywordstyle=[4]\color{red},
  	keywordstyle=[5]\color{orange},
  	stringstyle=\color{darkred},
  	emphstyle=\color{pink}\underbar,
}

\lstdefinestyle{solidity}{
	basicstyle=\sffamily\codefont,
  	showstringspaces=false,
  	columns=fixed,keepspaces,
  	breaklines=true,
  	frameround = tttt,
  	frame = trbl,
	framexleftmargin=8mm,
  	rulecolor=\color{gray}, %框架颜色设置
  	rulesepcolor=\color{yellow!15}, %框架阴影颜色设置
  	backgroundcolor = \color{yellow!5}, 
	numbers=left, %在左侧显示行数, right %在右侧显示行, none, %去掉行数显示
	stepnumber=1, %每两行标号一次
  	keywords={msg, true, false, catch, function, returns, if, while, do, else, case, break, require, def, throw, public, emit},
  	keywordstyle=\color{blue}\bfseries,
  	%ndkeywords={class, export, boolean, throw, implements, import, this},
  	ndkeywords={mapping, string, struct, address, uint256, map, uint, int, this, memory},
  	ndkeywordstyle=\color{darkgreen}\bfseries,
  	identifierstyle=\color{black},
  	sensitive=false,
  	comment=[l]{//},
  	morecomment=[s]{/*}{*/},
  	commentstyle=\color{darkgray}\ttfamily,
  	stringstyle=\color{red}\ttfamily,
  	morestring=[b]',
  	morestring=[b]"
   	backgroundcolor=\color{white},
   	extendedchars=true,
   	showspaces=false,
   	tabsize=4,
   	showtabs=false,
   	captionpos=b
}
% Listing over --------



% \DeclareMathAlphabet{\mathbf}{\eu@enc}{\eu@mathrm}{\bfdefault}{it}
% \DeclareMathAlphabet{\mathbd}{\eu@enc}{\eu@mathrm}{\bfdefault}{n}
% \newcommand{\bm}{\mathbf}
\newcommand{\bm}{\mathbfit}
\setlength{\baselineskip}{20pt}
\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{xurl}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}

\RequirePackage{indentfirst}
%\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}

\RequirePackage[algochapter, boxruled, linesnumbered]{algorithm2e}
\renewcommand{\algref}[1]{\hyperref[#1]{\arabic{chapter}-\arabic{algocf}}}

\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}
\RequirePackage{pdfpages}

\graphicspath{{./pic/}}

\RequirePackage[titles]{tocloft}
\RequirePackage[labelformat=simple]{subcaption}
\captionsetup[subfigure]{font=small, belowskip=6pt, width=40pt, justification=centering}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\newcommand{\floatcontinue}{\end{figure}\clearpage\begin{figure}[tb]\ContinuedFloat}

\urlstyle{rm}
\raggedbottom

% \AtBeginDocument{\pretocmd{\ref}{~}{}{}\apptocmd{\ref}{}{}{}}

\newcommand{\thesistablelist}{
  \listoftables
}

\RequirePackage[a4paper,
  inner=3cm, outer=3cm, top=3cm, bottom=3cm,
  bindingoffset=0cm]{geometry}

\setlength{\headheight}{15pt}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.75pt}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\AtBeginDocument{
	\renewcommand{\thelstlisting}{\arabic{chapter}-\arabic{lstlisting}}
}

\setlength{\floatsep}{6bp}
\setlength{\textfloatsep}{6bp}
\setlength{\intextsep}{6bp}
%\captionsetup{format=hang}
%\captionsetup{width=\textwidth - 42pt}
\captionsetup{width=\textwidth - 84pt, skip=6bp, figureposition=bottom, tableposition=top}
\captionsetup[figure]{belowskip=6bp}
\captionsetup[table]{aboveskip=6bp}
\captionsetup[lstlisting]{aboveskip=6bp, belowskip=0bp}

% 由于 LaTeX2e kernel 的问题，图表等浮动体与文字前后的距离不一致，需要进行 patch。
% 参考 https://www.zhihu.com/question/46618031、https://tex.stackexchange.com/a/40363/82731} 和 https://github.com/ustctug/ustcthesis。
\patchcmd{\@addtocurcol}%
  {\vskip \intextsep}%
  {\edef\save@first@penalty{\the\lastpenalty}\unpenalty
   \ifnum \lastpenalty = \@M  % hopefully the OR penalty
     \unpenalty
   \else
     \penalty \save@first@penalty \relax % put it back
   \fi
   \ifnum\outputpenalty <-\@Mii
     \addvspace\intextsep
     \vskip\parskip
   \else
     \addvspace\intextsep
   \fi}%
  {}{\uestcwarning{patch floating body fail}}
\patchcmd{\@addtocurcol}%
  {\vskip\intextsep \ifnum\outputpenalty <-\@Mii \vskip -\parskip\fi}%
  {\ifnum\outputpenalty <-\@Mii
     \aftergroup\vskip\aftergroup\intextsep
     \aftergroup\nointerlineskip
   \else
     \vskip\intextsep
   \fi}%
  {}{\uestcwarning{patch floating body fail}}
\patchcmd{\@getpen}{\@M}{\@Mi}
  {}{\uestcwarning{patch floating body fail}}

\AtBeginEnvironment{figure}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{table}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{tabular}{\small}

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\titleformat{\chapter}[block]
  {\centering\fontsize{15bp}{15bp}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

\titleformat{\section}[block]
  {\fontsize{14bp}{14bp}\selectfont\strong}
  {\bfseries\arabic{chapter}.\bfseries\arabic{section}}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{14bp}{14bp}\selectfont\strong}
  {\bfseries\arabic{chapter}.\bfseries\arabic{section}.\bfseries\arabic{subsection}}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12bp}{12bp}\selectfont\strong}
  {\bfseries\arabic{chapter}.\bfseries\arabic{section}.\bfseries\arabic{subsection}.\bfseries\arabic{subsubsection}}{6pt}{}

\RequirePackage[hang, perpage]{footmisc}
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{9bp}{10.8bp}\selectfont}
\renewcommand{\small}{\fontsize{10.5bp}{12.6bp}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}

\newenvironment{chineseabstract}{
  \pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{中文摘要}{chineseabstract}
  }{
    \pdfbookmark{Chinese Abstract}{chineseabstract}
  }
  \chapter*{\fontsize{15bp}{15bp}\heiti 摘\chinesespace 要}
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont 摘\hspace{0.5em}要}
  \setcounter{pseudopage}{1}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[48pt][l]{\textbf{关键词\chinesecolon}}}#1
}

\newenvironment{englishabstract}{
  %\pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{英文摘要}{englishabstract}
  }{
    \pdfbookmark{English Abstract}{englishabstract}
  }
  \chapter*{\fontsize{15bp}{15bp}\bfseries ABSTRACT}
    \fancyhf{}
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont ABSTRACT}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[2.1cm][l]{\textbf{Keywords:}}}#1
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}

\addtolength{\cftchapnumwidth}{25pt}

\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

\renewcommand{\cfttoctitlefont}{\fontsize{15bp}{15bp}\selectfont\strong}
\renewcommand\cftchapfont{\strong}

\newcommand{\zh@thetitle}{\chinesespace}
\newcommand{\zh@theauthor}{\chinesespace}
\newcommand{\zh@thedate}{\chinesespace}
\newcommand{\zh@theschool}{\chinesespace}
\newcommand{\zh@themajor}{\chinesespace}
\newcommand{\zh@theadvisor}{\chinesespace}
\newcommand{\zh@thecoadvisor}{\chinesespace}

\newcommand{\en@thetitle}{\chinesespace}
\newcommand{\en@theauthor}{\chinesespace}
\newcommand{\en@thedate}{\chinesespace}
\newcommand{\en@theschool}{\chinesespace}
\newcommand{\en@themajor}{\chinesespace}
\newcommand{\en@theadvisor}{\chinesespace}
\newcommand{\en@thecoadvisor}{\chinesespace}

\newcommand{\thestudentnumber}{\chinesespace}
\newcommand{\theClassificationNumber}{\chinesespace}
\newcommand{\theClassifiedClass}{\chinesespace}
\newcommand{\theUDCNumber}{\chinesespace}
\newcommand{\theProfessionalDegreeArea}{\chinesespace}
\newcommand{\theChairman}{\chinesespace}

\renewcommand{\title}[2]{
  \renewcommand{\zh@thetitle}{#1}
  \renewcommand{\en@thetitle}{#2}
}

\renewcommand{\author}[2]{
  \renewcommand{\zh@theauthor}{#1}
  \renewcommand{\en@theauthor}{#2}
}

\renewcommand{\date}[2]{
  \renewcommand{\zh@thedate}{#1}
  \renewcommand{\en@thedate}{#2}
}

\newcommand{\major}[2]{
  \renewcommand{\zh@themajor}{#1}
  \renewcommand{\en@themajor}{#2}
}

\newcommand{\school}[2]{
  \renewcommand{\zh@theschool}{#1}
  \renewcommand{\en@theschool}{#2}
}

\newcommand{\advisor}[2]{
  \renewcommand{\zh@theadvisor}{#1}
  \renewcommand{\en@theadvisor}{#2}
}

\newcommand{\coAdvisor}[2]{
  \renewcommand{\zh@thecoadvisor}{#1}
  \renewcommand{\en@thecoadvisor}{#2}
}

\newcommand{\studentnumber}[1]{
  \renewcommand{\thestudentnumber}{#1}
}

\newcommand{\Chairman}[1]{
  \renewcommand{\theChairman}{#1}
}

\newcommand{\ClassificationNumber}[1]{
  \renewcommand{\theClassificationNumber}{#1}
}

\newcommand{\ClassifiedClass}[1]{
  \renewcommand{\theClassifiedClass}{#1}
}

\newcommand{\UDCNumber}[1]{
  \renewcommand{\theUDCNumber}{#1}
}

\newcommand{\ProfessionalDegreeArea}[1]{
  \renewcommand{\theProfessionalDegreeArea}{#1}
}

\newcommand{\thedateoral}{}
\newcommand{\thedatesubmit}{}
\newcommand{\thedateconfer}{年\chinesespace 月}

\newcommand{\setdate}[2][]{ 
\ifthenelse{\equal{#1}{oral}}{
  \renewcommand{\thedateoral}{#2}
}{}
\ifthenelse{\equal{#1}{submit}}{
  \renewcommand{\thedatesubmit}{#2}
}{}
\ifthenelse{\equal{#1}{confer}}{
  \renewcommand{\thedateconfer}{#2}
}{}
}

\renewcommand{\strong}{\heiti}
\DeclareOption{english} {
  \newcommand{\englishbook}{}
  \renewcommand{\thechapter}{Chapter \arabic{chapter}}
  \addtolength{\cftchapnumwidth}{12pt}
  \renewcommand{\strong}{\bfseries}
}

\newcommand{\ifchinesebook}[2]{
  \ifthenelse{\isundefined{\englishbook}}{#1}{#2}
}

\DeclareOption{bachelor}{
  \def\chinesedegreename{本科}
  \def\englishdegreename{Bachelor}
  \def\chinesebooktitle{学士学位论文}
  \def\englishbooktitle{Bachelor Thesis}
  \def\englishbooktitlesubmit{Bachelor Thesis}
  \def\display@chineseheader{电子科技大学学士学位论文}
  \def\display@englishheader{Bachelor Thesis of University of
    Electronic Science and Technology of China}
}

\newcommand{\ifbachelor}[2]{
  \ifthenelse{\equal{\englishdegreename}{Bachelor}}{#1}{#2}
}

\DeclareOption{master}{
  \def\chinesedegreename{硕士}
  \def\englishdegreename{Master}
  \def\chinesebooktitle{硕士学位论文}
  \def\englishbooktitle{Master Thesis}
  \def\englishbooktitlesubmit{Master Thesis}
  \def\display@chineseheader{电子科技大学硕士学位论文}
  \def\display@englishheader{A Master Thesis Submitted to University of
    Electronic Science and Technology of China}
}

\DeclareOption{promaster}{
  \def\chinesedegreename{专业硕士}
  \def\chinesedegreenamelevel{硕士}
  \def\englishdegreename{Professional Master}
  \def\chinesebooktitle{专业学位硕士学位论文}
  \def\englishbooktitle{Master Thesis for Professional Degree}
  \def\englishbooktitlesubmit{Master Thesis}
  \def\display@chineseheader{电子科技大学硕士学位论文}
  \def\display@englishheader{A Master Thesis Submitted to University 
    of Electronic Science and Technology of China}
}

\newcommand{\ifpromaster}[2]{
  \ifthenelse{\equal{\englishdegreename}{Professional Master}}{#1}{#2}
}


\DeclareOption{doctor}{
  \def\chinesedegreename{博士}
  \def\englishdegreename{Doctor}
  \def\chinesebooktitle{博士学位论文}
  \def\englishbooktitle{Doctoral Dissertation}
  \def\englishbooktitlesubmit{Doctoral Dissertation}
  \def\display@chineseheader{电子科技大学博士学位论文}
  \def\display@englishheader{A Doctoral Dissertation Submitted to University of
    Electronic Science and Technology of China}
}

\DeclareOption{engdoctor}{
  \def\chinesedegreename{工程博士}
  \def\chinesedegreenamelevel{博士}
  \def\englishdegreename{Engineering Doctor}
  \def\chinesebooktitle{专业学位博士学位论文}
  \def\englishbooktitle{Doctoral Dissertation for Professional Degree}
  \def\englishbooktitlesubmit{Doctoral Dissertation}
  \def\display@chineseheader{电子科技大学博士学位论文}
  \def\display@englishheader{A Doctoral Dissertation Submitted to University of Electronic Science and Technology of China}
}

\newcommand{\ifengdoctor}[2]{
  \ifthenelse{\equal{\englishdegreename}{Engineering Doctor}}{#1}{#2}
}

\ExecuteOptions{master}

\ProcessOptions\relax

\ifchinesebook{
  \renewcommand{\contentsname}{目\hspace{6pt}录}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\lstlistingname}{代码}
  \renewcommand{\listfigurename}{图目录}
  \renewcommand{\listtablename}{表目录}
}{}

\setlength{\cftfigindent}{0pt}

\pretocmd{\listoffigures}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont\listfigurename}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
  \ifchinesebook{
    \addtolength{\cftfignumwidth}{12pt}
    \renewcommand{\cftfigpresnum}{\figurename}
  }{
    \addtolength{\cftfignumwidth}{32pt}
    \renewcommand{\cftfigpresnum}{\figurename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\newcommand{\thesisfigurelist}{
  \listoffigures
}

\setlength{\cfttabindent}{0pt}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont\listtablename}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
  
  \ifchinesebook{
    \addtolength{\cfttabnumwidth}{12pt}
    \renewcommand{\cfttabpresnum}{\tablename}
  }{
    \addtolength{\cfttabnumwidth}{32pt}
    \renewcommand{\cfttabpresnum}{\tablename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont\listtablename}
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
  
  \ifchinesebook{
    \addtolength{\cfttabnumwidth}{12pt}
    \renewcommand{\cfttabpresnum}{\tablename}
  }{
    \addtolength{\cfttabnumwidth}{32pt}
    \renewcommand{\cfttabpresnum}{\tablename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\ifchinesebook{
  \SetAlgorithmName{算法}{算法}{算法列表}
}{
  \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
}
\renewcommand\thealgocf{\arabic{chapter}-\arabic{algocf}}
\SetAlgoCaptionSeparator{\null}
\AtBeginEnvironment{algorithm}{\vspace{9pt}}
\AfterEndEnvironment{algorithm}{\vspace{9pt}}

%\renewcommand*{\glossarypreamble}{\vspace{-9pt}}
\newacronymstyle{acronym-uestc}{
  \ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}
}{
  \renewcommand*{\GenericAcronymFields}{
    first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},
    description={\the\glslongtok}}
  \renewcommand*{\genacrfullformat}[2]{%
    \glsentrydesc{##1}~(\glsentrylong{##1},\space%
    \glsentryshort{##1})%
  }
  \renewcommand*{\acronymentry}[1]{%
    \acronymfont{\glsentryshort{##1}}%
  }
}
\setacronymstyle{acronym-uestc}

\newglossarystyle{uestc-chinese}{
  \renewenvironment{theglossary}%
  {\begin{longtable}{p{20mm}p{90mm}p{6.5em}}}%
    {\end{longtable}}%
  \renewcommand*{\glossaryheader}{%
    \heiti 英文缩写 &\heiti 英文全称 &
    \heiti 中文全称 \tabularnewline\endhead}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glsentrylong{##1} & \glsentrydesc{##1}\tabularnewline
  }
  \renewcommand*{\subglossentry}[3]{
    \glossentry{##2}{##3}}
}


\newglossarystyle{uestc-english}{
  \setlength\glsdescwidth{.7\textwidth}
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{\glsdescwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\newglossarystyle{uestc-chinese-symbol}{
  \renewenvironment{theglossary}%
  {\begin{longtable}{p{20mm}p{108mm}p{12mm}<{\centering}}}%
  {\end{longtable}}%
  %设置没有表头, 以及内容
  \renewcommand*{\glossaryheader}{%
    \heiti 符号 &\heiti 说明 &
    \heiti 页码 \tabularnewline\endhead}%
  %设置分组间没有表头：
  \renewcommand*{\glsgroupheading}[1]{}%
  %主条目第一列名称，第二列说明，第三列页码：
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glossentrydesc{##1} & ##2 \tabularnewline
  }
  %子条目第一列空置，第二列说明，第三列页码：
  \renewcommand*{\subglossentry}[3]{
    &
    \glssubentryitem{##2}%
    \glstarget{##2}{\strut}\glossentrydesc{##2} &
    ##3\tabularnewline
  }%
  %定义分组间空白:
  \renewcommand*{\glsgroupskip}{%
  \ifglsnogroupskip\else & &\tabularnewline\fi}%
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{
  \newpage 
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont 缩略词表}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{缩略词表}{acronyms}
    \printglossary[type=\acronymtype, style=uestc-chinese, title={\protect\centering 缩略词表}, nonumberlist, nogroupskip]
  }{
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont Glossary}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Acronyms}{acronyms}
    \printglossary[type=\acronymtype, style=uestc-english, title={\protect\centering Acronyms}, nonumberlist, nogroupskip]
  }
  \newpage
}

\newcommand{\thesissymbollist}{
  \newpage 
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont 主要符号表}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{主要符号表}{Symbols}
    \printglossary[style=uestc-chinese-symbol, title={\protect\centering 主要符号表}, nogroupskip]
  }{
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont Symbols}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Symbols}{Symbols}
    \printglossary[style=uestc-english, title={\protect\centering Symbols}, nogroupskip]
  }
  \newpage
}

\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{9pt}
\ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
\begin{center}
  \ifbachelor{\includegraphics{bachelor_font.pdf} \\}{
    \hspace{-0.9em}\fontsize{22bp}{22bp}\selectfont 电\hspace{0.45em}子\hspace{0.45em}科\hspace{0.45em}技\hspace{0.45em}大\hspace{0.45em}学\\}
  \fontsize{12bp}{12bp}\selectfont UNIVERSITY OF ELECTRONIC SCIENCE
    AND TECHNOLOGY OF CHINA \\[36bp]
  \ifbachelor{\fontsize{42bp}{42bp}\selectfont{\bfseries\chinesebooktitle} \\[6bp]}{
    \fontsize{42bp}{42bp}\selectfont\chinesebooktitle \\[6bp]}
  \fontsize{16bp}{16bp}\selectfont
    \textnormal{\MakeUppercase{\englishbooktitle}} \\[48bp]
  \ifbachelor{
    %\vspace{0.4cm}
    \includegraphics[width=180bp, height=180bp]{logo.pdf} \\[40bp]
  }{\includegraphics[width=180bp, height=180bp]{logo.pdf} \\[40bp]}
  \begin{tabular}{lp{10cm}}
    \hspace{0.12cm}\bfseries\fontsize{18bp}{18bp}\selectfont 论文题目 & \multirow[t]{2}{10cm}{
        \centering
          \bfseries\fontsize{18bp}{18bp}\selectfont
          \zh@thetitle
    } \\
    \cline{2-2}
            & \\
    \cline{2-2}
  \end{tabular}\hspace*{\fill} \\[\baselineskip]
  \ifpromaster{
  \begin{tabular}{>{\bfseries\fontsize{16bp}{16bp}\selectfont}l
      >{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont}
      p{9cm}p{0cm}}
    \hspace{0.55cm}\scalebox{0.66}[1]{专业学位类别} & \zh@themajor &\\
    \cline{2-2}
    \hspace{0.55cm}学\chinesespace\chinesespace 号 & \thestudentnumber & \\
    \cline{2-2}
    \hspace{0.55cm}作者姓名 & \zh@theauthor &\\
    \cline{2-2}
    \hspace{0.55cm}指导教师 & \zh@theadvisor &\\
    \cline{2-2}
    \hspace{0.55cm}学\chinesespace\chinesespace 院 & \zh@theschool &\\
    \cline{2-2}
  \end{tabular}
  }
  {
  \begin{tabular}{>{\bfseries\fontsize{16bp}{16bp}\selectfont}l
      >{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont}
      p{9cm}p{0cm}}
    \hspace{0.55cm}学科专业 & \zh@themajor &\\
    \cline{2-2}
    \hspace{0.55cm}学\chinesespace\chinesespace 号 & \thestudentnumber & \\
    \cline{2-2}
    \hspace{0.55cm}作者姓名 & \zh@theauthor &\\
    \cline{2-2}
    \hspace{0.55cm}指导教师 & \zh@theadvisor &\\
    \cline{2-2}
    \hspace{0.55cm}学\chinesespace\chinesespace 院 & \zh@theschool &\\
    \cline{2-2}
  \end{tabular}
  }

\end{center}

\ifbachelor{}{
\ifpromaster{\thetitlepageforprodegree}{
  \ifengdoctor{\thetitlepageforprodegree}{\thetitlepage}
  }  
}
\newpage
\setcounter{page}{0}
\setlength{\extrarowheight}{2pt}
}

\newlength\myheight
\newcommand\Mysavedprevdepth{}%
\newcommand\UnderlineCentered[3]{%
  \begin{adjustbox}{minipage=[t]{\dimexpr#1\relax},gstore totalheight=\myheight,margin=0pt}%
    \centering\leavevmode#3\par\xdef\Mysavedprevdepth{\the\prevdepth}%
  \end{adjustbox}%s
  \hspace*{-\dimexpr#1\relax}%
  \begin{adjustbox}{minipage=[t][\myheight]{\dimexpr#1\relax},margin=0pt}%
    \vphantom{Eg}\lower\dimexpr#2\relax\hbox to\hsize{\leaders\hrule\hfill\kern0pt}\par
    \kern-\dimexpr#2\relax
    \xleaders\vbox to\baselineskip {\vfill\hbox{\lower\dimexpr#2\relax\hbox to\hsize{\leaders\hrule\hfill\kern0pt}}\kern-\dimexpr#2\relax}\vfill
    \kern\Mysavedprevdepth
  \end{adjustbox}%
}%


\newcommand{\thetitlepage}{
  \newpage
  \thispagestyle{empty}


\noindent 分类号 \hspace{0.68em}\UnderlineCentered{2.405in}{3pt}{\theClassificationNumber} \hspace{0.50em} 密级 \hspace{0.50em} \UnderlineCentered{2.4in}{3pt}{\theClassifiedClass} \\[5bp]
UDC\textsuperscript{ 注1} \UnderlineCentered{2.41in}{3pt}{\theUDCNumber} \\[0bp]

\begin{center}
  \fontsize{36bp}{36bp}\CJKfakebold{{\titlefontzh{
    学\chinesespace 位\chinesespace 论\chinesespace 文
  }}} \\[30bp]

  % \fontsize{18bp}{18bp}\selectfont{\bfseries\zh@thetitle} \\
  \fontsize{18bp}{18bp}\emph{\zh@thetitle} \\
  \vspace{-15pt}
  \rule{6.05in}{.5pt} \\
  \fontsize{12bp}{12bp}\selectfont（题名和副题名）\\[24bp]
  \fontsize{16bp}{16bp}\selectfont{\bfseries\zh@theauthor} \\
  \vspace{-15pt}
  \rule{2.0in}{.5pt} \\
  \fontsize{12bp}{12bp}\selectfont（作者姓名） \\[40bp]

  \hspace{-2em}
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{16bp}{16bp}\selectfont}
      p{9.8cm}}
      指导教师 & {\bfseries\zh@theadvisor} \\
    \cline{2-2}
      & {\bfseries 电子科技大学 \qquad 成\chinesespace 都} \\
    \cline{2-2}
    %   合作导师 & {\bfseries\zh@thecoadvisor} \\
    % \cline{2-2}
    & \fontsize{12bp}{12bp}\selectfont{\hspace*{-2.5em}（姓名、职称、单位名称）}
  \end{tabular} \\[76bp]
\end{center}

  \noindent
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.60in}
      >{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{2.12in}}
      申请学位级别 & \chinesedegreename &
      学科专业 & \zh@themajor \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.60in}
      >{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.785in}}
      提交论文日期 & \thedatesubmit &
      论文答辩日期 & \thedateoral \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{4.22in}}
      学位授予单位和日期 & 电子科技大学 \chinesespace{}\chinesespace{}\chinesespace{}\chinesespace{}\chinesespace{}\chinesespace{} \thedateconfer \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{4.55in}}
      答辩委员会主席 & \theChairman\\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\heiti\selectfont}
      p{5.22in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}

\vspace{0.44in}
\noindent
\hspace{6bp}{\fontsize{10.5bp}{10.5bp}\selectfont 注1：注明《国际十进分类法UDC》的类号。}

\newpage
\thispagestyle{empty}\null
\par{\vspace{2.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{18bp}{20bp}\selectfont
  \bfseries\centering\en@thetitle
\end{minipage}
\par{\vspace{6.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{15bp}{17bp}\selectfont
  \centering\noindent
  A \englishbooktitlesubmit{} Submitted to \\
  University of Electronic Science and Technology of China
\end{minipage}
\par{\vspace{3.2cm}}
\noindent
\begin{tabular}{>{\fontsize{16bp}{16bp}\selectfont}r
  >{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont}
  p{11cm}}
  Discipline: & \multirow[t]{2}{*}{\en@themajor} \\
\cline{2-2}
& \\
\cline{2-2}
Student ID: & \thestudentnumber \\
\cline{2-2}
Author: & \en@theauthor \\
\cline{2-2}
Supervisor: & \en@theadvisor \\
\cline{2-2}
% Co-Supervisor: & \en@thecoadvisor \\
% \cline{2-2}
School: & \en@theschool \\
\cline{2-2}
\end{tabular}
}

\newcommand{\thetitlepageforprodegree}{
  \newpage
  \thispagestyle{empty}

\noindent 分类号 \hspace{0.68em}\UnderlineCentered{2.405in}{3pt}{\theClassificationNumber} \hspace{0.50em} 密级 \hspace{0.50em} \UnderlineCentered{2.4in}{3pt}{\theClassifiedClass} \\[5bp]
UDC\textsuperscript{注1} \UnderlineCentered{2.41in}{3pt}{\theUDCNumber} \\[0bp]

\begin{center}
  \fontsize{36bp}{36bp}\CJKfakebold{{\titlefontzh{
    学\chinesespace 位\chinesespace 论\chinesespace 文
  }}} \\[30bp]
  % \fontsize{18bp}{18bp}\selectfont{\bfseries\zh@thetitle} \\
  \fontsize{18bp}{18bp}\emph{\zh@thetitle} \\
  \vspace{-15pt}
  \rule{6.05in}{.5pt} \\
  \fontsize{12bp}{12bp}\selectfont（题名和副题名）\\[24bp]
  \fontsize{16bp}{16bp}\selectfont{\bfseries\zh@theauthor} \\
  \vspace{-15pt}
  \rule{2.0in}{.5pt} \\
  \fontsize{12bp}{12bp}\selectfont（作者姓名） \\[40bp]

  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{16bp}{16bp}\selectfont}
      p{4.45in}}
      指导教师 & {\bfseries\zh@theadvisor} \\
    \cline{2-2}
      & {\bfseries 电子科技大学\chinesespace 成都} \\
    \cline{2-2}
    %   合作导师 & {\bfseries\zh@thecoadvisor} \\
    % \cline{2-2}
    & \fontsize{12bp}{12bp}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\ [76bp]
\end{center}

  \noindent
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.60in}
      >{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.79in}}
      申请学位级别 & \chinesedegreenamelevel &
      专业学位类别 & \zh@themajor \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{4.72in}}
      专业学位领域 & \theProfessionalDegreeArea \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.60in}
      >{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{1.785in}}
      提交论文日期 & \thedatesubmit &
      论文答辩日期 & \thedateoral \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{4.22in}}
      学位授予单位和日期 & 电子科技大学 \chinesespace{}\chinesespace{}\chinesespace{}\chinesespace{}\chinesespace{}\chinesespace{} \thedateconfer \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\arraybackslash\fontsize{14bp}{14bp}\bfseries\selectfont}
      p{4.55in}}
      答辩委员会主席 & \theChairman\\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12bp}{12bp}\selectfont}l
      >{\centering\arraybackslash\fontsize{14bp}{14bp}\heiti\selectfont}
      p{5.22in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}

\vspace{0.44in}
\noindent
\hspace{6bp}{\fontsize{10.5bp}{10.5bp}\selectfont 注1：注明《国际十进分类法UDC》的类号。}

\newpage
\thispagestyle{empty}\null
\par{\vspace{2.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{18bp}{20bp}\selectfont
  \bfseries\centering\en@thetitle
\end{minipage}
\par{\vspace{6.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{15bp}{17bp}\selectfont
  \centering\noindent
  A \englishbooktitlesubmit{} Submitted to \\
  University of Electronic Science and Technology of China
\end{minipage}
\par{\vspace{3.2cm}}
\noindent
\begin{tabular}{>{\fontsize{16bp}{16bp}\selectfont}r
  >{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont}
  p{11cm}}
  Discipline: & \multirow[t]{2}{*}{\en@themajor} \\
\cline{2-2}
& \\
\cline{2-2}
Student ID: & \thestudentnumber \\
\cline{2-2}
Author: & \en@theauthor \\
\cline{2-2}
Supervisor: & \en@theadvisor \\
\cline{2-2}
% Co-Supervisor: & \en@thecoadvisor \\
% \cline{2-2}
School: & \en@theschool \\
\cline{2-2}
\end{tabular}
}

\newcommand{\bindpdfcover}[1]{
  \ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
  \includepdf[pages=-]{#1}
  \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\newcommand{\originalitydeclaration}{
\newpage
\thispagestyle{empty}
\begin{spacing}{2.14}
  \ifchinesebook{\pdfbookmark{独创性声明}{originalitydeclaration}}
    {\pdfbookmark{Originality Declaration}{originalitydeclaration}}
  \noindent\begin{center}
  \fontsize{18bp}{20bp}\selectfont\bfseries 独创性声明
  \end{center}
    \par{\fontsize{14.04pt}{16.848pt}\selectfont\noindent\null\hspace{28pt}%
    本人声明所呈交的学位论文是本人在导师指导下进行的研究工作%
    及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，%
    论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得%
    电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一%
    同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明%
    并表示谢意。}
  \\[14.04pt]
  \fontsize{14.04pt}{14.04pt}\selectfont\noindent\null\hspace{35pt}作者签名：\rule[-3pt]{4.1cm}{0.5pt}\hspace{42pt}%
  日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日 \\
  \vspace{-0.4cm}
  \noindent\begin{center}
    \fontsize{18bp}{20bp}\selectfont\bfseries 论文使用授权
  \end{center}
  \par{\fontsize{14.04pt}{16pt}\selectfont\noindent\null\hspace{28pt}%
    本学位论文作者完全了解电子科技大学有关保留、使用学位论文的规定，同意学校有权保留并向国家有关部门或机构送交论文的复印件和数字文档，允许论文被查阅。本人授权电子科技大学可以将学位论文的全部或部分内容编入有关数据库进行检索及下载，可以采用影印、扫描等复制手段保存、汇编学位论文。}
  \par{\fontsize{14.04pt}{16pt}\selectfont\noindent\null\hspace{28pt}
  \chineseleftparenthesis%
  涉密的学位论文须按照国家及学校相关规定管理，在解密后适用于本授权。%
  \chineserightparenthesis} \\[14.04pt]
  \fontsize{14.04pt}{16pt}\selectfont\noindent\null\hspace{35pt}作者签名：\rule[-3pt]{4.1cm}{0.5pt}\hspace{12pt}%
  导师签名：\rule[-3pt]{4.1cm}{0.5pt} \\
  \null\hspace{259pt} 日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日
\end{spacing}
\blankpage
\newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\newcommand{\signatureofdeclaration}[1]{
  \includepdf[pages=-]{#1}
  \blankpage
  \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\newcommand{\insertPDFPage}[1]{
  \includepdf[pages=-]{#1}
}

\setlength{\extrarowheight}{2pt}

\newcommand{\standardheader}{
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[CE]{\fontsize{10.5bp}{12.6bp}\selectfont\display@chineseheader}
    \fancyhead[CO]{\fontsize{10.5bp}{12.6bp}\selectfont\leftmark}
  }{
    \fancyhead[CE]{\fontsize{10.5bp}{12.6bp}\selectfont\nouppercase\display@englishheader}
    \fancyhead[CO]{\fontsize{10.5bp}{12.6bp}\selectfont\nouppercase\leftmark}
  }
  \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
  \newpage
  \checkoddpage
  \ifoddpage
      \newpage
    \else
      \blankpage
    \fi
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont 目\hspace{0.5em}录}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{目录}{toc}
  }{
    \fancyhead[C]{\fontsize{10.5bp}{12.6bp}\selectfont Contents}
    \fancyfoot[CE,CO]{\fontsize{9bp}{10.8bp}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Contents}{toc}
  }
}{}{}

\newcommand{\thesistableofcontents}{
  \tableofcontents
}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace{5.25pt}#1}{}}

\newcommand{\thesisacknowledgement}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \ifchinesebook{
    \chapter*{致\hspace{12pt}谢}
    \addcontentsline{toc}{chapter}{致\hspace{12pt}谢}
    \markboth{致谢}{致谢}
  }{
    \chapter*{Acknowledgements}
    \addcontentsline{toc}{chapter}{Acknowledgements}
    \markboth{Acknowledgements}{Acknowledgements}
  }
  \thispagestyle{fancy}
}

\newcommand{\thesiscontent}{
  \newpage
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardheader
  \pagenumbering{arabic}
}

\pretocmd{\@chapter}{
  \ifdefined\@BODY
  \else
  \ifnum\value{chapter}=0
      \thesiscontent
    \fi
  \fi
}{}{}

\apptocmd{\@chapter}{
  \ifdefined\@BODY
  \else
    \ifnum\value{chapter}=1
      \ifchinesebook{\chaptermark{绪论}}{\chaptermark{Introduction}}
      \setcounter{page}{1}
    \fi
  \fi
  \def\@BODY{\null}
}{}{}

\newcommand{\thesischapterexordium}{
  \ifchinesebook{
    \chapter{绪\hspace{6pt}论}
  }{
    \chapter{Introduction}
  }
}

%\renewcommand*{\l@chapter}{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand{\thesisappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \ifchinesebook{}{\addtocontents{toc}{\protect\addtolength{\cftchapnumwidth}{12pt}}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15bp}{15bp}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5pt}{}
  \ifchinesebook{
    \renewcommand{\thechapter}{附录\Alph{chapter}}
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\thechapter}{Appendix \Alph{chapter}}
    \renewcommand{\appendixname}{Appendix}
  }

  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
  \renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
  \renewcommand{\thelstlisting}{\alph{chapter}-\arabic{lstlisting}}
  \renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
  \renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
  \renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
  \renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
  \renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
  \renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
  \renewcommand{\theexample}{\alph{chapter}.\arabic{example}}
}

\newcommand{\thesissingleappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15bp}{15bp}\selectfont\strong\thispagestyle{fancy}}{附\hspace{12pt}录}{7.5pt}{}
  %\renewcommand{\thechapter}{附\hspace{12pt}录}
  \ifchinesebook{
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\appendixname}{Appendix}
  }
  
  \renewcommand{\thesection}{A.\arabic{section}}
  
  \renewcommand{\theequation}{a-\arabic{equation}}
  \renewcommand{\thetable}{a-\arabic{table}}
  \renewcommand{\thelstlisting}{a-\arabic{lstlisting}}
  \renewcommand{\thefigure}{a-\arabic{figure}}
  \renewcommand{\thetheorem}{a.\arabic{theorem}}
  \renewcommand{\theaxiom}{a.\arabic{axiom}}
  \renewcommand{\thecorollary}{a.\arabic{corollary}}
  \renewcommand{\thelemma}{a.\arabic{lemma}}
  \renewcommand{\thedefinition}{a.\arabic{definition}}
  \renewcommand{\theexample}{a.\arabic{example}}
  
  \ifchinesebook{
    \chapter*{附\hspace{12pt}录}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
  }{
    \chapter*{Appendix}
    \addcontentsline{toc}{chapter}{Appendix}
    \markboth{Appendix}{Appendix}
  }
}

\ifchinesebook{
  \newcommand{\translation@originaltitle}{外文资料原文}
  \newcommand{\translation@chinesetitle}{外文资料译文}
}{
  \newcommand{\translation@originaltitle}{Original Text for Translation}
  \newcommand{\translation@chinesetitle}{Translated Text in Chinese}
}

\newcommand{\thesistranslationoriginal}{
  \interlinepenalty=0
  \chapter*{\translation@originaltitle}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{\translation@originaltitle}
    \markboth{\translation@originaltitle}{\translation@originaltitle}
    \thispagestyle{fancy}
    \hypersetup{bookmarksdepth=0} 
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
	\renewcommand{\thelstlisting}{\arabic{lstlisting}}
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
	\renewcommand{\lstlistingname}{List}
}

\newcommand{\thesistranslationchinese}{
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \chapter*{\translation@chinesetitle}
  \renewcommand\thesection{\arabic{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{\translation@chinesetitle}
    \markboth{\translation@chinesetitle}{\translation@chinesetitle}
    \thispagestyle{fancy}
    \hypersetup{bookmarksdepth=0} 
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
	\renewcommand{\thelstlisting}{\arabic{lstlisting}}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
	\renewcommand{\lstlistingname}{代码}
}

\ifchinesebook{
  \newcommand{\thesisaccomplishtitle}{攻读\chinesedegreename{}学位期间取得的成果}
  \newcommand{\thesisbibname}{参考文献}
}{
  \newcommand{\thesisaccomplishtitle}{Research Results Obtained During the Study for \englishdegreename{} Degree}
  \newcommand{\thesisbibname}{References}
}

\renewcommand{\bibname}{\thesisbibname}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\newenvironment{thesisthebibliography}{
  \begin{thebibliography}{lo}
    \interlinepenalty=10000
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
  \end{thebibliography}
}

\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000
  \begin{spacing}{1.667}
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}

\newcommand{\bstlabelmark}{lo}
\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
    \equal{#1}{large}
  }{
    \setlength{\labelsep}{3pt}
    \renewcommand{\bstlabelmark}{loo}
    \bibliographystyle{thesis-uestc}
    \bibliography{#2}
    \setlength{\labelsep}{6pt}
  }{
    \bibliographystyle{thesis-uestc}
    \bibliography{#2}
  }
}

\newcommand{\thesisbibliography}{\thesisloadbibliography}

\newcites{accomplish}{\thesisaccomplishtitle}

\newenvironment{thesistheaccomplish}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
  \setcounter{section}{0}
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \begin{thebibliography}{lo}
  \interlinepenalty=10000
  \setlength{\itemsep}{0bp}\setlength{\parskip}{0pt}
  \begin{spacing}{1.667}
  \thispagestyle{fancy}
  \small
}{
  \end{spacing}
  \end{thebibliography}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisloadaccomplish}[1]{
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \renewcommand{\bstlabelmark}{lo}
  \thispagestyle{fancy}
  \begin{spacing}{1.667}
  \bibliographystyleaccomplish{thesis-uestc}
  \bibliographyaccomplish{#1}
  \end{spacing}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisaccomplish}{\thesisloadaccomplish}

\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\strong}{}{ }{}
\theoremstyle{dotless}
%\renewcommand\@upn{\selectfont\heiti@letter}

\ifchinesebook{
  \newtheorem{theorem}{定理}[chapter]
  \newtheorem{axiom}[theorem]{公理}
  \newtheorem{corollary}[theorem]{推论}
  \newtheorem{lemma}[theorem]{引理}
  \newtheorem{definition}[theorem]{定义}
  \newtheorem{example}[theorem]{例子}
  \newtheorem{proposition}[theorem]{命题}
}{
  \newtheorem{theorem}{Theorem}[chapter]
  \newtheorem{axiom}[theorem]{Axiom}
  \newtheorem{corollary}[theorem]{Corollary}
  \newtheorem{lemma}[theorem]{Lemma}
  \newtheorem{definition}[theorem]{Definition}
  \newtheorem{example}[theorem]{Example}
  \newtheorem{proposition}[theorem]{Proposition}
}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\ifchinesebook{
  \renewcommand{\proofname}{证明}
}{}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
    \strong
  #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}
    
\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}\kern\z@}
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{6pt}
  \setlength{\belowdisplayskip}{6pt}
  \setlength{\belowdisplayshortskip}{6pt}
  \setlength{\abovedisplayshortskip}{6pt}

  \let\mathbb\relax
  \DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n}
  % Replace Maths blackboard bold font to latex default font

  \let\mathcal\relax
  \DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}
  % Replace Maths handwriting font to latex default font
  
  \allowdisplaybreaks[4] % Allowing mathematical formulas to span pages
}

\endinput
