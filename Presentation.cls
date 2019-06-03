\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Presentation}[2013/02/18 v1.1 My custom Beamer-based class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

%
% Theme Options
%
\newcommand*\parenttheme{boulder}
\newcommand*\parentoptions{}
\DeclareOption{standardtheme}{%
   \renewcommand*\parenttheme{boulder}%
   \renewcommand*\parentoptions{ULogo=boulderlogoonelinecrop,expLogo=CMS}%
}
\DeclareOption{bouldertheme}{%
   %\renewcommand*\parenttheme{boulder}%
   %\renewcommand*\parentoptions{ULogo=boulderlogoonelinecrop,expLogo=CMS}%
}
\DeclareOption{boulderthemeshortlogo}{%
   %\renewcommand*\parenttheme{boulder}%
   \renewcommand*\parentoptions{ULogo=boulderlogoflcrop,expLogo=CMS}%
}
\DeclareOption{boulderthemeextendedtitleline}{%
   %\renewcommand*\parenttheme{boulder}%
   \renewcommand*\parentoptions{ULogo=boulderlogoonelinecrop,expLogo=CMS,extendedtitleline=5ex}%
}
\DeclareOption{tamutheme}{%
   \renewcommand*\parenttheme{TAMU}%
   \renewcommand*\parentoptions{ULogo=boulderlogoonelinecrop,expLogo=CMS}%
}
\DeclareOption{defaulttheme}{%
   \renewcommand*\parenttheme{default}%
   \renewcommand*\parentoptions{}%
}
\ExecuteOptions{standardtheme}

%
% Header Options
%
\newif\ifhidestarredsections
\newcommand*\hidestarredsections{\hidestarredsectionsfalse}
\DeclareOption{hidestarredsections}{%
   \hidestarredsectionstrue
}

\ProcessOptions*
\LoadClass{beamer}
\usetheme[\parentoptions]{\parenttheme}
%\useoutertheme{infolines} %sucky design. Rather not use

%%%%%%%%%%%%%%%%%%%%
% For TexLive 2018 %
%%%%%%%%%%%%%%%%%%%%
%https://tex.stackexchange.com/questions/426088/texlive-pretest-2018-beamer-and-subfig-collide
\makeatletter
\let\@@magyar@captionfix\relax
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX Modifications %
%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etex}

%%%%%%%%%%%%%%%%%%%%
% Page style/Theme %
%%%%%%%%%%%%%%%%%%%%
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{bibliography item}[text]
%\setbeamertemplate{footline}[page number]
%\RequirePackage[margin=1in]{geometry}	% See geometry.pdf to learn the layout options. There are lots.
%\geometry{letterpaper}					% ... or a4paper or a5paper or ...
%\geometry{landscape}					% Activate for for rotated page geometry
%\RequirePackage[parfill]{parskip}			% Activate to begin paragraphs with an empty line rather than an indent
\RequirePackage{multicol}
\RequirePackage[overlay,absolute]{textpos}
\RequirePackage{rotating}
\RequirePackage{changepage}
\beamertemplatenavigationsymbolsempty

%%%%%%%%%%%%
% Graphics %
%%%%%%%%%%%%
\RequirePackage{graphicx} 	                              % Use pdf, png, jpg, or eps¤ with pdflatex; use eps in DVI mode
                                                              % TeX will automatically convert eps --> pdf in pdflatex
%\RequirePackage[caption=false]{subfig}
%\RequirePackage[tight,hang,nooneline,scriptsize]{subfigure}
%\RequirePackage[caption=false]{subfigure}
\RequirePackage{wrapfig}
\RequirePackage{epsfig}
\RequirePackage{color}
\RequirePackage{tikz}
\usetikzlibrary{arrows,shapes,shapes.multipart,backgrounds,calc,decorations.text,decorations.pathreplacing,matrix,shadings,spy,shadows}
\tikzstyle{every picture}+=[remember picture]
\tikzstyle{na} = [baseline=-.5ex]
\tikzstyle{arrow} = [draw, -latex']
\tikzstyle{line} = [draw, -]
\usepackage[framemethod=tikz]{mdframed}
\RequirePackage{lipsum}
\RequirePackage{transparent}
%\RequirePackage[percent]{overpic} % to overlay text in pictures
%\Requirepackage{pict2e} % to overlay text in pictures
%\RequirePackage{pstricks}
\RequirePackage[printwatermark]{xwatermark}
\RequirePackage{standalone}
\RequirePackage{pdfpages}
\RequirePackage{tcolorbox}
%\RequirePackage{chronology} %clashes with the unit command

%%%%%%%%%%
% Colors %
%%%%%%%%%%
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

%%%%%%%%%%%%%%%%
% Math/Symbols %
%%%%%%%%%%%%%%%%
\RequirePackage{xspace}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\newcommand*{\at}[2][]{#1|_{#2}}
%\big, \Big, \bigg or \Bigg

%%%%%%%%%
% Lists %
%%%%%%%%%
\RequirePackage{enumerate}                              % Allows one to modify the enumerate environment

%%%%%%%%%%%%%%%%%%%%%%%
% Captions/References %
%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{subcaption}
\captionsetup[figure]{labelformat=empty}
%\RequirePackage{hyperref} %Already loaded by the Beamer package
\hypersetup{colorlinks,linkcolor=,urlcolor=blue}

%%%%%%%%%%
% Tables %
%%%%%%%%%%
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{multirow}

%%%%%%%%%%%%%%%%%%
% Font/Paragraph %
%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont}% http://ctan.org/pkg/pifont
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}% http://ctan.org/pkg/lm
\RequirePackage{relsize}
\RequirePackage{hanging}
\RequirePackage{anyfontsize}
\RequirePackage{soul}

%%%%%%%%%%%%%%%%
% Environments %
%%%%%%%%%%%%%%%%
\RequirePackage{varwidth}
\RequirePackage{listings}
\lstset{ %
    backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
    basicstyle=\scriptsize,          % the size of the fonts that are used for the code
    breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
    breaklines=true,                 % sets automatic line breaking
    captionpos=b,                    % sets the caption-position to bottom
    commentstyle=\color{mymauve},    % comment style
    deletekeywords={...},            % if you want to delete keywords from the given language
    escapeinside={^}{^},             % if you want to add LaTeX within your code
    extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
    frame=none,                    % adds a frame around the code
    keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
    keywordstyle=\color{blue},       % keyword style
    language=C++,                    % the language of the code
    morekeywords={*,...},            % if you want to add more keywords to the set
    numbers=none,                    % where to put the line-numbers; possible values are (none, left, right)
    numbersep=5pt,                   % how far the line-numbers are from the code
    numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
    rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
    showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
    showstringspaces=false,          % underline spaces within strings only
    showtabs=false,                  % show tabs within strings adding particular underscores
    stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
    stringstyle=\color{mymauve},     % string literal style
    tabsize=2,                       % sets default tabsize to 2 spaces
    title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}
\RequirePackage{shadowtext}
\RequirePackage{fancyvrb}
\RequirePackage{environ}% defines `NewEnviron`
\NewEnviron{aeq}[1]{%
  \begin{equation}
    \begin{aligned}
      \BODY%
    \end{aligned}
    \label{#1}
  \end{equation}
}

\makeatletter
\newcounter{thistext}
\newcommand{\savetext}[2]{%
  «#1»%
  \addtocounter{thistext}{1}%
  \@namedef{thistext\thethistext}{#2}}
\newcommand{\printthistext}[1]{\@nameuse{thistext#1}}
\makeatother
\newenvironment{myfancyblock}{\begin{center}
\begin{tikzpicture}}{\end{tikzpicture}
\end{center}}

\tikzset{visib/.style={rectangle,color=blue,fill=blue!10,text=black,draw,text opacity=1.0, text width=#1,align=justify}}
\tikzset{invisib/.style={rectangle,color=gray,fill=gray!10,text=black,draw,text opacity=0.4, text width=#1,align=justify}}
\newcommand{\opaqueblock}[5]{
%\node<#1>[visib=#2] (X) {#3};
\node<#1>[visib=#2] at (#3,#4) {#5};
\savetext{mytext}{#3}
}
\newcommand{\invblock}[2]{
\node<#1>[invisib=#2] (X) {\printthistext{\thethistext}};
}

\tcbuselibrary{skins,breakable}
\definecolor{tamumaroon}{HTML}{500000} % changed this
\definecolor{tamugray}{HTML}{8F8F8c} % changed this
\definecolor{tamulightgray}{HTML}{E3E3E3}
\definecolor{tamugold}{HTML}{998031}
\definecolor{tamubeige}{HTML}{EDDD9E}
\newenvironment{myexampleblock}[1]{%
    \tcolorbox[beamer,%
    noparskip,breakable,
    colback=tamulightgray,colframe=ForestGreen,%
    colbacklower=tamulightgray,%
    title=#1]}%
    {\endtcolorbox}
\newenvironment{mytamublock}[1]{%
    \tcolorbox[beamer,%
    noparskip,breakable,
    colback=tamulightgray,colframe=tamumaroon,%
    colbacklower=tamugray!75!Maroon,%
    title=#1]}%
    {\endtcolorbox}
\newenvironment{myalertblock}[1]{%
    \tcolorbox[beamer,%
    noparskip,breakable,
    colback=red,colframe=tamumaroon,%
    colbacklower=tamumaroon!75!Maroon,%
    title=#1]}%
    {\endtcolorbox}
\newenvironment{mynoteblock}[1]{%
    \tcolorbox[beamer,%
    noparskip,breakable,
    colback=tamubeige,colframe=tamugold,%
    colbacklower=tamugray!75!black,%
    title=#1]}%
    {\endtcolorbox}
\newenvironment{myblock}[1]{%
    \tcolorbox[beamer,%
    noparskip,breakable,
    colback=tamulightgray,colframe=NavyBlue,%
    colbacklower=tamulightgray,%
    title=#1]}%
    {\endtcolorbox}

% Defining a new coordinate system for the page:
%
% --------------------------
% |(-1,1)    (0,1)    (1,1)|
% |                        |
% |(-1,0)    (0,0)    (1,0)|
% |                        |
% |(-1,-1)   (0,-1)  (1,-1)|
% --------------------------
\makeatletter
\def\parsecomma#1,#2\endparsecomma{\def\page@x{#1}\def\page@y{#2}}
\tikzdeclarecoordinatesystem{page}{
    \parsecomma#1\endparsecomma
    \pgfpointanchor{current page}{north east}
    % Save the upper right corner
    \pgf@xc=\pgf@x%
    \pgf@yc=\pgf@y%
    % save the lower left corner
    \pgfpointanchor{current page}{south west}
    \pgf@xb=\pgf@x%
    \pgf@yb=\pgf@y%
    % Transform to the correct placement
    \pgfmathparse{(\pgf@xc-\pgf@xb)/2.*\page@x+(\pgf@xc+\pgf@xb)/2.}
    \expandafter\pgf@x\expandafter=\pgfmathresult pt
    \pgfmathparse{(\pgf@yc-\pgf@yb)/2.*\page@y+(\pgf@yc+\pgf@yb)/2.}
    \expandafter\pgf@y\expandafter=\pgfmathresult pt
}
\makeatother

%%%%%%%%%%%%%%%%%%%
% Physics Symbols %
%%%%%%%%%%%%%%%%%%%
\RequirePackage{ptdr-definitions}
\def\met{{\not\!\!{E_{T}}}}

%%%%%%%%%
% Other %
%%%%%%%%%
\RequirePackage{cancel}
\RequirePackage{comment}
\RequirePackage{aas_macros} %AAS Abbreviations
\RequirePackage{datetime}
\RequirePackage{calc}% http://ctan.org/pkg/calc
\RequirePackage{bm}

%%%%%%%%%%%%%%%%%
% Define Colors %
%%%%%%%%%%%%%%%%%
\definecolor{Blue}{RGB}{50,0,255}
\definecolor{Yellow}{RGB}{205,173,0}%gold3
\definecolor{darkred}{rgb}{0.5,0,0}
\definecolor{darkgreen}{rgb}{0,0.5,0}
\definecolor{darkblue}{rgb}{0,0,0.5}
\definecolor{maroon}{RGB}{128,0,0}
\definecolor{envblue}{RGB}{0,51,153}
\definecolor{envgreen}{RGB}{0,102,0}
\definecolor{envorange}{RGB}{255,102,0}

%%%%%%%%%%%%%%%%
% New Commands %
%%%%%%%%%%%%%%%%
\newcommand\cpp{C\nolinebreak[4]\hspace{-.05em}\raisebox{.4ex}{\relsize{-3}{\textbf{++}}}\xspace}
\newcommand{\datedsection}[2]{%
\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
\subsection[#1]{#1 \hfill #2}%
}

\makeatletter
\@ifundefined{unit}{%
\newcommand{\unit}[1]{\ensuremath{\mathrm{\:#1}}}
}{}
\makeatother

\newcommand{\figwidth}{\textwidth}
\newcommand{\figwidthminus}{0.95\textwidth}
\newcommand{\figwidthMC}{0.65\textwidth}
\newcommand{\figwidthtwo}{0.5\textwidth}
\newcommand{\figwidthtwominus}{0.4\textwidth}
\newcommand{\figwidththree}{0.31\textwidth}
\newcommand{\figwidthfour}{0.25\textwidth}
\newcommand{\figwidthfive}{0.20\textwidth}
\newcommand{\figwidthfiveminus}{0.16\textwidth}
\newcommand{\smallmargin}{\setbeamersize{text margin left=0.25cm, text margin right=0.25cm}}
\newcommand{\bigmargin}{\setbeamersize{text margin left=1.0cm, text margin right=1.0cm}}
\newcommand\Wider[3][3em]{%
\makebox[\linewidth][c]{%
  \begin{minipage}[t][#2][t]{\dimexpr\textwidth+#1\relax}
  \raggedright#3
  \end{minipage}%
  }%
} %EXAMPLE: \Wider[-2cm]{5.5cm}{\tableofcontents}
\newcommand{\myitem}{\item[$\blacktriangleright$]}
\newcommand{\myitemtwo}{\item[$\bullet$]}
\newcommand{\myitemthree}{\item[$\diamond$]}
\newcommand\smallFont{\fontsize{2pt}{4.2}\selectfont}
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}%
\newcolumntype{C}{>{\centering\arraybackslash}X}%
\newcommand{\element}[1]
           {
             {#1}
           }
\newcommand{\Aelement}[2]
           {
             $_{#1}$\element{#2}
           }
\newcommand{\Zelement}[2]
           {
             $^{#1}$\element{#2}
           }
\newcommand{\AZelement}[3]
           {
             $_{#2}^{#1}${#3}
           }
\newcommand<>{\fullsizegraphic}[1]{
  \begin{textblock}{0}(0,0.03)
  \includegraphics[width=\paperwidth,height=0.94\paperheight]{#1}
  \end{textblock}
}
\newcommand{\lenitem}[2][.6\linewidth]{\vspace*{-2pt}\parbox[t]{#1}{\strut #2\strut}}
\DeclareRobustCommand{\legendsquare}[1]{%
  \textcolor{#1}{\rule{1.65ex}{1.65ex}}%
}
\newenvironment<>{blueblock}[1]{%
  \setbeamercolor{block title example}{fg=white,bg=envblue!100!white}%
  \setbeamercolor{block body example}{fg=black,bg=envblue!50!white}%
  \begin{exampleblock}{#1}}{\end{exampleblock}}
\newenvironment<>{greenblock}[1]{%
  \setbeamercolor{block title example}{fg=white,bg=envgreen!100!white}%
  \setbeamercolor{block body example}{fg=black,bg=envgreen!50!white}%
  \begin{exampleblock}{#1}}{\end{exampleblock}}
\newenvironment<>{orangeblock}[1]{%
  \setbeamercolor{block title example}{fg=black,bg=envorange!50!white}%
  \setbeamercolor{block body example}{fg=black,bg=envorange!30!white}%
  \begin{exampleblock}{#1}}{\end{exampleblock}}
\newcommand*{\myalign}[2]{\multicolumn{1}{#1}{#2}}
          
%%%%%%%%%%%%%%%%%%%%%%
% Redefined Commands %
%%%%%%%%%%%%%%%%%%%%%%

%
% Set some length shortcuts
%
\setlength{\columnsep}{0cm}
\setlength{\floatsep}{-2em} 
%\setlength{\TPHorizModule}{1.0cm}
%\setlength{\TPVertModule}{\TPHorizModule}
\setlength{\TPHorizModule}{\paperwidth}
\setlength{\TPVertModule}{\paperheight}
\smallmargin

%
% To insert the total number of frames into the footer
%
\begin{comment}
\newcommand*\oldmacro{}%
\let\oldmacro\insertshorttitle%
\renewcommand*\insertshorttitle{%
  \oldmacro\hfill%
  \insertframenumber\,/\,\inserttotalframenumber}

 
\defbeamertemplate*{footline}{shadow theme}
{%
  \leavevmode%
  \hbox{\begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm plus1fil,rightskip=.3cm]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshorttitle\hfill\insertshortauthor
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}%
    \usebeamerfont{title in head/foot}\insertdate\hfill\insertframenumber\,/\,\inserttotalframenumber%
  \end{beamercolorbox}}%
  \vskip0pt%
}

\end{comment} 
\begin{comment}
%
% To show only one section and subsection at a time, uncomment this block
%
\setbeamertemplate{headline}
{%
  \leavevmode%
  \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=2.125ex]{section in head/foot}% original dp=1.125ex
    \hbox to .5\paperwidth{\hfil\insertsectionhead\hfil}
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=2.125ex]{subsection in head/foot}%
    \hbox to .5\paperwidth{\hfil\insertsubsectionhead\hfil}
  \end{beamercolorbox}%
}
\end{comment}

%
% Two ways to add a logo to all slides
%
\begin{comment}
\pgfdeclareimage[height=1.2cm]{uni}{TAMUPrimaryA.jpg}
\logo{\pgfuseimage{uni}}

%\addtobeamertemplate{headline}{}
\addtobeamertemplate{frametitle}{}
{%
\begin{flushright}
\vspace{-1.5cm}\begin{tikzpicture}[remember picture,overlay]
\node [left ]{\includegraphics[width=0.3in]{Tamu-system-logo.png}};
\end{tikzpicture}
\end{flushright}
%\vskip -0.7cm
} 
\end{comment}

%
% Way to have captions on the side of a figure
%  These are some functionalities of the floatrow package which is incompatible with Beamer
%
\makeatletter
\newif\ifcaptionsideisleft
\pgfset{
  fwcas@/.is family,
  fwcas@,
  caption position/.is choice,
  caption position/c/.code={
    \def\fwcas@captionposition{c}\def\fwcas@imageposition{c}
  },
  caption position/b/.code={
    \def\fwcas@captionposition{b}\def\fwcas@imageposition{b}
  },
  caption position/t/.code={
    \def\fwcas@captionposition{T}\def\fwcas@imageposition{T}
  },
  caption left side@/.is if=captionsideisleft,
  caption on the left/.style={caption left side@=true},
  caption on the right/.style={caption left side@=false},
  caption width/.code={
    \pgfmathsetmacro\fwcas@captionwidth{#1}
  },
  image width/.code={
    \pgfmathsetmacro\fwcas@imagewidth{#1}
  },
  every figurewithcaptionatside/.style={
    caption position=c,
    caption on the left,
    caption width=.3\linewidth,
    image width=.7\linewidth,
  },
}
\newcommand\figurewithcaptionatside[3][]{
  \pgfset{fwcas@,every figurewithcaptionatside,#1}
  \ifcaptionsideisleft
  \begin{columns}
    \column[\fwcas@captionposition]{\fwcas@captionwidth pt}
    #2
    \column[\fwcas@imageposition]{\fwcas@imagewidth pt}
    #3
  \end{columns}
  \else
  \begin{columns}
    \column[\fwcas@imageposition]{\fwcas@imagewidth pt}
    #3
    \column[\fwcas@captionposition]{\fwcas@captionwidth pt}
    #2
  \end{columns}
  \fi
}
\makeatother

%
% Overlay aware macros which take row-specific macros like \hline or \rowcolor as arguments
% This way you can have different row colors on different slides
% There is \rowonly, \rowalt and \rowtemporal which work like \only, \alt and \temporal
%
\makeatletter
\newcommand{\rowonly}{%
    \noalign{\ifnum0=`}\fi
    \@rowonly
}
\newcommand<>{\@rowonly}[1]{%
    \only#2%
        {\ifnum0=`{\fi}#1{\ifnum0=`}\fi}%
    \ifnum0=`{\fi}%
    \ignorespaces
}

\newcommand{\rowalt}{%
    \noalign{\ifnum0=`}\fi
    \@rowalt
}
\newcommand<>{\@rowalt}[2]{%
    \alt#3%
        {\ifnum0=`{\fi}#1{\ifnum0=`}\fi}%
        {\ifnum0=`{\fi}#2{\ifnum0=`}\fi}%
    \ifnum0=`{\fi}%
    \ignorespaces
}

\newcommand{\rowtemporal}{%
    \noalign{\ifnum0=`}\fi
    \@rowtemporal
}
\newcommand<>{\@rowtemporal}[3]{%
    \temporal#4%
        {\ifnum0=`{\fi}#1{\ifnum0=`}\fi}%
        {\ifnum0=`{\fi}#2{\ifnum0=`}\fi}%
        {\ifnum0=`{\fi}#3{\ifnum0=`}\fi}%
    \ifnum0=`{\fi}%
    \ignorespaces
}
\makeatother

%https://stackoverflow.com/questions/2611276/latex-beamer-way-to-change-the-bullet-indentation
%Defining a customlist environment
% The shortcomings of the list solution can be ameliorated by defining a new customlist environment that
%   basically redefines the itemize environment from Beamer but also incorporates the \leftmargin and
%   \itemindent (etc.) parameters.
% Use as:
%   \begin{customlist}{2.5em}{0em}
%      \item Any normal item can go here.
%   \end{customlist}
% Default lengths {2em}{0.3em}
\makeatletter
\newenvironment{customlist}[2]{
  \ifnum\@itemdepth >2\relax\@toodeep\else
      \advance\@itemdepth\@ne%
      \beamer@computepref\@itemdepth%
      \usebeamerfont{itemize/enumerate \beameritemnestingprefix body}%
      \usebeamercolor[fg]{itemize/enumerate \beameritemnestingprefix body}%
      \usebeamertemplate{itemize/enumerate \beameritemnestingprefix body begin}%
      \begin{list}
        {
            \usebeamertemplate{itemize \beameritemnestingprefix item}
        }
        { \leftmargin=#1 \itemindent=#2
            \def\makelabel##1{%
              {%  
                  \hss\llap{{%
                    \usebeamerfont*{itemize \beameritemnestingprefix item}%
                        \usebeamercolor[fg]{itemize \beameritemnestingprefix item}##1}}%
              }%  
            }%  
        }
  \fi
}
{
  \end{list}
  \usebeamertemplate{itemize/enumerate \beameritemnestingprefix body end}%
}
\makeatother


% Define commands to turn on and off the additions of new miniframes
%   In the CU theme these get added to the headline as new subsection slide bubbles
% This helps in making sure that, for example, the backup slides are not added to the last section,
%  especially when the backup section is hidden
\makeatletter
\let\beamer@writeslidentry@miniframeson=\beamer@writeslidentry
\def\beamer@writeslidentry@miniframesoff{%
  \expandafter\beamer@ifempty\expandafter{\beamer@framestartpage}{}% does not happen normally
  {%else
    % removed \addtocontents commands
    \clearpage\beamer@notesactions%
  }
}
\newcommand*{\miniframeson}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframeson}
\newcommand*{\miniframesoff}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframesoff}
\makeatother


% Define commands to hide the starred sections from the beamer headline
% Will be turned on if \hidestarredsectionstrue is set (as opposed to \hidestarredsectionsfalse)
\ifhidestarredsections
\makeatletter
\long\def\beamer@@ssection*#1{\beamer@section[]{}}
\makeatother
\fi