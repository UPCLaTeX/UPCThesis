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

\newcommand{\headstyle} {%
	\fancyhead[C]{\huawenzhongsong \zihao{5} 中国石油大学（华东）本科毕业设计(论文)}
}

\newcommand{\footstyle}{%
	\fancyfoot[C]{\huawenzhongsong \zihao{5} \thepage}
}
\pagestyle{fancy}
\fancyhf{}
\headstyle
\footstyle

\fancypagestyle{main}{%
	\fancyhf{}
	\headstyle
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






