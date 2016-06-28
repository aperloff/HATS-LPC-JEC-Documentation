\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Presentation}[2013/02/18 v1.1 My custom Beamer-based class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions
\LoadClass{beamer}					% use "amsart" instead of "article" for AMSLaTeX format

\RequirePackage{etex}

%%%%%%%%%%%%%%%%%%%%
% Page style/Theme %
%%%%%%%%%%%%%%%%%%%%
%\usetheme{Warsaw} %Nice design
\usetheme[ULogo,expLogo=CMS]{TAMU} %Nice design
%\useoutertheme{infolines} %sucky design. Rather not use
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
\usetikzlibrary{arrows,shapes,shapes.multipart,backgrounds,calc,decorations.text,decorations.pathreplacing,matrix,shadings,spy}
\tikzstyle{every picture}+=[remember picture]
\tikzstyle{na} = [baseline=-.5ex]
\tikzstyle{arrow} = [draw, -latex']
\tikzstyle{line} = [draw, -]
\RequirePackage{lipsum}
\RequirePackage{transparent}
%\RequirePackage[percent]{overpic} % to overlay text in pictures
%\Requirepackage{pict2e} % to overlay text in pictures
%\RequirePackage{pstricks}
\RequirePackage[printwatermark]{xwatermark}
\RequirePackage{standalone}
\RequirePackage{pdfpages}

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

%Captions/References
%\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup{compatibility=false} %added in 2016
\captionsetup[figure]{labelformat=empty}
%\RequirePackage{hyperref} %Already loaded by the Beamer package

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

%%%%%%%%%%%%%%%%
% Environments %
%%%%%%%%%%%%%%%%
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

%%%%%%%%%
% Other %
%%%%%%%%%
\RequirePackage{cancel}
\RequirePackage{comment}
\RequirePackage{aas_macros} %AAS Abbreviations
\RequirePackage{datetime}
\RequirePackage{calc}% http://ctan.org/pkg/calc

%%%%%%%%%%%%%%%%
% New Commands %
%%%%%%%%%%%%%%%%
\newcommand{\datedsection}[2]{%
\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
\subsection[#1]{#1 \hfill #2}%
}
\newcommand{\PT}{\ensuremath{p_{\mathrm{T}}}\xspace}
\newcommand{\pt}{\ensuremath{p_{\mathrm{T}}}\xspace}
%\newcommand{\pt}{\ensuremath{p_\mathrm{T}}}%
\newcommand{\ET}{\ensuremath{E_{\mathrm{T}}}\xspace}
\newcommand{\HT}{\ensuremath{H_{\mathrm{T}}}\xspace}
\newcommand{\et}{\ensuremath{E_{\mathrm{T}}}\xspace}
\newcommand{\Em}{\ensuremath{E\hspace{-0.6em}/}\xspace}
\newcommand{\Pm}{\ensuremath{p\hspace{-0.5em}/}\xspace}
\newcommand{\PTm}{\ensuremath{{p}_\mathrm{T}\hspace{-1.02em}/\kern 0.5em}\xspace}
\newcommand{\PTslash}{\PTm}
\newcommand{\ETm}{\ensuremath{E_{\mathrm{T}}^{\text{miss}}}\xspace}
\newcommand{\MET}{\ETm}
\newcommand{\ETmiss}{\ETm}
\newcommand{\ETslash}{\ensuremath{E_{\mathrm{T}}\hspace{-1.1em}/\kern0.45em}\xspace}
\newcommand{\VEtmiss}{\ensuremath{{\vec E}_{\mathrm{T}}^{\text{miss}}}\xspace}
\newcommand{\ptvec}{\ensuremath{{\vec p}_{\mathrm{T}}}\xspace}
\newcommand{\ptvecmiss}{\ensuremath{{\vec p}_{\mathrm{T}}^{\kern1pt\text{miss}}}\xspace}
\newcommand{\nn}{\\ \nonumber}
\newcommand{\unit}[1]{\ensuremath{\mathrm{\:#1}}}
\newcommand{\ket}[1]{\left| #1 \right>} % for Dirac bras
\newcommand{\bra}[1]{\left< #1 \right|} % for Dirac kets
\newcommand{\braket}[2]{\left< #1 \vphantom{#2} \right|  \left. #2 \vphantom{#1} \right>} % for Dirac brackets
\newcommand{\avg}[1]{\left< #1 \right>} % for average
\newcommand{\degree}{\ensuremath{^\circ}}
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
\definecolor{Blue}{RGB}{50,0,255}
\definecolor{Yellow}{RGB}{205,173,0}%gold3
\definecolor{darkred}{rgb}{0.5,0,0}
\definecolor{darkgreen}{rgb}{0,0.5,0}
\definecolor{darkblue}{rgb}{0,0,0.5}
\definecolor{maroon}{RGB}{128,0,0}
\def\met{{\not\!\!{E_{T}}}}
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
