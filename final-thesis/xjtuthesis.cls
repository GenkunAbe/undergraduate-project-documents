% bachelor.tex
%
% Aetf <aetf@unlimitedcodeworks.xyz>
% Copyright 2016 Aetf <aetf@unlimitedcodeworks.xyz>
%
% multiple1902 <multiple1902@gmail.com>
% Copyright 2011~2012, multiple1902 (Weisi Dai)
%
% Project Home: https://github.com/Aetf/xjtuthesis
%
% It is strongly recommended that you read documentations located at
%   https://github.com/Aetf/xjtuthesis/wiki
% in advance of your compilation if you have not read them before.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Aetf.
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{xjtuthesis}
[2016/6/6 0.7.0 Xi'an Jiaotong University Dissertation Template]

% Brand marks, and version info
\def\xjtuthesis{XJTUthesis}
\def\meta@version{0.7.0-dev}
\def\meta@codename{Monet}
\def\metaversion{\meta@version}

% Option switches
\newif\ifxjtu@bachelor  \xjtu@bachelorfalse
\newif\ifxjtu@master    \xjtu@masterfalse
\newif\ifxjtu@doctor    \xjtu@doctorfalse
\newif\ifxjtu@bigskip   \xjtu@bigskipfalse
\newif\ifxjtu@nofont    \xjtu@nofontfalse
\newif\ifxjtu@truefont  \xjtu@truefontfalse
\newif\ifxjtu@sourcefont \xjtu@sourcefontfalse
\newif\ifxjtu@pdflinks  \xjtu@pdflinksfalse
\newif\ifxjtu@colorlinks\xjtu@colorlinksfalse
\newif\ifxjtu@compact   \xjtu@compactfalse
\newif\ifxjtu@content	  \xjtu@contentfalse

\DeclareOption{bachelor}    {\xjtu@bachelortrue}
\DeclareOption{master}      {\xjtu@mastertrue}
\DeclareOption{doctor}      {\xjtu@doctortrue}
\DeclareOption{bigskip}     {\xjtu@bigskiptrue} % bachelor only
\DeclareOption{nofont}      {\xjtu@nofonttrue}
\DeclareOption{truefont}    {\xjtu@truefonttrue}
\DeclareOption{sourcefont}  {\xjtu@sourcefonttrue}
\DeclareOption{pdflinks}    {\xjtu@pdflinkstrue}
\DeclareOption{colorlinks}  {\xjtu@colorlinkstrue}
\DeclareOption{compact}     {\xjtu@compacttrue}

% 非常 dirty 的方式给任务书中的参考文献加下划线
\newif\ifxjtu@taskunderline\xjtu@taskunderlinefalse
\DeclareOption{taskunderline}{\xjtu@taskunderlinetrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[openany]{book}

% if-condition
\newif\ifxjtu@inmainbody\xjtu@inmainbodyfalse

\ifxjtu@bachelor\relax\else
  \ifxjtu@master\relax\else
    \ifxjtu@doctor\relax\else
      \ClassError{xjtuthesis}%
                 {You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

% 字体颜色
\RequirePackage{xcolor}
% 下划线
\RequirePackage{ulem}
%多行
\RequirePackage{multirow}
%背景图片
\RequirePackage[pages=some]{background}
%附录
\RequirePackage{appendix}

% Math & format packages
\RequirePackage[]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{subfig}
\RequirePackage[backend=biber,bibstyle=gb7714-2015,citestyle=gb7714-2015,gbnamefmt=lowercase]{biblatex}
% \DeclareFieldFormat*{title}{#1}
% \DeclareListFormat{}{\underline{#1}}
\RequirePackage{setspace}
\RequirePackage[shortlabels]{enumitem}
\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}
\RequirePackage{pdfpages}

% CJK character support
\RequirePackage{fontspec,xltxtra,xunicode}
\RequirePackage[slantfont,boldfont,CJKnumber]{xeCJK}
\punctstyle{hangmobanjiao}

% Padding
\RequirePackage[left=2.6cm, right=2.6cm,top=3.0cm,bottom=2.5cm,a4paper]{geometry}

% Header & footer
\RequirePackage{fancyhdr}
\RequirePackage[perpage]{footmisc}
\RequirePackage{tikz}

% titleformat
\RequirePackage{titlesec,titletoc}

% 长表格
\RequirePackage{supertabular}
\newcolumntype{I}{!{\vrule width 1.5pt}}
\newlength\savewidth
\newcommand\shline{
    \noalign{\global\savewidth\arrayrulewidth
            \global\arrayrulewidth 1.5pt}%
            \hline
            \noalign{\global\arrayrulewidth\savewidth}
}
\newcommand{\tabincell}[2]{
    \begin{tabular}{@{}#1@{}}#2\end{tabular}
}

\def\xjtu@clearpage{%
    \clearpage%
    \ifodd\c@page\relax\else%
        \null\thispagestyle{empty}\newpage%
    \fi%
}

% 单页面横置
\RequirePackage{lscape}

% l10n here
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}
\renewcommand{\bibname}{\vskip -0.5em 参考文献}
\renewcommand\@biblabel[1]{{[#1]\hfill}}
\renewcommand\contentsname{目\quad 录}
\renewcommand\thefigure{% thanks to fitsir<at>gmail.com
     \ifnum \c@chapter>\z@\thechapter-\fi\@arabic\c@figure%
}
\renewcommand\thetable{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@table%
}
\renewcommand\theequation{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@equation%
}
\captionsetup{labelsep=quad}
\captionsetup[longtable]{labelsep=quad}

\newcommand{\thesis}{thesis}
\newcommand{\Master}{Master}

\ifxjtu@pdflinks
    \RequirePackage{hyperref}
    \ifxjtu@colorlinks
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=true,
            linkcolor=blue,
            anchorcolor=blue,
            citecolor=green,
            plainpages=false,
            % pdfpagelabels, % comment this to reduce warning
            pdfborder=0 0 0,
        }
    \else
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=false,
            plainpages=false,
            % pdfpagelabels, % comment this to reduce warning
            pdfborder=0 0 0,
        }
    \fi
    \urlstyle{same}
\fi

% Font-size
\RequirePackage{calc}
% Used code from THUthesis. Many thanks!
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
  \setlength{\thu@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
  %下面这一行必须以百分号结尾，否则header会有一个向右的微小偏移。
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\DeclareCaptionFont{wuhao}{\wuhao}\captionsetup{font=wuhao,labelsep=quad} % thanks to @wanderxjtu
\DeclareCaptionFont{xiaowu}{\xiaowu}\captionsetup[subfloat]{font=xiaowu} % issue 4

% Subfloat
\captionsetup[subfloat]{labelformat=simple,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})} % referencing
\setlength{\floatsep}{5bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{5bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{5bp \@plus4pt \@minus2pt}

% Header & footer styles
\def\ps@thu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@thu@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}

% Font-family
\ifxjtu@nofont\else
    \ifxjtu@truefont
    \setmainfont[Ligatures=TeX]{Times New Roman}
    \setCJKmainfont[BoldFont={STZhongsong}, ItalicFont={KaiTi}]{SimSun}
    \setCJKfamilyfont{vert}[RawFeature={script=hani:language=CHN:vertical:+valt}]{SimSun}
        \def\CJKmovesymbol#1{\raise.35em\hbox{#1}}
        \def\CJKmove{\let\CJKsymbol\CJKmovesymbol \let\CJKpunctsymbol\CJKsymbol}
    \setCJKfamilyfont{hei}{SimHei}
    \else
        \ifxjtu@sourcefont
            \setmainfont[Ligatures=TeX]{Nimbus Roman No9 L}
            \setCJKmainfont[BoldFont=思源宋体 Bold, ItalicFont=FandolKai]{Source Han Serif SC}
            \setCJKfamilyfont{vert}[RawFeature={script=hani:language=CHN:vertical:+valt}]{Source Han Serif SC}
                \def\CJKmovesymbol#1{\raise.35em\hbox{#1}}
                \def\CJKmove{\let\CJKsymbol\CJKmovesymbol \let\CJKpunctsymbol\CJKsymbol}
            \setCJKfamilyfont{hei}{思源黑体 Regular}
        \else
            \setmainfont[Ligatures=TeX]{Nimbus Roman No9 L}
            \setCJKmainfont[AutoFakeBold=false, ItalicFont=FandolKai]{FandolSong}
            \setCJKfamilyfont{vert}[RawFeature={script=hani:language=CHN:vertical:+valt}]{FandolSong}
                \def\CJKmovesymbol#1{\raise.35em\hbox{#1}}
                \def\CJKmove{\let\CJKsymbol\CJKmovesymbol \let\CJKpunctsymbol\CJKsymbol}
            \setCJKfamilyfont{hei}{FandolHei}
        \fi
    \fi
\fi

\def\thu@define@term#1{
\long\expandafter\gdef\csname #1\endcsname##1{% defines a macro like \ctitle#1: \def\xjtu@ctitle{#1}
    \long\expandafter\gdef\csname xjtu@#1\endcsname{##1}}
  \csname #1\endcsname{}} % the initial value is NULLSTR

% Table of contents, in English
\newcommand\engcontentsname{CONTENTS}
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}%
    \if@restonecol\twocolumn\fi
    }
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}
\newcommand\addengappendice[2]{%
    \addcontentsline{toe}{#1}{theappendix}#2}

\newcommand\echapter[1]{\addengcontents{chapter}{#1}}
\newcommand\esection[1]{\addengcontents{section}{#1}}
\newcommand\esubsection[1]{\addengcontents{subsection}{#1}}
\newcommand\esubsubsection[1]{} % do nothing
\newcommand\eappendix[1]{\addengappendice{#1}}

% Circled footnote number
% http://tex.stackexchange.com/questions/133264/circled-footnote-symbols-with-pifont-showing-arrows-instead-of-circled-numbers
\newcommand*\circled[1]{
    \tikz[baseline=(char.base)]
    \node[shape=circle,draw,inner sep=0.5pt] (char) {\xiaoliu #1};
}
\renewcommand\thefootnote{\protect\circled{\arabic{footnote}}}
\renewcommand\@makefntext[1]{
    \noindent\makebox[0pt][r]{\@thefnmark}#1
}

\thu@define@term{type}

\ifxjtu@master
    \type{硕士}
\else
    \type{博士}
    \renewcommand{\thesis}{dissertation}
    \renewcommand{\Master}{Doctor}
\fi

% Interfaces, or commands
\newcommand\xjtucover{}
\newcommand\xjtuchead{}
\newcommand\xjtuehead{}
\newcommand\xjtucinfopage{}
\newcommand\xjtueinfopage{}
\newcommand\xjtucontent{}
\newcommand\xjtuendcontent{}
\newcommand\xjtutoc{
    \tableofcontents
    \ifxjtu@bachelor\else
        \noindent 声明
    \fi
    \chaptermark{目\quad 录}
    \clearpage
}
\newcommand\xjtutoe{
    \tableofengcontents
    \noindent Declaration
}
\newcommand\xjtuspchapter[2]{
    \chapter*{#2}
    \chaptermark{#1}
    \addcontentsline{toc}{chapter}{#1}
}
\newcommand\xjtuincite[1]{ {%
    \citestyle{plain}%
    \cite{#1}%
    }%
}

% 本科任务书
\thu@define@term{taskmajor}
\thu@define@term{taskpresident}
\thu@define@term{taskapprovaldate}
\thu@define@term{taskschool}
\thu@define@term{taskclass}
\thu@define@term{taskauthor}
\thu@define@term{tasktitle}
\thu@define@term{taskfromyear}
\thu@define@term{taskfrommonth}
\thu@define@term{taskfromday}
\thu@define@term{tasktoyear}
\thu@define@term{tasktomonth}
\thu@define@term{tasktoday}
\thu@define@term{taskplace}
\thu@define@term{taskbackground}
\thu@define@term{taskrawmaterial}
\thu@define@term{taskmaintask}
\thu@define@term{taskrequirement}
\thu@define@term{taskfinalmaterial}
\thu@define@term{taskothertaskreference}
\thu@define@term{taskteachername}
\thu@define@term{taskteacherdate}
\thu@define@term{taskauthorname}
% 本科考核评议书
\thu@define@term{reviewschool}
\thu@define@term{reviewmajor}
\thu@define@term{reviewclass}
\thu@define@term{reviewauthor}
\thu@define@term{reviewtitle}
\thu@define@term{reviewteachercomment}
\thu@define@term{reviewteachergrade}
\thu@define@term{reviewteachername}
\thu@define@term{reviewteacheryear}
\thu@define@term{reviewteachermonth}
\thu@define@term{reviewteacherday}
% 本科评审意见书
\thu@define@term{reviewercomment}
\thu@define@term{reviewergrade}
\thu@define@term{reviewername}
\thu@define@term{reviewertitle}
\thu@define@term{revieweryear}
\thu@define@term{reviewermonth}
\thu@define@term{reviewerday}
% 本科答辩结果
\thu@define@term{resultschool}
\thu@define@term{resultmajor}
\thu@define@term{resultauthor}
\thu@define@term{resulttitle}
\thu@define@term{resultcomment}
\thu@define@term{resultgrade}
\thu@define@term{resultprincipal}
\thu@define@term{resultmenberaname}
\thu@define@term{resultmenberbname}
\thu@define@term{resultmenbercname}
\thu@define@term{resultmenberdname}
\thu@define@term{resultmenberename}
\thu@define@term{resultmenberfname}
\thu@define@term{resultyear}
\thu@define@term{resultmonth}
\thu@define@term{resultday}
% 选题审核表
\thu@define@term{topicschool}
\thu@define@term{topicmajor}
\thu@define@term{topicteachername}
\thu@define@term{topicteachertitle}
\thu@define@term{topictitle}
\thu@define@term{topicprojecttype}
\thu@define@term{topictopicsource}
\thu@define@term{topicstudentnum}
\thu@define@term{topicpurpose}
\thu@define@term{topiccontent}
\thu@define@term{topicbackground}
\thu@define@term{topicteacheryear}
\thu@define@term{topicteachermonth}
\thu@define@term{topicteacherday}
\thu@define@term{topicmajoropinion}
\thu@define@term{topicmajorpresident}
\thu@define@term{topicmajorpresidentyear}
\thu@define@term{topicmajorpresidentmonth}
\thu@define@term{topicmajorpresidentday}
\thu@define@term{topicschoolopinion}
\thu@define@term{topicschoolpresident}
\thu@define@term{topicschoolpresidentyear}
\thu@define@term{topicschoolpresidentmonth}
\thu@define@term{topicschoolpresidentday}
% 中期检查表
\thu@define@term{interimchecklistclass}
\thu@define@term{interimchecklistschool}
\thu@define@term{interimchecklistteacher}
\thu@define@term{interimchecklistauthor}
\thu@define@term{interimcheckliststuid}
\thu@define@term{interimchecklisttitle}
\thu@define@term{interimchecklistdrafttime}
\thu@define@term{interimchecklistmanuscripttime}
\thu@define@term{interimchecklistfinalizedtime}
\thu@define@term{interimchecklistguidance}
\thu@define@term{interimchecklistimplementation}
\thu@define@term{interimchecklistproblem}
\thu@define@term{interimchecklistteachername}
\thu@define@term{interimchecklistteacheryear}
\thu@define@term{interimchecklistteachermonth}
\thu@define@term{interimchecklistteacherday}
\thu@define@term{interimchecklistmajoropinion}
\thu@define@term{interimchecklistmajorpresidentname}
\thu@define@term{interimchecklistmajorpresidentyear}
\thu@define@term{interimchecklistmajorpresidentmonth}
\thu@define@term{interimchecklistmajorpresidentday}
\thu@define@term{interimchecklistschoolpresidentname}
\thu@define@term{interimchecklistschoolpresidentyear}
\thu@define@term{interimchecklistschoolpresidentmonth}
\thu@define@term{interimchecklistschoolpresidentday}
\newif\ifinterimchecklistrecord\interimchecklistrecordfalse
% 进度表
\thu@define@term{progresschecklisttitle}
\thu@define@term{progresschecklistauthor}
\thu@define@term{progresscheckliststuid}
\thu@define@term{progresschecklistclass}
\thu@define@term{progresschecklistteacher}
\thu@define@term{progresschecklistauthorname}
\thu@define@term{progresschecklistteachername}
\thu@define@term{progresschecklistadate}
\thu@define@term{progresschecklistbdate}
\thu@define@term{progresschecklistcdate}
\thu@define@term{progresschecklistddate}
\thu@define@term{progresschecklistedate}
\thu@define@term{progresschecklistfdate}
\thu@define@term{progresschecklistgdate}
\thu@define@term{progresschecklisthdate}
\thu@define@term{progresschecklistidate}
\thu@define@term{progresschecklistjdate}
\thu@define@term{progresschecklistkdate}
\thu@define@term{progresschecklistldate}
\thu@define@term{progresschecklistmdate}
\thu@define@term{progresschecklistndate}
\thu@define@term{progresschecklistodate}
\thu@define@term{progresschecklistpdate}
\thu@define@term{progresschecklistawork}
\thu@define@term{progresschecklistbwork}
\thu@define@term{progresschecklistcwork}
\thu@define@term{progresschecklistdwork}
\thu@define@term{progresschecklistework}
\thu@define@term{progresschecklistfwork}
\thu@define@term{progresschecklistgwork}
\thu@define@term{progresschecklisthwork}
\thu@define@term{progresschecklistiwork}
\thu@define@term{progresschecklistjwork}
\thu@define@term{progresschecklistkwork}
\thu@define@term{progresschecklistlwork}
\thu@define@term{progresschecklistmwork}
\thu@define@term{progresschecklistnwork}
\thu@define@term{progresschecklistowork}
\thu@define@term{progresschecklistpwork}
\thu@define@term{progresschecklistateach}
\thu@define@term{progresschecklistbteach}
\thu@define@term{progresschecklistcteach}
\thu@define@term{progresschecklistdteach}
\thu@define@term{progresschecklisteteach}
\thu@define@term{progresschecklistfteach}
\thu@define@term{progresschecklistgteach}
\thu@define@term{progresschecklisthteach}
\thu@define@term{progresschecklistiteach}
\thu@define@term{progresschecklistjteach}
\thu@define@term{progresschecklistkteach}
\thu@define@term{progresschecklistlteach}
\thu@define@term{progresschecklistmteach}
\thu@define@term{progresschecklistnteach}
\thu@define@term{progresschecklistoteach}
\thu@define@term{progresschecklistpteach}
% Interfaces, or terms
\thu@define@term{cauthor}
\thu@define@term{stuid}
\thu@define@term{covertitlefirst}
\thu@define@term{covertitlesecond}
\thu@define@term{cschool}
\thu@define@term{cactualinstitution}
\thu@define@term{cmajor}
\thu@define@term{cclass}
\thu@define@term{cyear}
\thu@define@term{cmonth}
\thu@define@term{ctitle}
\thu@define@term{csupervisor}
\thu@define@term{cabstract}
\thu@define@term{ckeywords}
\thu@define@term{csubject}
\thu@define@term{cproddate}
\thu@define@term{ctype}

\thu@define@term{eauthor}
\thu@define@term{etitle}
\thu@define@term{ecate}
\thu@define@term{esupervisor}
\thu@define@term{eabstract}
\thu@define@term{ekeywords}
\thu@define@term{esubject}
\thu@define@term{eproddate}
\thu@define@term{etype}

\thu@define@term{zhongtufenlei}
\thu@define@term{UDC}
\thu@define@term{secrettype}
\thu@define@term{stunum}
\thu@define@term{degreetype}

\newcommand\xjtutype{\xjtu@type}

% Geometry specifications
\topmargin=-1in % 消除页眉-边界距离初始值
\headheight=6.5mm % 该设定使得效果与官方doc模板相似
\textheight=242mm % 297-30-25
\footskip=7.5mm
\setlength\voffset{2cm} % 规范：页眉距边界2.0cm, one inch + \voffset + \topmargin = 2cm.
% 规范：上装订线边距3cm，即上边距到正文3cm。
% 需要 1 inch + \voffset + \topmargin + \headheight + \headsep = 3.0cm
\headsep= 3.5mm
\pagenumbering{Roman}
\xiaosi
\setlength{\parindent}{2em}

% Table of contents, style
\setcounter{secnumdepth}{3}

% Section titles, style
\titleformat{\chapter}[block]{\sanhao}{}{0em}{\centering}[]
\titlespacing{\chapter}{0em}{0.5em}{1em}
\titleformat{\section}[hang]{\xiaosan}{\thesection}{1em}{}
\titlespacing{\section}{0em}{1\baselineskip}{0.5\baselineskip}
\titleformat{\subsection}{\sihao}{\thesubsection}{1em}{}
\titlespacing{\subsection}{2em}{0.5\baselineskip}{0\baselineskip}
\titleformat{\subsubsection}{}{\arabic{subsubsection})~}{1em}{}
\titlespacing{\subsubsection}{2em}{0.2\baselineskip}{0\baselineskip}
\renewcommand{\l@chapter}{\@dottedtocline{1}{0em}{1.5em}}

\titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}

\let\oldfigure=\figure
\renewcommand\figure[1][]{
    \oldfigure[#1]
    \wuhao
}

\let\oldtable=\table
\renewcommand\table[1][]{
    \vskip0.5\baselineskip
    \oldtable[#1]
    \wuhao
    \renewcommand{\arraystretch}{1.5}
}

\newcommand{\monthname}[1]{%
\ifcase#1
\or January%
\or February%
\or March%
\or April%
\or May%
\or June%
\or July%
\or August%
\or September%
\or October%
\or November%
\or December%
\fi}


% The denotation environment
\newenvironment{denotation}[1][2.5cm]{ % many thanks to THUthesis!
  \chapter*{主要符号表}
  \addcontentsline{toc}{chapter}{主要符号表}
  \chaptermark{主要符号表}
  \noindent\begin{list}{}%
    {\vskip-30bp %\xiaosi[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{1em} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}

\newcommand{\xjtuappendix}{
    \begin{appendix}
    % \renewcommand{\thechapter}{附录\Alph{chapter}}
    \chaptermark{附\quad 录}
    % \renewcommand{\tablename}{附录\thechapter -表}
    % \renewcommand{\figurename}{附录\thechapter -图}
    \renewcommand\thefigure{% thanks to fitsir<at>gmail.com
     \ifnum \c@chapter>\z@ 附录\thechapter-\fi\@arabic\c@figure%
    }
    \renewcommand\thetable{%
        \ifnum \c@chapter >\z@ 附录\thechapter-\fi \@arabic \c@table%
    }
    \renewcommand\theequation{%
        \ifnum \c@chapter >\z@ 附录\thechapter-\fi \@arabic \c@equation%
    }
    \captionsetup[table]{font={small,stretch=0.7}}
    \captionsetup[figure]{font={small,stretch=0.7}}
}
\newcommand{\xjtuendappendix}{\end{appendix}}
\newcommand{\xjtuappendixchapter}[1]{
    \stepcounter{chapter}
    \chapter*{附录\thechapter\quad#1}
    \addcontentsline{toc}{chapter}{附录\thechapter\quad #1}
}
\newcommand{\xjtuappendixsection}[1]{
    \stepcounter{section}
    \section*{#1}
    % \addcontentsline{toc}{section}{\thesection\quad #1}
}
\newcommand{\xjtuappendixsubsection}[1]{
    \stepcounter{subsection}
    \vspace*{0.5cm}
    \subsection*{#1}
    % \addcontentsline{toc}{subsection}{\thesubsection\quad #1}
}
\newcommand{\xjtuappendixsubsubsection}[1]{
    \stepcounter{subsubsection}
    \subsubsection*{#1}
    % \addcontentsline{toc}{subsubsection}{\thesubsubsection\quad #1}
}
\newcommand{\xjtuappendixechapter}[1]{
    \echapter*{\thechapter\quad#1}
    % \addcontentsline{toe}{chapter}{\thechapter\quad #1}
}
\newcommand{\xjtuappendixesection}[1]{
    \esection*{#1}
    % \addcontentsline{toe}{section}{\thesection\quad #1}
}
\newcommand{\xjtuappendixesubsection}[1]{
    \esubsection*{#1}
    % \addcontentsline{toe}{subsection}{\thesubsection\quad #1}
}
\newcommand{\xjtuappendixesubsubsection}[1]{
}

\let\oldtableofcontents=\tableofcontents
\def\tableofcontents{
    \oldtableofcontents
}

% The ``compact'' option eliminates the empty pages
\ifxjtu@compact
    \let\oldcleardoublepage=\cleardoublepage
    \def\cleardoublepage{
        \clearpage
    }
\fi

\ifxjtu@bachelor

    \ifxjtu@bigskip
      \linespread{1.5} \selectfont
    \else
      \linespread{1.25} \selectfont
    \fi

    \newcommand{\coverul}[3]{%
        \renewcommand \ULdepth {#1}%
        \renewcommand \ULthickness {#2}%
        \uline{#3}%
    }
    \newcommand{\coverboxul}[4]{%
        \coverul{#1}{#2}{\makebox[#3]{\hfill{#4}\hfill}}
    }
    \newcommand{\ezcoverul}[1]{
        \coverul{3pt}{1pt}{#1}
    }
    \newcommand{\ezcoverboxul}[2]{
        \ezcoverul{\makebox[#1]{\hfill{#2}\hfill}}
    }
    \newcommand{\ezul}[1]{
        \coverul{2pt}{0.8pt}{#1}
    }
    \newcommand{\ezboxul}[2]{
        \ezul{\makebox[#1]{\hfill{#2}\hfill}}
    }
    \newcommand{\ezfillul}[1]{
        \ezul{\hspace{\fill}#1\hspace{\fill}}
    }
    \newcommand\blankul{
        \ezul{\,\hspace{\fill}}
    }
    \newcommand\blankpage{%
        \null
        \thispagestyle{empty}%
        \addtocounter{page}{-1}%
        \newpage
    }

    \renewcommand\footnoterule{\vspace*{-3pt}% eggache!
        \hrule width 0.25\textwidth height 0.4pt
            \vspace*{2.6pt}}

    \fancypagestyle{plain}{%
      \fancyhf{}
      \fancyhead[OC]{\begin{spacing}{0.3}\if@mainmatter\wuhao \ifxjtu@inmainbody\thechapter\quad\fi \leftmark\fi\end{spacing}}
      \fancyhead[EC]{\begin{spacing}{0.3}\wuhao 西安交通大学本科毕业设计（论文）\end{spacing}}
      \fancyfoot[OR,EL]{\xiaowu ~\thepage~}
      \renewcommand{\headrulewidth}{\if@mainmatter 0.5pt\else 0pt \fi}
      \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .5pt
      \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}
    }
    \pagestyle{plain}

    \type{本科}

    \renewcommand\xjtuchead{
        \thispagestyle{empty}
        \newgeometry{headheight=5.5mm,textheight=257mm,voffset=2cm,headsep=4.5mm,textwidth=146.6mm,left=31.7mm,right=31.7mm}
        \topmargin=-1in
        \begin{center}
            \linespread{1.2}
            \vspace*{-4pt}
            \includegraphics[width=11422590sp]{logo_red}\\
            \vspace{\baselineskip}
            \vspace{-2pt}
            \hspace{3pt}\includegraphics[]{figures/head}
            % {\renewcommand{\CJKglue}{\hskip 3.55pt}\xiaochu\textcolor{red}{\textbf{毕业设计（论文）}}}\\
            \vspace{2\baselineskip}
            \vspace{14pt}
            \sanhao\textbf{
                \begin{tabular}{ @{}p{146.6mm} }
                \makebox[3em]{题\hspace{\fill}目}\ezcoverboxul{\textwidth-3em}{\xjtu@covertitlefirst}\\[8pt]
                \makebox[3em]{\hfill}\ezcoverboxul{\textwidth-3em}{\xjtu@covertitlesecond}\\[14pt]
                \vspace{2\baselineskip}
                \ezcoverul{~\xjtu@cschool~}学院~
                \ezcoverul{~\xjtu@cmajor~}系（专业）~
                \ezcoverul{~\xjtu@cclass~}班\\
                \vspace{\baselineskip}
                \makebox[4em][s]{学生姓名}\ezcoverboxul{\textwidth-4em}{\xjtu@cauthor}\\
                \vspace{\baselineskip}
                \makebox[4em][s]{学\hspace{\fill}号}\ezcoverboxul{\textwidth-4em}{\xjtu@stuid}\\
                \vspace{\baselineskip}
                \makebox[4em][s]{指导教师}\ezcoverboxul{\textwidth-4em}{\xjtu@csupervisor}\\
                \vspace{\baselineskip}
                \makebox[6em][s]{设计所在单位}\ezcoverboxul{\textwidth-6em}{\xjtu@cactualinstitution\qquad\,}\\
            \end{tabular}}
            \vskip 2\baselineskip
            \vskip -3pt
            \sanhao\textbf{\xjtu@cyear 年~\xjtu@cmonth 月~}
        \end{center}

        \restoregeometry
        \blankpage
    }

    \newcommand\ctaskdescription{
        \newrefsection
        \setcounter{page}{1}
        \chaptermark{毕业设计（论文）任务书}
        \wuhao{
            \vspace*{-0.3em}
            \begin{tabularx}{\textwidth}{p{7.5cm}r}
                \\[3pt]
                & \makebox[6em]{系\hspace{\fill}(\hspace{\fill}专\hspace{\fill}业\hspace{\fill})}~\ezboxul{11em}{\hfill\xjtu@taskmajor\hfill}\\
                \multicolumn{1}{c}{\multirow{2}{*}{\sanhao\textbf{西~~安~~交~~通~~大~~学}}}
                & \makebox[6em]{系(专业)主任}~\ezboxul{11em}{\hfill\xjtu@taskpresident\hfill}\\
                & \makebox[6em]{批\hspace{\fill}准\hspace{\fill}日\hspace{\fill}期}~\ezboxul{11em}{\hfill\xjtu@taskapprovaldate\hfill}\\
            \end{tabularx}
            \vskip 2\baselineskip
            \begin{center}
                {\erhao\bf 毕业设计(论文)任务书}
            \end{center}
            \vspace*{20pt}
            \ezul{\quad\xjtu@taskschool\quad}学院~
            \ezul{\quad\xjtu@taskmajor\quad}系(专业)~
            \ezul{\quad\xjtu@taskclass\quad}班~\hspace{\fill}
            学生~\ezul{\quad\xjtu@taskauthor\quad}\\\vspace{-10pt}\\
            毕业设计(论文)课题~\ezfillul{\xjtu@tasktitle}\\\vspace{-10pt}\\
            毕业设计(论文)工作自~\ezfillul{\xjtu@taskfromyear}~年~\ezfillul{\xjtu@taskfrommonth}~月~\ezfillul{\xjtu@taskfromday}~日起至~\ezfillul{\xjtu@tasktoyear}~年~\ezfillul{\xjtu@tasktomonth}~月~\ezfillul{\xjtu@tasktoday}~日止\\\vspace{-10pt}\\
            毕业设计(论文)进行地点：\ezfillul{\xjtu@taskplace}

            \vskip 10pt
            {\noindent 课题的背景、意义及培养目标}\vspace{-15pt}\\

            \xjtu@taskbackground

            \vskip 10pt
            {\noindent 设计(论文)的原始数据与资料}\vspace{-15pt}\\

            \xjtu@taskrawmaterial

            \vskip 10pt
            {\noindent 课题的主要任务}\vspace{-15pt}\\

            \xjtu@taskmaintask

            \vskip 10pt
            {\noindent 课题的基本要求(工程设计类题应有技术经济分析要求)}\vspace{-15pt}\\

            \xjtu@taskrequirement

            \vskip 10pt
            {\noindent 完成任务后提交的书面材料要求(图纸规格、数量，论文字数，外文翻译字数等)}\vspace{-15pt}\\

            \xjtu@taskfinalmaterial

            \vskip 10pt
            {\noindent 主要参考文献}\vspace{-15pt}\\

            % 非常 dirty 的方式给任务书中的参考文献加下划线
            \ifxjtu@taskunderline
                \begin{tikzpicture}[line width=2pt]
                    \put(-15,-20){\line(1,0){440}}
                    \put(-15,-36){\line(1,0){440}}
                    \put(-15,-52){\line(1,0){440}}
                    \put(-15,-74){\line(1,0){440}}
                    \put(-15,-90){\line(1,0){440}}
                    \put(-15,-111){\line(1,0){440}}
                    \put(-15,-127){\line(1,0){440}}
                    \put(-15,-148){\line(1,0){440}}
                    \put(-15,-164){\line(1,0){440}}
                    \put(-15,-180){\line(1,0){440}}
                    \put(-15,-201){\line(1,0){440}}
                    \put(-15,-217){\line(1,0){440}}
                    \put(-15,-238){\line(1,0){478}}
                    \put(-15,-254){\line(1,0){440}}
                    \put(-15,-275){\line(1,0){440}}
                    \put(-15,-291){\line(1,0){440}}
                    \put(-15,-312){\line(1,0){440}}
                    \put(-15,-328){\line(1,0){440}}
                    \put(-15,-349){\line(1,0){440}}
                    \put(-15,-365){\line(1,0){440}}
                \end{tikzpicture}
                \xjtu@taskunderlinetrue
            \fi

            \AtNextBibliography{\wuhao}
            \defbibheading{taskbib}[]{\vspace{-10pt}}
            \printbibliography[heading=taskbib]
            \xjtu@taskothertaskreference

            \vspace{2\baselineskip}


            \begin{flushright}
                指导教师：\ezboxul{12em}{\xjtu@taskteachername}\\[14pt]
                接受设计（论文）任务日期：\ezboxul{12em}{\xjtu@taskteacherdate}\\[14pt]
                （注：由指导教师填写）\hspace{\fill}学生签名：\ezboxul{12em}{\xjtu@taskauthorname}\\
            \end{flushright}

            % 非常 dirty 的方式给任务书中的参考文献加下划线
            \ifxjtu@taskunderline
                \begin{tikzpicture}
                    \put(-21,186){\line(1,0){446}}
                    \put(-21,170){\line(1,0){446}}
                    \put(-21,154){\line(1,0){446}}
                \end{tikzpicture}
            \fi

        }
        \xjtu@clearpage
    }

    \newcommand\creviewopinion{

        \chaptermark{毕业设计(论文)考核评议书}
        \begin{center}
            \vspace*{0.2em}
            \sanhao\bf{西\quad 安\quad 交\quad 通\quad 大\quad 学}\\
            \vspace{0.3em}
            \erhao\bf{毕业设计(论文)考核评议书}
        \end{center}
        \wuhao
        \vspace*{1em}
        \ezfillul{\xjtu@reviewschool}学院\ezfillul{\xjtu@reviewmajor}系(专业)\ezfillul{\xjtu@reviewclass}班级\\
        \let\oldbaselineskip\baselineskip
        \setlength{\baselineskip}{20pt}

        指导教师对学生\ezboxul{9.5em}{\xjtu@reviewauthor}所完成的课题为\ezfillul{\quad\xjtu@reviewtitle\quad}\\
        的毕业设计(论文)进行的情况，完成的质量及评分的意见：\ezfillul{\xjtu@reviewteachercomment}\\
        % \blankul\\
        % \blankul\\
        % \blankul\\
        指导教师建议成绩：\ezul{\quad\xjtu@reviewteachergrade\quad}\\
        \hspace*{\fill}指导教师\ezboxul{11em}{\xjtu@reviewteachername}\\
        \hspace*{\fill}\quad\xjtu@reviewteacheryear\quad 年\quad\xjtu@reviewteachermonth\quad 月\quad\xjtu@reviewteacherday\quad 日\quad\,\\
        \begin{center}
            \erhao\bf{毕业设计(论文)评审意见书}
        \end{center}
        \wuhao
        \vspace*{1em}
        \setlength{\baselineskip}{20pt}

        评审意见：\ezfillul{\quad\xjtu@reviewercomment}\\
        \blankul\\
        评阅人建议成绩：\ezul{\quad\xjtu@reviewergrade\quad}\\
        \hspace*{\fill}评阅人\ezboxul{8em}{\xjtu@reviewername}职称\ezboxul{5.5em}{\xjtu@reviewertitle}\\
        \hspace*{\fill}\quad\xjtu@revieweryear\quad 年\quad\xjtu@reviewermonth\quad 月\quad\xjtu@reviewerday\quad 日\quad\quad\,\\

        % \backgroundsetup{
        %     position={80mm,-105mm},
        %     scale=1,
        %     color=black,
        %     opacity=1,
        %     angle=0,
        %     contents={\includegraphics[width=\paperwidth]{page3}}
        % }
        % \BgThispage
        % \textcolor{white}{\_}
        \clearpage
    }

    \newcommand\cfinalresult{
        \chaptermark{毕业设计(论文)答辩结果}
        \vspace*{\baselineskip}
        \begin{center}
            \erhao\bf{毕业设计(论文)答辩结果}\\
        \end{center}
        \vspace{0.7\baselineskip}
        \hspace*{4.2cm}{\sanhao{\ezboxul{10em}{\xjtu@resultschool}\bf{院}}}\\
        \vspace{-10pt}\\
        \hspace*{4.2cm}{\sanhao{\ezboxul{9em}{\xjtu@resultmajor}\bf{系(专业)}}}\\
        \vspace{-18pt}\\

        \wuhao
        \setlength{\baselineskip}{22.9pt}
        毕业设计(论文)答辩组对学生\ezboxul{8em}{\xjtu@resultauthor}所完成的课题为\ezfillul{\quad\xjtu@resulttitle\quad}\\
        \blankul\\
        的毕业设计(论文)经过答辩，其意见为\ezfillul{\quad\xjtu@resultcomment\quad}\\
        \blankul\\
        \blankul\\\,\\
        并确定成绩为\ezul{\qquad\quad\xjtu@resultgrade\hspace{\fill}}\\
        \vspace{2\baselineskip}\\
        \hspace*{\fill}毕业设计(论文)答辩组负责人\ezboxul{8em}{\xjtu@resultprincipal}\\
        \hspace*{\fill}答辩组成员\ezboxul{7.25em}{\xjtu@resultmenberaname}\quad\ezboxul{7em}{\xjtu@resultmenberbname}\\
        \hspace*{\fill}\ezboxul{7.25em}{\xjtu@resultmenbercname}\quad\ezboxul{7em}{\xjtu@resultmenberdname}\\
        \hspace*{\fill}\ezboxul{7.25em}{\xjtu@resultmenberename}\quad\ezboxul{7em}{\xjtu@resultmenberfname}\\
        \hspace*{\fill}\quad\xjtu@resultyear\quad 年\quad\xjtu@resultmonth\quad 月\quad\xjtu@resultday\quad 日\quad\,\\

        % \backgroundsetup{
        %     position={80mm,-105mm},
        %     scale=1,
        %     color=black,
        %     opacity=1,
        %     angle=0,
        %     contents={\includegraphics[width=\paperwidth]{page4}}
        % }
        % \BgThispage
        % \textcolor{white}{\_}
        \clearpage
        \let\baselineskip\oldbaselineskip
    }

    \renewcommand\xjtucinfopage{
        \chaptermark{摘\quad 要}
        \xiaosi
        \noindent {\bf
        论文题目： \xjtu@ctitle\\
        学生姓名： \xjtu@cauthor\\
        指导教师： \xjtu@csupervisor\\
        }

        \begin{center}
          \sanhao
          摘\quad 要
        \end{center}

        \vskip 0.5em

        \xjtu@cabstract

        \mbox{}

        {\wuhao \noindent
            {\bf 关键词}：
        \xjtu@ckeywords}
        \clearpage
    }
    \renewcommand\xjtueinfopage{
        \chaptermark{ABSTRACT}
        \noindent {\bf
        Title: \xjtu@etitle\\
        Name: \xjtu@eauthor\\
        Supervisor: \xjtu@esupervisor\\
        }

        \vspace*{-0.5em}

        \begin{center}
          \sanhao
          ABSTRACT
        \end{center}

        \vskip -1em

        {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{1em}
        \xjtu@eabstract
        }

        \mbox{ }

        {\wuhao\noindent
            {\bf KEY WORDS: }
            \xjtu@ekeywords
        }

        \xjtu@clearpage
    }

    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{1.5pt}

    \renewcommand\xjtucontent{
        \xjtu@clearpage
        \pagenumbering{arabic}
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\centering\thechapter\quad}[]
        \xjtu@inmainbodytrue
    }
    \renewcommand\xjtuendcontent{
        \newpage
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\centering}[]
        \titleformat{\section}[hang]{\xiaosan}{}{0em}{\thesection\quad }[\vskip -0.5em]
        \titleformat{\subsection}{\sihao}{}{0em}{\vskip -1.5em \thesubsection\quad{}}
        \titleformat{\subsubsection}{}{}{0em}{\thesubsubsection\quad}[]
        % \titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        % \titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        % \titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlespacing{\subsection}{0em}{0.5\baselineskip}{0\baselineskip}
        \titlespacing{\subsubsection}{0em}{0.2\baselineskip}{0\baselineskip}
        \xjtu@inmainbodyfalse
    }

    \newcommand{\xjtubib}[1]{ {
        \phantomsection
        \addcontentsline{toc}{chapter}{参考文献}
        \defbibheading{xjtubibhead}[]{\chapter*{参考文献}\chaptermark{参考文献}\vspace{2\baselineskip}\wuhao}
        \printbibliography[heading=xjtubibhead]
        \clearpage
    } }

    \newcommand\xjtutopicreview{
        \xjtu@clearpage
        \pagestyle{empty}
        \newgeometry{left=5mm,right=5mm,top=2mm,bottom=2mm}
        \setlength\parindent{20pt}
        % \vspace*{-0.1\baselineskip}
        \begin{center}
            {\xiaosan 本科毕业设计（论文）选题审核表}
        \end{center}
        % \vspace*{\baselineskip}
        \begin{center}
        \xiaosi
        \tablefirsthead{\shline}
        \tablehead{\hline}
        \tabletail{\hline}
        \tablelasttail{\shline}

        \begin{supertabular}{IccccccccI}
            \multicolumn{1}{Im{10mm}<{\centering}}{学院} &
            \multicolumn{1}{|m{22mm}<{\centering}}{\vspace{4pt}\xjtu@topicschool} &
            \multicolumn{1}{|m{17mm}<{\centering}}{系(专业)} &
            \multicolumn{1}{|m{22mm}<{\centering}}{\vspace{4pt}\xjtu@topicmajor} &
            \multicolumn{1}{|m{17mm}<{\centering}}{指导教师} &
            \multicolumn{1}{|m{17mm}<{\centering}}{\xjtu@topicteachername} &
            \multicolumn{1}{|m{17mm}<{\centering}}{职称} &
            \multicolumn{1}{|m{17mm}<{\centering}I}{\vspace{4pt}\xjtu@topicteachertitle} \\ \hline

            \multicolumn{5}{Ip{90mm}<{\centering}}{\multirow{2}{*}{\tabincell{p{90mm}}{\vspace{-4pt}题目名称:\\\xjtu@topictitle}}} &
            \multicolumn{1}{|m{17mm}<{\centering}}{题目类别} &
            \multicolumn{1}{|m{17mm}<{\centering}}{题目来源} &
            \multicolumn{1}{|m{17mm}<{\centering}I}{学生人数} \\ \cline{6-8}

                & & & & &
            \multicolumn{1}{|m{17mm}<{\centering}}{\xjtu@topicprojecttype} &
            \multicolumn{1}{|m{17mm}<{\centering}}{\vspace{4pt}\xjtu@topictopicsource} &
            \multicolumn{1}{|m{17mm}<{\centering}I}{\xjtu@topicstudentnum} \\ \hline

            \multicolumn{8}{Ip{167mm}I}{
            一、本题目目的、意义：
            \vspace{0.5em}
            \par\xjtu@topicpurpose\vspace{0.5em}}\\ \hline

            \multicolumn{8}{Ip{167mm}I}{
            二、主要工作内容：
            \vspace{0.5em}
            \par\xjtu@topiccontent\vspace{0.5em}}\\ \hline

            \multicolumn{8}{Ip{167mm}I}{
            三、前期工作及具备条件：
            \vspace{0.5em}
            \par\xjtu@topicbackground
            \par\hspace*{\fill}指导教师签名：\xjtu@topicteachername\qquad\,
            \par\hspace*{\fill}\xjtu@topicteacheryear~年~\xjtu@topicteachermonth~月~\xjtu@topicteacherday~日\qquad\,}\\ \hline

            \multicolumn{8}{Ip{167mm}I}{
            系(专业)意见：

            \xjtu@topicmajoropinion
            \vspace{2em}

            \hspace*{\fill}系(专业)主任签名：\xjtu@topicmajorpresident\qquad\,

            \hspace*{\fill}\xjtu@topicmajorpresidentyear~年~\xjtu@topicmajorpresidentmonth~月~\xjtu@topicmajorpresidentday~日\qquad\,
            \vspace{1em}}\\ \hline

            \multicolumn{8}{Ip{167mm}I}{
            学院审核意见：

            \xjtu@topicschoolopinion
            \vspace{2em}

            \hspace*{\fill}主管教学院长签名：\xjtu@topicschoolpresident\qquad\,

            \hspace*{\fill}\xjtu@topicschoolpresidentyear~年~\xjtu@topicschoolpresidentmonth~月~\xjtu@topicschoolpresidentday~日\qquad\,
            \vspace{1em}}\\

        \end{supertabular}
        \end{center}

        \begin{center}
        \tablefirsthead{}
        \tablehead{}
        \tabletail{}
        \tablelasttail{}
        \begin{supertabular}{ll}
            注： &
            \multicolumn{1}{p{160mm}}{
                1、题目类别：工程设计、专题研究、综合实验。

                2、题目来源：国家项目、省部级或学校科研任务、校外协作项目、实验室建设、就业所在单位项目、自选。

                3、系(专业)意见主要是指对题目难度是否适中、题目内容能否达到毕业设计（论文）的教学要求和目的、完成本题目的条件是否满足等方面给出审核意见。

                4、本表由指导教师填写，学院存档保存。
            }\\
        \end{supertabular}
        \end{center}
        \xjtu@clearpage
        \restoregeometry
    }

    \newcommand\xjtuinterimchecklist{
        \pagestyle{empty}
        \newgeometry{left=30mm,right=30mm,top=2mm,bottom=2mm}
        \begin{center}
            {\xiaosan 本科毕业设计（论文）中期检查表}
        \end{center}
        \wuhao
        \hspace*{\fill}专业班级：\xjtu@interimchecklistclass
        \vspace{-1em}
        \begin{center}
            \renewcommand\arraystretch{1.5}
            \begin{tabular}{cccccc}
            \shline
            \multicolumn{1}{Ic}{\multirow{2}{*}{学院}} &
            \multicolumn{1}{|c}{\multirow{2}{*}{\xjtu@interimchecklistschool}} &
            \multicolumn{1}{|c}{\multirow{2}{*}{导师}} &
            \multicolumn{1}{|c}{\multirow{2}{*}{\xjtu@interimchecklistteacher}} &
            \multicolumn{1}{|c}{学生姓名} &
            \multicolumn{1}{|cI}{\xjtu@interimchecklistauthor}\\\cline{5-6}

            \multicolumn{1}{Ic}{} &
            \multicolumn{1}{|c}{} &
            \multicolumn{1}{|c}{} &
            \multicolumn{1}{|c}{} &
            \multicolumn{1}{|c}{学号} &
            \multicolumn{1}{|cI}{\xjtu@interimcheckliststuid}\\ \hline

            \multicolumn{1}{Ic}{\multirow{2}{*}{课题名称}} &
            \multicolumn{3}{|c}{\multirow{2}{*}{\xjtu@interimchecklisttitle}} &
            \multicolumn{2}{|cI}{有无关于指导的文字记录}\\\cline{5-6}

            \multicolumn{1}{Ic}{} &
            \multicolumn{1}{|c}{} &
            \multicolumn{1}{c}{} &
            \multicolumn{1}{c}{} &
            \multicolumn{1}{|c}{
                \ifinterimchecklistrecord
                $\surd$
                \fi
                有} &
            \multicolumn{1}{|cI}{
                \ifinterimchecklistrecord\else
                $\surd$
                \fi
                无}\\\hline

            \multicolumn{4}{Il}{
                \multirow{2}{*}{
                    \begin{tabular}{p{4.42cm}<{\centering}|p{4.42cm}<{\centering}}
                        初稿计划完成时间 & 修改稿计划完成时间 \\
                        \xjtu@interimchecklistdrafttime & \xjtu@interimchecklistmanuscripttime
                    \end{tabular}
                }
            } & \multicolumn{2}{|cI}{定稿计划完成时间} \\\hline

            \multicolumn{1}{Ic}{} & & & & \multicolumn{2}{|cI}{\xjtu@interimchecklistfinalizedtime} \\\hline

            \multicolumn{6}{Ip{14.6cm}I}{
                1．指导情况（指导方式和内容、学生执行情况）：\par
                \xjtu@interimchecklistguidance
                \vspace{0.5em}\par
                2．对毕业设计（论文）目标与方案的执行情况：\par
                \xjtu@interimchecklistimplementation
                \vspace{0.5em}\par
                3．存在的问题、拟采取解决问题的方案及措施：\par
                \xjtu@interimchecklistproblem
                \vspace{0.5em}\par
                \hspace{\fill}导师签名：\xjtu@interimchecklistteachername\qquad\,\par
                \hspace{\fill}\xjtu@interimchecklistteacheryear~年~\xjtu@interimchecklistteachermonth~月~\xjtu@interimchecklistteacherday~日\qquad\,
            }\\\hline

            \multicolumn{6}{Ip{14cm}I}{
                系（专业）意见：
                \vspace{0.5em}\par
                \xjtu@interimchecklistmajoropinion
                \vspace{0.5em}\par
                \hspace{\fill}系（专业）主任签名：\xjtu@interimchecklistmajorpresidentname\quad\,\par
                \hspace{\fill}\xjtu@interimchecklistmajorpresidentyear~年~\xjtu@interimchecklistmajorpresidentmonth~月~\xjtu@interimchecklistmajorpresidentday~日\quad\,
            }\\\shline
        \end{tabular}
        \end{center}
        \vspace{0.5em}\par
        \noindent 注：理工医艺术类不填“初稿计划完成时间、修改稿计划完成时间、定稿计划完成时间”。

        \hspace{\fill}主管教学院长签名：\xjtu@interimchecklistschoolpresidentname~\quad \xjtu@interimchecklistschoolpresidentyear~年~\xjtu@interimchecklistschoolpresidentmonth~月~\xjtu@interimchecklistschoolpresidentday~日

        \xjtu@clearpage
        \restoregeometry
    }

    \newcommand\xjtuprogresschecklist{
        \pagestyle{empty}
        \begin{landscape}
            \begin{center}
                {\xiaosan 本科毕业设计（论文）工作进展情况记录表}
            \end{center}

            \xiaosi
            \noindent 毕业设计（论文）题目：\xjtu@progresschecklisttitle\\
            \noindent 学生姓名：\xjtu@progresschecklistauthor\qquad 学号：\xjtu@progresscheckliststuid\qquad 专业班级：\xjtu@progresschecklistclass\qquad 指导教师：\xjtu@progresschecklistteacher

            \wuhao
            \setlength{\baselineskip}{10pt}
            \begin{table}[!h]
                \centering
                \begin{tabular}{llll}
                    \shline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}周（次）} & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}日期}                          & \multicolumn{1}{|p{9cm}<{\centering}}{\vspace{-8pt}具体工作内容}                   & \multicolumn{1}{|p{9cm}<{\centering}I}{\vspace{-8pt}指导教师指导情况}               \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 1}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistadate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistawork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistateach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 2}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistbdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistbwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistbteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 3}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistcdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistcwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistcteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 4}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistddate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistdwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistdteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 5}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistedate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistework} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklisteteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 6}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistfdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistfwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistfteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 7}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistgdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistgwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistgteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 8}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklisthdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklisthwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklisthteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt} 9}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistidate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistiwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistiteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}10}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistjdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistjwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistjteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}11}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistkdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistkwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistkteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}12}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistldate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistlwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistlteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}13}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistmdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistmwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistmteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}14}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistndate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistnwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistnteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}15}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistodate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistowork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistoteach} \\[4pt]\hline
                        \multicolumn{1}{Ip{2cm}<{\centering}}{\vspace{-8pt}16}      & \multicolumn{1}{|p{3cm}<{\centering}}{\vspace{-8pt}\xjtu@progresschecklistpdate} & \multicolumn{1}{|p{9cm}}{\vspace{-8pt}\xjtu@progresschecklistpwork} & \multicolumn{1}{|p{9cm}I}{\vspace{-8pt}\xjtu@progresschecklistpteach} \\[4pt]\hline
                        \shline
                \end{tabular}
            \end{table}

            \noindent 注：此表由学生如实填写，毕业设计（论文）工作完成后，此表交院（系）教学秘书存档。

            \hspace*{\fill}学生签名：\xjtu@progresschecklistauthorname\qquad 指导教师签名：\xjtu@progresschecklistteachername
        \end{landscape}
    }

   \let\oldfootnote\footnote
   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}

\else % postgraduate
    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{2.0pt} % or 2.25pt

    \fancypagestyle{plain}{%
      \setlength{\voffset}{1.8cm}
      \setlength{\headsep}{1.2cm-\headheight}
      \fancyhf{}
      \fancyhead[CO]{\if@mainmatter\wuhao \ifxjtu@inmainbody\thechapter\quad\fi \leftmark\fi}
      \fancyhead[CE]{\wuhao 西安交通大学\xjtu@type 学位论文}
      \fancyfoot[OR,EL]{\xiaowu ~\thepage~}
      \renewcommand{\headrulewidth}{\if@mainmatter .4pt \else 0pt \fi}
      \renewcommand{\headrule}{\vskip 3pt \hrule \@height \headrulewidth \@width \headwidth \vskip .6pt
      \hrule \@height \headrulewidth \@width \headwidth
      }
    }
    \pagestyle{plain}

    \renewcommand\xjtucover{
        \thispagestyle{empty}
        \setlength\hoffset{0.8cm}
        \hspace*{-3.8cm}
        \rotatebox{-90}{
            \makebox[\textheight][c]{
                \bf \CJKmove \xiaowu \CJKfamily{vert}
                西安交通大学\xjtu@type 学位论文
                \hspace{2cm}
                \xjtu@ctitle
                \hspace{2cm}
                \xjtu@cauthor
                \hspace{2cm}
                \xjtu@cproddate
            }
        }
        \vspace*{-\textheight}\vspace*{-1.4cm}
        \begin{center}
            {
                \sihao 分类号\underline{\makebox[5.2cm][c]{\xjtu@zhongtufenlei}}
                \quad 密级\underline{\makebox[5.2cm][c]{\xjtu@secrettype}} \\
                \vskip 0.4cm U~D~C\underline{\makebox[5.4cm][c]{\xjtu@UDC}}
                \quad 学号\underline{\makebox[5.2cm][c]{\xjtu@stunum}}
            }
            \vskip 9cm
            {\xiaoyi {\bf \xjtu@ctitle}}

            \vskip 4cm
            \begin{spacing}{1.5}
              \sihao
              {\CJKfamily{hei}学位申请人：}  \underline{\makebox[6.2cm][c]{\xjtu@cauthor}}\\
              {\CJKfamily{hei}指~导~教~师~：} \underline{\makebox[6.2cm][c]{\xjtu@csupervisor}}\\
              {\CJKfamily{hei}学~科~专~业~：} \underline{\makebox[6.2cm][c]{\xjtu@csubject}}\\
              {\CJKfamily{hei}学~位~类~别~：} \underline{\makebox[6.2cm][c]{\xjtu@degreetype}}
              \vskip 2cm
              {\CJKfamily{hei}\xjtu@cproddate}
            \end{spacing}
        \end{center}

        \ifxjtu@compact\else
            \clearpage
            \phantom{x}
            \thispagestyle{empty}
        \fi
        \clearpage
        \setlength\hoffset{0cm}
    }

    \renewcommand\xjtuchead{
        \thispagestyle{empty}
        \begin{center}
        \vspace*{1.5cm}
            \includegraphics[width=8cm]{XJTU.pdf} \\
            \vskip 1.2cm
            {\erhao \xjtu@type 学位论文}

            \vskip 3.5cm
            {\bf \sanhao {\bf \xjtu@ctitle}}

            \vskip 6cm
        \begin{spacing}{1.5}\sanhao
            申请人： \xjtu@cauthor\\
            学科专业： \xjtu@csubject\\
            指导教师： \xjtu@csupervisor\\
            \xjtu@cproddate
        \end{spacing}

        \end{center}
        \ifxjtu@compact\else
            \clearpage
            \phantom{x}
            \thispagestyle{empty}
        \fi
        \clearpage
    }

    \renewcommand\xjtuehead{
        \thispagestyle{empty}
        \begin{center}
        \vspace*{1.5cm}
            {\bf \sanhao \xjtu@etitle}

            \vskip 4.2cm
            \begin{spacing}{1.3}\sanhao
            A \thesis\ submitted to \\
            Xi'an Jiaotong University\\
            in partial fulfillment of the requirement\\
            for the degree of\\
            \Master\ of \xjtu@ecate

            \vskip 3cm
            By\\ \xjtu@eauthor\\
            (\xjtu@esubject)\\
            Supervisor: \xjtu@esupervisor\\
            \xjtu@eproddate
            \end{spacing}

        \end{center}
        \ifxjtu@compact\else
            \clearpage
            \phantom{x}
            \thispagestyle{empty}
        \fi
        \clearpage

    }

    \renewcommand\xjtucinfopage{
        \chaptermark{摘\quad 要}
        \pagestyle{plain}
        \pagenumbering{Roman}
        \noindent {\bf \xiaosi
        论文题目： \xjtu@ctitle\\
        学科专业： \xjtu@csubject\\
        申\:\;请\:\;人： \xjtu@cauthor\\
        指导教师： \xjtu@csupervisor\\
        }

        \vskip 0\baselineskip
        \begin{center}
          \sanhao
          摘\quad 要
        \end{center}
        \vskip 1.1\baselineskip

        \xjtu@cabstract

        \mbox{}

        {\wuhao \noindent
            {\bf 关\:\;键\:\;词}：
        \xjtu@ckeywords

        \noindent {\bf 论文类型}：
        \xjtu@ctype
        }
        \clearpage
    }
    \renewcommand\xjtueinfopage{
        \chaptermark{ABSTRACT}
        \noindent {\bf
        Title: \xjtu@etitle\\
        Speciality: \xjtu@esubject\\
        Applicant: \xjtu@eauthor\\
        Supervisor: \xjtu@esupervisor\\
        }

        \vskip 1.1\baselineskip
        \begin{center}
          \sanhao
          ABSTRACT
        \end{center}
        \vskip 0.5\baselineskip


        {
        \begin{spacing}{0.9}
        \setlength{\parindent}{0em}
        \setlength{\parskip}{1em}
        \xjtu@eabstract
        \end{spacing}
        }

        \vskip 1em

        {\wuhao\noindent
            {\bf KEY WORDS: }
            \xjtu@ekeywords

            \noindent {\bf TYPE OF \MakeUppercase{\thesis}} :
            \xjtu@etype
        }

        \clearpage
    }
    \let\oldxjtutoc=\xjtutoc
    \def\xjtutoc{
        \xjtu@clearpage
        \oldxjtutoc
    }

    \renewcommand\xjtucontent{
        \xjtu@clearpage
        \pagenumbering{arabic}
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}\thechapter\quad}[\end{center}]
        \xjtu@inmainbodytrue
    }
    \renewcommand\xjtuendcontent{
        \newpage
        \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}}[\end{center}]
        \titleformat{\section}[hang]{\xiaosan}{}{0em}{\thesection\quad }[\vskip -0.5em]
        \titleformat{\subsection}{\sihao}{}{0em}{\vskip -1.5em \thesubsection\quad{}}
        \titleformat{\subsubsection}{}{}{0em}{\thesubsubsection\quad}[]
        \titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlespacing{\subsection}{0em}{0.5\baselineskip}{0\baselineskip}
        \titlespacing{\subsubsection}{0em}{0.2\baselineskip}{0\baselineskip}
        \xjtu@inmainbodyfalse
    }

    \newcommand{\xjtubib}[1]{ {
        \clearpage
        \phantomsection
        \addcontentsline{toc}{chapter}{参考文献}
        \addcontentsline{toe}{chapter}{References}
        \setlength{\bibsep}{0pt}
        \begin{spacing}{1.2}
        \wuhao
        \bibliographystyle{GBT7714-2005NLang-UTF8}
        \bibliography{#1}
        \end{spacing}
        \clearpage
        } }

   \let\oldfootnote\footnote
   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}

    \renewcommand\xjtuspchapter[3]{
        \chapter*{#2}
        \chaptermark{#1}
        \addcontentsline{toc}{chapter}{#1}
        \addcontentsline{toe}{chapter}{#3}
    }

    \newcommand{\xjtuacademicintegrity}{\thispagestyle{fancy}\fancyfoot{}{ % 仅供参考
        \xjtu@clearpage
        \chaptermark{声明}
        \begin{center}
            \sanhao 学位论文独创性声明（1）
        \end{center}
    本人声明：所呈交的学位论文系在导师指导下本人独立完成的研究成果。文中依法引用他人的成果，均已做出明确标注或得到许可。论文内容未包含法律意义上已属于他人的任何形式的研究成果，也不包含本人已用于其他学位申请的论文或成果。

    本人如违反上述声明，愿意承担以下责任和后果：
    \begin{enumerate}[1] \itemsep1pt \parskip0pt \parsep0pt
        \item 交回学校授予的学位证书；
        \item 学校可在相关媒体上对作者本人的行为进行通报；
        \item 本人按照学校规定的方式，对因不当取得学位给学校造成的名誉损害，进行公开道歉。
        \item 本人负责因论文成果不实产生的法律纠纷。
    \end{enumerate}

    论文作者（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日 \vskip 1cm

    \begin{center}
        \sanhao 学位论文独创性声明（2）
    \end{center}
    本人声明：研究生\hskip 2cm 所提交的本篇学位论文已经本人审阅，确系在本人指导下由该生独立完成的研究成果。

    本人如违反上述声明，愿意承担以下责任和后果：
    \begin{enumerate}[1] \itemsep1pt \parskip0pt \parsep0pt
        \item 学校可在相关媒体上对本人的失察行为进行通报；
        \item 本人按照学校规定的方式，对因失察给学校造成的名誉损害，进行公开道歉。
        \item 本人接受学校按照有关规定做出的任何处理。
    \end{enumerate}

    指导教师（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日 \vskip 1cm


\begin{center}
    \sanhao 学位论文知识产权权属声明
\end{center}
我们声明，我们提交的学位论文及相关的职务作品，知识产权归属学校。学校享有以任何方式发表、复制、公开阅览、借阅以及申请专利等权利。学位论文作者离校后，或学位论文导师因故离校后，发表或使用学位论文或与该论文直接相关的学术论文或成果时，署名单位仍然为西安交通大学。

    论文作者（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日

    指导教师（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日

    \noindent (本声明的版权归西安交通大学所有，未经许可，任何单位及任何个人不得擅自使用)
    } }
\fi

% borrowed from nenuthesis
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

\RequirePackage[shortlabels]{enumitem}
\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}

%\makeatletter
%\renewcommand{\l@chapter}{\@dottedtocline{1}{0em}{1.5em}}
%\makeatother

\titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{section}[1em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{subsection}[2em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
