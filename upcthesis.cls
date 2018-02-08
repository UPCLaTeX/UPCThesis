% 遵循 MIT Lincense 而保留以下声明
%	HustGraduPaper.cls
%	本文件是华中科技大学本科生毕业论文模板
%	@author skinaze
% 	@date 2018/01/20
%	@version v2.1.6
%
%	本模板遵循MIT License
%

% Contributer: Ionizing Radiation

% Todo list: 继续完成定制；修改hdr使之添加章节号；修改bfseries的 ``boldness''；修复标题页 学号 栏不齐的bug


\def\UPC@name{upcthesis}
\def\UPC@date{1926/08/17}
\def\UPC@version{v0.0}
\def\UPC@introduction{An unofficial LaTeX template for UPCThesis}
\ProvidesClass{\UPC@name}[\UPC@date~\UPC@version~\UPC@introduction]
\NeedsTeXFormat{LaTeX2e}


\RequirePackage{xstring}

\def\UPC@fontset{}
\DeclareOption{autofont}{}
\DeclareOption{adobefont} {%
	\def\UPC@fontset{,fontset=adobe}
}
\DeclareOption{fandolfont} {%
	\def\UPC@fontset{,fontset=fandol}
}
\DeclareOption{founderfont} {%
	\def\UPC@fontset{,fontset=founder}
}
\DeclareOption{macfont} {%
	\def\UPC@fontset{,fontset=mac}
}
\DeclareOption{ubuntufont} {%
	\def\UPC@fontset{,fontset=ubuntu}
}
\DeclareOption{winfont} {%
	\def\UPC@fontset{,fontset=windows}
}
\DeclareOption{winnewfont} {%
	\def\UPC@fontset{,fontset=windowsnew}
}
\DeclareOption{winoldfont} {%
	\def\UPC@fontset{,fontset=windowsold}
}
\DeclareOption{nofont} {%
	\def\UPC@fontset{,fontset=none}
}


\def\UPC@footlinelength{6.7cm}
\DeclareOption{footline}{\def\UPC@footlinelength{6.7cm}}
\DeclareOption{nofootline}{\def\UPC@footlinelength{0cm}}

\def\UPC@citestyle{normal}
\DeclareOption{normalcite}{\def\UPC@citestyle{normal}}
\DeclareOption{supercite}{\def\UPC@citestyle{super}}
\def\UPC@citebst{gbt7714-2005}
\DeclareOption{gbtcite}{\def\UPC@citebst{gbt7714-2005}}
\DeclareOption{gbt15cite}{\def\UPC@citebst{gbt7714-2015}}
\DeclareOption{thucite}{\def\UPC@citebst{thuthesis}}
\DeclareOption{chachong}{\def\UPC@citebst{\chachong}}

\ProcessOptions
\ExecuteOptions{autofont, normalcites, gbtcite}
\relax





\LoadClass[a4paper]{article}
\RequirePackage[AutoFakeBold=true, AutoFakeSlant=true]{xeCJK}[2017/08/08]
\RequirePackage[zihao=-4, UTF8, heading=true\UPC@fontset]{ctex}[2016/12/27]




\RequirePackage{geometry}
\geometry{left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm}
\geometry{headsep=1em, footskip=2em}
\geometry{headheight=14pt}





\setmainfont{Times New Roman}
\RequirePackage{fontspec}

\setCJKfamilyfont{hwzs}{STZhongsong}
\newcommand{\huawenzhongsong}{\CJKfamily{hwzs}}
\newfontfamily\hwzsAll{STZhongsong}[%
	BoldFont={STZhongsong},
	BoldFeatures={FakeBold}
]







\RequirePackage{fancyhdr}
\RequirePackage{tikz}

\newcommand{\headstyleatbegin} {%
	\fancyhead[C]{\kaishu \zihao{5} 中国石油大学（华东）本科毕业设计(论文)}
}

\newcommand{\footstyle}{%
	\fancyfoot[C]{\huawenzhongsong \zihao{5} \thepage}
}
\pagestyle{fancy}
\fancyhf{}
\headstyleatbegin
\footstyle

\fancypagestyle{main}{%
	\fancyhf{}
	\headstyleatbegin	%%%%%%% to do here
	\footstyle
}






\renewcommand{\baselinestretch}{1.62}
\newcommand{\sectionbreak}{\clearpage}

\ctexset{
	section={%
		format={\centering \heiti \bfseries \zihao{-2}}
	},
	subsection={%
		format={\raggedright \heiti \bfseries \zihao{4}}
	},
	subsubsection={%
		format={\raggedright \heiti \bfseries \zihao{-4}}
	}
}

\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
	{0ex \@plus 1ex \@minus .2ex}%
	{1em}%
	{\normalfont \normalsize \bfseries}
}

\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
	{0ex \@plus 1ex \@minus .2ex}%
	{1em}%
	{\normalfont \normalsize \bfseries}
}

\RequirePackage[indentafter]{titlesec}

\titleclass{\subsubsubsection}{straight}[\subsubsection]

\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{%
	\thesubsubsection . \arabic{subsubsubsection}
}

\titleformat{\subsubsubsection}{%
	\raggedright \heit \bfseries \zihao{-4}
}{\thesubsubsubsection}{1em}{}[]
\titlespacing*{\subsubsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{%
	1.5ex plus .2ex
}

\AtBeginDocument{%
	\def\toclevel@subsubsubsection{4}
	\def\toclevel@paragraph{5}
	\def\toclevel@subparagraph{6}
	\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
	\def\l@paragraph{\@dottedtocline{5}{11em}{5em}}
	\def\l@subparagraph{\@dottedtocline{6}{13em}{6em}}
}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}


\RequirePackage[title, titletoc]{appendix}
\renewcommand{\appendixname}{附录}


\def\sectionautorefname~#1\null{%
	第~#1~节\null
}
\def\subsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\paragraphautorefname~#1\null{%
	段落~#1~\null
}
\def\subparagraphautorefname~#1\null{%
	段落~#1~\null
}



\@addtoreset{footnote}{page}

\renewcommand{\thefigure}{%
	\ifnum \c@section > \z@ \thesection - \fi \@arabic \c@figure
}
\renewcommand{\thetable}{%
	\ifnum \c@section > \z@ \thesection - \fi \@arabic \c@table
}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}


% 设置图表 Caption 的样式
\RequirePackage{caption}
\DeclareCaptionFont{UPC}{\normalsize \heiti}
\captionsetup{labelsep=quad}
\captionsetup{font={UPC, singlespacing}}
\captionsetup[figure]{position=bottom, skip={0pt}}
\captionsetup[table]{position=top, skip={0pt}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

% 重新设置图表 auto ref
\def\figureautorefname~#1\null{%
	图~#1~\null
}
\def\tableautorefname~#1\null{%
	表~#1~\null
}

% 使用 tabularx 库定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\ragerdright \arraybackslash}X}

% 添加复杂的表格宏
\RequirePackage{booktabs}
% 设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}

% 添加图需要的库
\RequirePackage{graphicx}

% 重新定义图和表的浮动环境
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
	\centering
	}{
	\end{table}
}

% -------------------------
% ------设置公式格式--------
% -------------------------
\RequirePackage{amsmath}

% 设置公式间距为零
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt}
}

% 公式编号带章节
\numberwithin{equation}{section}

% 重新设置公式autoref
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}


%---------------------------
%-----定义列表项的样式--------
%---------------------------
\RequirePackage{enumitem}
\setlist{noitemsep}


%---------------------------
%-----   定义标题页  --------
%---------------------------
\RequirePackage{kvsetkeys}
% 添加文档的新属性
\def \@school {}
\def \@classnum {}
\def \@stuid {}
\def \@supervisor {}
\newcommand{\school}[1]{\def \@school{#1}}
\newcommand{\classnum}[1]{\def \@school{#1}}
\newcommand{\stuid}[1]{\def \@stuid{#1}}
\newcommand{\supervisor}[1]{\def \@stuid{#1}}

% 设置 \maketitle 参数解析
\newcommand{\arg@maketitle}[2]{%
	\IfStrEqCase{#1}{%
		{logo color}{%
			\IfStrEqCase{#2}{%
				{green}{\def\UPC@titleColor{UPCLogo.png}}
				{black}{\def\UPC@titleColor{UPCLogo.png}}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (maketitle)}]
		}
		{line length}{\def\UPC@titlelength{#2}}
		{line font}{
			\IfStrEqCase{#2}{%
				{huawenzhongsong}{\def\UPC@titlelinefont{\huawenzhongsong}}
				{songti}		{\def\UPC@titlelinefont{\songti}}
				{heiti}		{\def\UPC@titlelinefont{\heiti}}
				{fangsong}	{\def\UPC@titlelinefont{\fangsong}}
				{kaishu}		{\def\UPC@titlelinefont{\kaishu}}
				{lishu}		{\def\UPC@titlelinefont{\lishu}}
				{youyuan}		{\def\UPC@titlelinefont{\youyuan}}
			}[\ClassWarning{\UPC@name}{Ther's no such value for #1 (maketitle)}]
		}
	}[\ClassWarning{\UPC@name}{There's no such argument for maketitle}]
}
\newcommand{\maketitlearg}[1]{%
	\IfSubStr{#1}{=}{%
		\kv@parse{#1}{\arg@maketitle}
	}{%
		\def\UPC@titlelength{#1}
	}
}
% 重置命令 maketitle
\renewcommand{\maketitle}[1][12em]{
	\def\UPC@titlecolor{UPCLogo.png}
	\def\UPC@titlelength{12em}
	\def\UPC@titlelinefont{}
	\maketitlearg{#1}
	\begin{titlepage}
		\includegraphics[width=7.3cm, height=1.8cm]{\UPC@titlecolor}\\
		\begin{center}
			\vspace*{5em}
			\makebox[\textwidth]{\zihao{-0} \heiti \bfseries 本\hfill 科\hfill 毕\hfill 业\hfill 设\hfill 计\hfill （\hfill 论文\hfill ）}\\
				\vspace{6em}
				
				\begin{flushleft}
				\hspace{.5em}\zihao{-2} \heiti \makebox[3em]{题\hfill 目:} \@title
				\end{flushleft}
				
				\vspace{6em}
				{\zihao{3} \fangsong
					\renewcommand\arraystretch{1.5}
					\begin{tabular}{ll}
						\makebox[4em][s]{学生姓名：} &
						\makebox[\UPC@titlelength]{\UPC@titlelinefont\@author}\\
						\makebox[4em][s]{学 \hfill 号：} &
						\makebox[\UPC@titlelength]{\UPC@titlelinefont\@classnum}\\
						\makebox[4em][s]{专业班级：} &
						\makebox[\UPC@titlelength]{\UPC@titlelinefont\@stuid}\\
						\makebox[4em][s]{指导教师：} &
						\makebox[\UPC@titlelength]{\UPC@titlelinefont\@supervisor}\\
					\end{tabular}
				}\\
			\vspace{4em}
			{\zihao{3} \huawenzhongsong \@date}\\		
		\end{center}
	\end{titlepage}
}

%----------------------------
%-------定义新的声明页面-------
%----------------------------
%使用特殊符号
\RequirePackage{amssymb}

% 设置statement的参数解析
\def\UPC@checkedbox{$\text{\rlap{\checkmark}}\square$}
\def\UPC@box{$\square$}
\newcommand{\arg@statement}[2]{%
	\IfStrEqCase{#1}{%
		{confidentiality}{%
			\IfStrEqCase{#2}{%
				{yes}{%
					\def\UPC@confidential{\UPC@checkedbox}
					\def\UPC@notconfidential{\UPC@box}
				}
				{no}{
					\def\UPC@confidential{\UPC@box}
					\def\UPC@notconfidential{\UPC@checkedbox}
				}
				{false}{
					\def\UPC@confidential{\UPC@box}
					\def\UPC@notconfidential{\UPC@checkedbox}
				}
				{empty}{
					\def\UPC@confidential{\UPC@box}
					\def\UPC@notconfidential{\UPC@box}
				}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (statement)}]
		}
		{year}{\def\UPC@yearofconfidentiality{#2}}	
	}[\ClassWarning{\UPC@name}{There's no such argument for statement}]
}
% 设置命令
\newcommand{\statement}[1][confidentiality=empty]{
	\def\UPC@confidential{\UPC@box}
	\def\UPC@notconfidential{\UPC@checkedbox}
	\def\UPC@yearofconfidentiality{}
	\kv@parse{#1}{\arg@statement}
	\clearpage
	\thispagestyle{empty}
	\vspace*{1em}
	\begin{center}
		\heiti \zihao{-2} \bfseries
		学位论文原创性声明
	\end{center}
	
	本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。除了文中特别加以标注引用的内容外，本论文不包括任何其他个人或集体已经发表或撰写的成果作品。本人完全意识到本声明的法律后果由本人承担。
	
	\rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	\vspace{4em}
	
	\begin{center}
		\heiti \zihao{-2} \bfseries
		学位论文版权使用授权书
	\end{center}
	
	本学位论文作者完全了解学校有关保障、使用学位论文的规定，同意学校保留并向有关学位论文管理部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权省级优秀学士论文评选机构将本学位论文的全部或部分内容编入有关数据进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。
	
	\begin{tabbing}
		\hspace{2em}本学位论文属于 \= 1、保密\hspace{1em} \=\HGP@confidential
		，在\makebox[2em][c]{\HGP@yearofconfidentiality}年解密后适用本授权书。\\
		\>2、不保密\>\HGP@notconfidential
		。\\
		\>（请在以上相应方框内打“$\checkmark$”）
	\end{tabbing}
	
	\rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	
	\rightline{导师签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	
	\clearpage
}
\newcommand{\makestatement}[2][]{\statement[confidentialily=#2, year=#1]}

%-----------------------------
%----定义新的中英文摘要环境------
%-----------------------------

%中文摘要环境
\newenvironment{cnabstract}[1]{
	\def\cnkeyword{#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{摘要}
	\begin{center}
		\heiti \bfseries \zihao{-2} 摘 \hspace{2em} 要
	\end{center}
}{
	\vspace{1em}
	\par\noindent
	{\heiti \zihao{4} \bfseries 关键词：}
	\cnkeyword
	\clearpage
}

\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{Abstract}
	\begin{center}
		\heiti \bfseries \zihao{-2} Abstract 
	\end{center}
}{
	\vspace{1em}
	\par\noindent
	{\zihao{4} \bfseries Key Words: }
	\enkeyword
	\clearpage
}

%----------------------
%----定义新的目录页面----
%----------------------
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = black,
	pdfborder =000, %去掉链接红(黑)框
	pdfstartview=FitH	%打开页面以窗口宽度显示
}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \zihao{-2} \bfseries}
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforeloftitleskip}{0.5em}
\renewcommand{\cftafterloftitleskip}{0.5em}
\renewcommand{\cftsecdotsep}{\cftdotsep} %设置section引导点
\renewcommand{\cftbeforesecskip}{0em} %设置段间距
\renewcommand{\cftpartfont}{\songti \bfseries} %设置part字体
\renewcommand{\cftsecfont}{\songti \bfseries}

% 设置 \tableofcontents 参数解析
\newcommand{\arg@tableofcontents}[2]{
	\IfStrEqCase{#1}{
		{pagenum}{
			\IfStrEqCase{#2}{
			{yes}{\def\UPC@plainfooterstyle{\footstyle}}
			{true}{\def\UPC@plainfooterstyle{\footstyle}}
			{no}{\def\UPC@plainfooterstyle{}}
			{false}{\def\UPC@plainfooterstyle{}}
			}[\ClassWarning{\HGP@name}{There's no such value for #1 (tableofcontents)}]
		}
		{toc in toc}{
			\IfStrEqCase{#2}{
				{yes}{\def\UPC@addtoctotoc{
					\phantomsection
					\addcontentsline{toc}{section}{目录}
					}}
				{true}{\def\UPC@addtoctotoc{
					\phantomsection
					\addcontentsline{toc}{section}{目录}
					}}
				{no}{\def\UPC@addtoctotoc{}}
				{false}{\def\UPC@addtoctotoc{}}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (tableofcontents)}]
		}
		{level}{\setcounter{tocdepth}{#2}}
		{section indent}{\renewcommand{\cftsecindent}{#2}}
		{subsection indent}{\renewcommand{\cftsubsecindent}{#2}}
		{subsubsection indent}{\renewcommand{\cftsubsubsecindent}{#2}}
		{subsubsubsection indent}{%
			\def\l@subsubsubsection{\@dottedtocline{4}{#2}{4em}}
		}
		{paragraph indent}{\def\l@paragraph{\@dottedtocline{5}{#2}{5em}}}
		{subparagraph indent}{\def\l@subparagraph{\@dottedtocline{5}{#2}{5em}}}
		{indent}{
			\IfStrEqCase{#2}{
				{normal}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsecindent}{3.8em}
					\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
					\def\l@paragraph{\@dottedtocline{5}{11em}{5em}}
					\def\l@subparagraph{\@dottedtocline{5}{13em}{5em}}
				}
				{noindent}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{0em}
					\renewcommand{\cftsubsubsecindent}{0em}
					\def\l@subsubsubsection{\@dottedtocline{4}{0em}{4em}}
					\def\l@paragraph{\@dottedtocline{5}{0em}{5em}}
					\def\l@subparagraph{\@dottedtocline{5}{0em}{5em}}
				}
				{UPCnoindent}{
					\def\l@section{\songti \bfseries\@dottedtocline{1}{0em}{3em}}
					\def\l@subsection{\normalfont\@dottedtocline{2}{0em}{3em}}
					\def\l@subsubsection{\normalfont\@dottedtocline{3}{0em}{4em}}
					\def\l@subsubsubsection{\normalfont\@dottedtocline{4}{0em}{5em}}
					\def\l@paragraph{\normalfont\@dottedtocline{5}{0em}{6em}}
				}
				{sameforsubandsubsub}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsecindent}{1.5em}
					\def\l@subsubsubsection{\@dottedtocline{4}{1.5em}{4em}}
					\def\l@paragraph{\@dottedtocline{5}{1.5em}{5em}}
					\def\l@subparagraph{\@dottedtocline{5}{1.5em}{5em}}
				}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (tableofcontents)}]
		}
	}[\ClassWarning{\UPC@name}{There's no such argument for tableofcontents}]
}

\AtBeginDocument{
	% 设置新的生成目录命令
	\let \oldtableofcontents \tableofcontents
	\renewcommand{\tableofcontents}[1][pagenum=false, toc in toc=false]{
		\def\UPC@plainfooterstyle{}
		\def\UPC@addtoctotoc{}
		\kv@parse{#1}{\arg@tableofcontents}
		% 修改 hdr(header) 原 plain 格式
		\fancypagestyle{plain}{%
			\fancyhf{} % 清空原有样式
			\headstyleatbegin %%%%%%%% to do here
			\UPC@plainfooterstyle
		}
		% 设置目录 hdr 和页码选项
		\clearpage
		\pagestyle{plain}
		\UPC@addtoctotoc
		\oldtableofcontents
		\clearpage
		\pagestyle{main}
	}
	% 旧命令
	\newcommand{\maketoc}[1][nopagenum]{
		\IfStrEqCase{#1}{
			{nopagenum}{\tableofcontents[pagenum=false, toc in toc=false]}
			{pagenum}{\tableofcontents[pagenum=true, toc in toc=false]}
			{pagenumtoc}{\tableofcontents[pagenum=true, toc in toc=true]}
		}
	}
}



