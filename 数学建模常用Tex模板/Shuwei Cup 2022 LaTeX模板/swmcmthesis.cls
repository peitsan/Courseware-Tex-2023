% !Mode:: "TeX:UTF-8"
%% 
%% 2020 数维杯数学建模LaTeX模版的类文件
%%
%% swmcmthesis.cls
%% V1.0
%% 2020/04/08
%% by LaTeXStudio.net
%% see http://www.latexstudio.net/
%% for current contact information.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{swmcmthesis}[2019/11/05 v1.0 LaTeX Template for SWMCM by latexstudio.net]
%% Inital Code
\newif\if@swmcm@bwprint\@swmcm@bwprintfalse
\newif\if@swmcm@preface\@swmcm@prefacetrue
% tokens definition
%%%% 承诺书
\newcommand*\swmcm@tokens@abstract{}
\newcommand\swmcm@tokens@keywords{}
\newcommand*\swmcm@tokens@tihao{}
\newcommand*\swmcm@tokens@baominghao{}
\newcommand*\swmcm@tokens@schoolname{}
\newcommand*\swmcm@tokens@membera{}
\newcommand*\swmcm@tokens@memberb{}
\newcommand*\swmcm@tokens@memberc{}
\newcommand*\swmcm@tokens@supervisor{}
\newcommand*\swmcm@tokens@yearinput{}
\newcommand*\swmcm@tokens@monthinput{}
\newcommand*\swmcm@tokens@dayinput{}
%%%% 编号专用页
% 没有
%% Declaration of Options
\DeclareOption{colorprint}{\@swmcm@bwprintfalse}
\DeclareOption{withoutpreface}{\@swmcm@prefacefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%% Executing of Options
\ExecuteOptions{colorprint}
\ProcessOptions\relax
%% Loading Class
\LoadClass[a4paper,12pt]{article}

%% Loading Package
\RequirePackage{ifxetex}

% 页面布局
\RequirePackage{geometry}
%% Document Layout
% 页面布局
\geometry{top=25.4mm,bottom=25.4mm,left=25mm,headsep=5mm,right=25mm}
% \renewcommand*{\baselinestretch}{1.38}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{CJKnumb}
\RequirePackage{titletoc}
% 设置颜色
\RequirePackage[x11names,svgnames,dvipsnames]{xcolor}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array,lastpage}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
\def\mcm@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname mcm@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\mcm@define@term{keywords}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
 
\RequirePackage{lipsum}
\RequirePackage{url}
\RequirePackage{mwe}

% \ifxetex 
% \setmainfont{Times New Roman}
% \setCJKmainfont[AutoFakeBold = {2.15}]{SimSun}
% \setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
% \newcommand*{\song}{\CJKfamily{song}}
% \else
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
% \fi

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}
 
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
\RequirePackage{enumitem}
% 下划线
\RequirePackage{ulem}
% pdf文件插入
\RequirePackage{pdfpages}
% 尺寸计算
\RequirePackage{calc}

\RequirePackage[titletoc,title]{appendix}
\RequirePackage{subfigure}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{cleveref}

% %%% crefformat settings
% \crefformat{figure}{#2图~#1#3}
% \crefrangeformat{figure}{图~(#3#1#4)\;\~{}\;(#5#2#6)}
% \crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

% \crefformat{table}{#2表#1#3}
% \crefrangeformat{table}{表(#3#1#4)\;\~{}\;(#5#2#6)}
% \crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\swmcm@oldtabular\tabular
\let\swmcm@endoldtabular\endtabular
\renewenvironment{tabular}%
	{\bgroup%
	\renewcommand{\arraystretch}{1.3}%
	\swmcm@oldtabular}%
	{\swmcm@endoldtabular\egroup}
% 设置字体
\newcommand{\team}{\swmcm@cap@cansaiduihaoname\ \#\ \swmcm@tokens@baominghao}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{\small \team}
\rhead{\small page}

\renewcommand{\headrulewidth}{1pt}% 2pt header rule
\renewcommand{\headrule}{\vskip-5pt\hbox to\headwidth{\leaders\hrule height \headrulewidth\hfill}}

% 数学环境, 定理等设置
\newtheorem{definition}{\swmcm@cap@definition}
\newtheorem{theorem}{\swmcm@cap@theorem}
\newtheorem{lemma}{\swmcm@cap@lemma}
\newtheorem{corollary}{\swmcm@cap@corollary}
\newtheorem{assumption}{\swmcm@cap@assumption}
\newtheorem{conjecture}{\swmcm@cap@conjecture}
\newtheorem{axiom}{\swmcm@cap@axiom}
\newtheorem{principle}{\swmcm@cap@principle}
\newtheorem{problem}{\swmcm@cap@problem}
%\newtheorem{example}{\swmcm@cap@example}
\newtheorem{proof}{\swmcm@cap@proof}
\newtheorem{solution}{\swmcm@cap@solution}

% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
 \renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}
% 图表标题
\DeclareCaptionFont{minusfour}{\small}
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=space, % 分隔符是一个空格
	font={minusfour,bf}, % 图的字体, 宋体小四
	position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={minusfour,bf}, % 表的字体, 宋体小四
	position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 列表环境设置
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=2em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}


\lstnewenvironment{tcode}
  {
    \lstset{basicstyle = \small\ttfamily,
        language=TeX,
        tabsize = 4,
        frame = single,
        escapechar = `,
        breaklines = true,
        breakatwhitespace = true,
        frameround = tttt,
    }
  }
  {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Document Markup



% 生成封面, 使用\maketitle
\renewcommand{\maketitle}{\par
\pdfbookmark[1]{titlepage}{titlepage}
%\chead{\small\swmcm@numberpage@string@summaryanddate\\\swmcm@numberpage@string@titlea\\ - Team \swmcm@tokens@baominghao}
	\begingroup
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  % \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  % \global\let\date\relax
  \global\let\and\relax
  \clearpage
\chead{}
\rhead{Page \thepage\ of \pageref{LastPage}}
}
\def\@maketitle{%
  \thispagestyle{empty}
  \mbox{}\\[-28mm]
  \begin{flushleft}%
    \parbox{.3\textwidth}{\centering\linespread{0.8}%
        \bfseries\swmcm@commit@string@problemchosen\par
        \LARGE\bfseries\color{red}\swmcm@tokens@tihao}
    \hfill
    \parbox{.3\textwidth}{\centering\linespread{0.9}%
        \bfseries\@date\par
        \swmcm@numberpage@string@titlea\par
        \swmcm@numberpage@string@sumsheet
    }
    \hfill
    \parbox{.3\textwidth}{\centering\linespread{0.8}%
        \bfseries\swmcm@commit@string@signupnum \par
        \LARGE\bfseries\color{red}\swmcm@tokens@baominghao}\par\smallskip
  {%\color{gray}
      \hbox to\linewidth{\leaders\hrule height 1.5pt\hfill}}
  \end{flushleft}
  \centerline{\bfseries\Large\swmcm@numberpage@string@summary}\par\medskip
  {\swmcm@tokens@abstract\par}
  \medskip\noindent
  {\bfseries\textit{\swmcm@cap@keywordsname}} \swmcm@tokens@keywords

 %  \bigskip
 %    {\small\linespread{1.5}\selectfont \swmcm@commit@string@contents \par}
 %    \medskip%
 %    \hspace*{2\em}\textbf{\swmcm@commit@string@signupnum} {\hspace{1em}\swmcm@tokens@baominghao\hfill}\makebox[0.66em]{}\par
 %    \medskip%

 %    \medskip%
 %    \newlength{\swmcm@lenB}
 %    \settowidth{\swmcm@lenB}{\swmcm@commit@string@membername\hspace{1em}1.}
 %    \setlength{\swmcm@lenB}{\textwidth-\swmcm@lenB}
 %    % 不这样做右边难以对齐!
 %    \textbf{\swmcm@commit@string@membername}  {\hspace{.5em}\swmcm@tokens@membera}{\hspace{.5em}\swmcm@tokens@memberb}{\hspace{.5em}\swmcm@tokens@memberc\hfill}\par
 %   \bigskip%
 %    \textbf{\swmcm@commit@string@supervisorname} {\hspace{.5em}\swmcm@tokens@supervisor\hfill}\makebox[0.66em]{}\par
	% \medskip%
 %    \textbf{\swmcm@commit@string@problemnum} {\hspace{1em}\swmcm@tokens@tihao\hfill}\makebox[0.66em]{}\par\vfill
	% \null
% 编号专用页
	% \makeothertitle
	}

%% 定义 编号专用页
\def\makeothertitle{%
\newpage
{\centering
{\Large\bfseries\swmcm@numberpage@string@titlea\par}
{\vskip1ex\Large\bfseries \swmcm@numberpage@string@titleb\par}
 }\par
{%
\normalsize
\vskip3em
\hspace*{2em}\swmcm@numberpage@string@appraiselog
\par
\centerline{\swmcm@tokens@baominghao}%
\vskip6\baselineskip%
\hspace*{2em}\swmcm@numberpage@string@unifiednum
\vskip6\baselineskip%
\hrule
\vskip6em
\hspace*{2em}\swmcm@numberpage@string@countrynum
\vskip5em
\null
}
\newpage%
\begin{center}%
{\LARGE\bfseries \swmcm@numberpage@string@abstracttitle}%
\vskip.5em
\small
\begin{tabular}{lp{9cm}}
\makebox[4em][s]{\swmcm@cap@titlename}&\@title\\[-3pt]
\cline{2-2}
\makebox[4em][s]{\swmcm@cap@keywordsname}&\mcm@keywords\\[-3pt]
\cline{2-2}
\end{tabular}
\end{center}%
\vskip1em
}

% 标题名称设置
\renewcommand\contentsname{\swmcm@cap@contentsname}
\renewcommand\refname{\swmcm@cap@refname}
\renewcommand\indexname{\swmcm@cap@indexname}
\renewcommand\figurename{\swmcm@cap@figurename}
\renewcommand\tablename{\swmcm@cap@tablename}
\renewcommand\appendixname{\swmcm@cap@appendixname}
\renewcommand\abstractname{\swmcm@cap@abstractname}


% 目录深度
\setcounter{secnumdepth}{3}
% 节标题格式, 居中, 使用\chinese命令修改计数器
%\def\@seccntformat#1{\csname the#1\endcsname\ }

% \ctexset{
% section={
% name={,、},
% number=\chinese{section},
% format=\centering\bfseries\heiti\normalsize,
% aftername=\ ,
% beforeskip={2ex},
% afterskip={2ex plus 3pt minus 3pt}
% },
% subsection={
% name={（,）},
% number=\chinese{subsection},
% format=\bfseries\heiti\small,
% aftername=\ ,
% beforeskip={2ex},
% afterskip={2ex plus 3pt minus 3pt}
% },}

\linespread{1.3}

\renewcommand\tableofcontents{%
    \thispagestyle{empty}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \phantomsection
    \addcontentsline{toc}{section}{Content}
    \centerline{\bfseries\Large\contentsname}
    \medskip
    \@mkboth{%
       \MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }


%设置目录格式
% 节的目录格式
 \titlecontents{section}[0pt]{\bfseries}
 {{\thecontentslabel}\enspace }{}{\titlerule*[0.5pc]{.}\contentspage}
 % 小节的目录格式
 \titlecontents{subsection}[25pt]{\rmfamily}
 {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
 \titlecontents{subsubsection}[45pt]{\itshape}
 {{\normalfont\textrm{\thecontentslabel}}\hskip.5em}{}{\titlerule*[0.5pc]{.}\normalfont\textrm{\contentspage}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define new environment and command
%% 摘要两个字设置为 4 号.
%% 定义摘要环境
% \def\abstract{%
%     \if@twocolumn
%       \begin{center}\vspace{-0.8em}\small\bf Abstract\end{center}\quotation\small
%     \else
%      \begin{center}\LARGE\swmcm@cap@abstractname\end{center}}
% \def\endabstract{\par\if@twocolumn\endquotation\else\fi
%     \normalsize\rm\vfill
%     \noindent\begin{tabular}[t]{lp{2cm}}
%     \swmcm@cap@cansaiduihaoname&\swmcm@tokens@baominghao\\[-3pt]
%     \cline{2-2}
%     \end{tabular}\hskip5cm%
%     \begin{tabular}[t]{|lp{2cm}l|}
%     \hline
%     \swmcm@cap@cansaimimaname&&\\[-3pt]
%     \cline{2-2}
%     \multicolumn{3}{|c|}{\swmcm@cap@cansaimimacontent}\\
%     \hline
%     \end{tabular}\hfill
%     }
    
% \def\enabstract{%
%     \if@twocolumn
%       \begin{center}\vspace{-0.8em}\small\bf Abstract\end{center}\quotation\small
%     \else
%      \begin{center}\LARGE\swmcm@cap@enabstractname\end{center} \par%
%     \fi}
% \def\endenabstract{\par\if@twocolumn\endquotation\else\fi
%     \normalsize\rm
%     }

\renewenvironment{quotation}
	{\list{}{\listparindent 2em%
	 \itemindent \listparindent
	 \rightmargin\z@
	 \leftmargin\z@
	 \parsep \z@ \@plus\p@}%
	\item\relax}
	{\endlist}

\renewcommand\keywords[1]{\renewcommand{\swmcm@tokens@keywords}{#1}}

\renewcommand\abstract[1]{\renewcommand{\swmcm@tokens@abstract}{#1}}

% 重定义参考文献环境
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
     \addcontentsline{toc}{section}{\refname}
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}	

\newcommand*\zubie[1]{%
	\renewcommand{\swmcm@tokens@tihao}{#1}}
\newcommand*\baominghao[1]{%
	\renewcommand{\swmcm@tokens@baominghao}{#1}}
\newcommand*\schoolname[1]{%
	\renewcommand{\swmcm@tokens@schoolname}{#1}}
\newcommand*\membera[1]{%
	\renewcommand{\swmcm@tokens@membera}{#1}}
\newcommand*\memberb[1]{%
	\renewcommand{\swmcm@tokens@memberb}{#1}}
\newcommand*\memberc[1]{%
	\renewcommand{\swmcm@tokens@memberc}{#1}}
\newcommand*\supervisor[1]{%
	\renewcommand{\swmcm@tokens@supervisor}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 文档开始导入默认配置
\AtBeginDocument{\makeatletter\input{swmcmthesis.cfg}\makeatother}

\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}}

\endinput
