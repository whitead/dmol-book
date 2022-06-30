% A template for LiveCoMS submissions.
%
% adapted from elife template, v1.4
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{livecoms}[2017/08/10, v0.5...]

\RequirePackage[english]{babel}

\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{regexpatch}
\RequirePackage{ifxetex,ifluatex}

\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\newif\if@reqslineno
\DeclareOption{lineno}{\@reqslinenotrue}

%% the type of document this is.  The current types:
% bestpractices, editorial, tutorial, training, review, software, lessons
\newif\if@bestpractices
\DeclareOption{bestpractices}{\@bestpracticestrue}

\newif\if@editorial
\DeclareOption{editorial}{\@editorialtrue}

\newif\if@tutorial
\DeclareOption{tutorial}{\@tutorialtrue}

\newif\if@training
\DeclareOption{training}{\@trainingtrue}

\newif\if@review
\DeclareOption{review}{\@reviewtrue}

\newif\if@software
\DeclareOption{software}{\@softwaretrue}

\newif\if@lessons
\DeclareOption{lessons}{\@lessonstrue}

%Publication Information
\newif\if@pubversion
\DeclareOption{pubversion}{\@pubversiontrue}

\newif\if@ASAPversion
\DeclareOption{ASAPversion}{\@ASAPversiontrue}

%% Linespacing.
\newif\if@onehalfspacing
\newif\if@doublespacing
\DeclareOption{onehalfspacing}{\@onehalfspacingtrue}
\DeclareOption{doublespacing}{\@doublespacingtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass{extarticle}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mdframed}

\RequirePackage{lineno}
\if@reqslineno\linenumbers\fi

\ifxetexorluatex
  \RequirePackage[no-math]{fontspec}
  \setmainfont[Ligatures = TeX,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic]
  {OpenSans}
\else
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[default]{opensans}
  \renewcommand{\ttdefault}{lmtt}
\fi

\RequirePackage{microtype}

% Trueno/Open Sans requires a bigger "single" linespread.
\linespread{1.2}
\if@onehalfspacing\linespread{1.5}\fi
\if@doublespacing\linespread{2.0}\fi

\emergencystretch 3em

\RequirePackage{graphicx,xcolor}
\definecolor{LiveCoMSDarkBlue}{HTML}{273B81}
\definecolor{LiveCoMSLightBlue}{HTML}{0A9DD9}
\definecolor{LiveCoMSMediumGrey}{HTML}{6D6E70}
\definecolor{LiveCoMSLightGrey}{HTML}{929497}

\RequirePackage{booktabs}
\RequirePackage{authblk}

% Modified page geometry for LiveComs
\RequirePackage[%left=6cm,%
                %marginparwidth=4cm,%
                %marginparsep=0.5cm,%
                left=2cm,
                right=1.3cm,%
                top=2cm,%
                bottom=2.5cm,%
                headheight=21pt,%
                headsep=2\baselineskip,%
                columnsep=2em,%
                letterpaper]{geometry}%
\RequirePackage{changepage}

\RequirePackage{silence}
\WarningFilter{caption}{The option `hypcap=true' will be ignored}
\WarningFilter{microtype}{Unknown slot}

\RequirePackage[labelfont={bf},%
                labelsep=period,%
                justification=justified,%
                singlelinecheck=false,%
                tableposition=top,font=small]
                {caption}

% \captionsetup*[table]{skip=\medskipamount}


\RequirePackage[square,numbers,sort&compress]{natbib}
\RequirePackage{natmove}
\renewcommand{\bibfont}{\small}
% modifed from https://github.com/gbhutani/vancouver_authoryear_bibstyle/
\IfFileExists{vancouver-livecoms.bst}
  {\bibliographystyle{vancouver-livecoms}}
  {\PackageWarning{elife}{vancouver-livecoms.bst not found; falling back to apalike bibliography style.}\bibliographystyle{apalike}}
% Make author in citation italic
\renewcommand{\NAT@nmfmt}[1]{{\bfseries\itshape\color{LiveCoMSMediumGrey} #1}}

% ...as well as the year
\xpatchcmd{\NAT@citex}
{\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}\NAT@date}}
{\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}\NAT@nmfmt{\NAT@date}}}
{}{\PackageWarning{LiveCoMS}{Failed to patch year format in citation}}

\xpatchcmd{\NAT@citex}
{\else\unskip\NAT@spacechar\NAT@hyper@{\NAT@date}}
{\else\unskip\NAT@spacechar\NAT@hyper@{\NAT@nmfmt{\NAT@date}}}
{}{\PackageWarning{LiveCoMS}{Failed to patch year format in citation}}

\xpatchcmd{\NAT@citex}
{\hyper@natlinkbreak{\NAT@aysep\NAT@spacechar}{\@citeb\@extra@b@citeb}\NAT@date}
{\hyper@natlinkbreak{\NAT@nmfmt{\NAT@aysep\NAT@spacechar}}{\@citeb\@extra@b@citeb}\NAT@nmfmt{\NAT@date}}
{}{\PackageWarning{LiveCoMS}{Failed to patch year format in citation}}

\xpatchcmd{\NAT@citex}
{\@citea\NAT@hyper@{\NAT@date}}
{\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@date}}}
{}{\PackageWarning{LiveCoMS}{Failed to patch year format in citation}}

\xpatchcmd{\NAT@citex}
{{\@citeb\@extra@b@citeb}\NAT@date}
{{\@citeb\@extra@b@citeb}\NAT@nmfmt{\NAT@date}}
{}{\PackageWarning{LiveCoMS}{Failed to patch year format in citation}}
%% There, we're finally done with patching the year in citations.

%
% headers and footers
%

\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
%% Next two lines unnecessary for LiveComs
% \addtolength{\headwidth}{\marginparsep}
% \addtolength{\headwidth}{\marginparwidth}

%% different document types listed here

\newif\ifdocumenttype
\documenttypefalse

\if@bestpractices
\documenttypetrue
\newcommand{\documenttype}{Best Practices Guide}
\else
 % nothing
\fi

\if@editorial
\documenttypetrue
\newcommand{\documenttype}{Editorial}
\else
% nothing
\fi

\if@tutorial
\documenttypetrue
\newcommand{\documenttype}{Tutorial}
\else
% nothing
\fi

\if@training
\documenttypetrue
\newcommand{\documenttype}{Training Article}
\else
% nothing
\fi

\if@review
\documenttypetrue
\newcommand{\documenttype}{Perpetual Review}
\else
% nothing
\fi

\if@software
\documenttypetrue
\newcommand{\documenttype}{Software Analysis}
\else
% nothing
\fi

\if@lessons
\documenttypetrue
\newcommand{\documenttype}{``Lessons Learned'' Document}
\else
% nothing
\fi

\fancyhf{}
\ifdocumenttype
\chead{%
\setlength{\fboxsep}{3pt}
\colorbox{LiveCoMSMediumGrey}{\begin{minipage}{\headwidth}\centering\color{white} A LiveCoMS \documenttype\end{minipage}}%
}
\fi

% Publication information in document footer
% *ONLY INCLUDED IF "pubversion" CLASS OPTION IS INVOKED*
\def\@publishedDOI{}
\def\@publishedvolume{}
\def\@publishedyear{}
\def\@publishedarticlenum{}
\def\@publisheddatereceived{}
\def\@publisheddateaccepted{}
\def \DOIprefix{10.XXXX} %May be able to use this later
\newcommand{\pubDOI}[1]{%
  \appto{\@publishedDOI}{#1}{}{}
}
\newcommand{\pubvolume}[1]{%
  \appto{\@publishedvolume}{#1}{}{}
}
\newcommand{\pubissue}[1]{%
  \appto{\@publishedissue}{#1}{}{}
}
\newcommand{\pubyear}[1]{%
  \appto{\@publishedyear}{#1}{}{}
}
\newcommand{\articlenum}[1]{%
  \appto{\@publishedarticlenum}{#1}{}{}
}
\newcommand{\datereceived}[1]{%
  \appto{\@publisheddatereceived}{#1}{}{}
}
\newcommand{\dateaccepted}[1]{%
  \appto{\@publisheddateaccepted}{#1}{}{}
}

%--------------------------------------------------------
% Footers
% 1. Error Check for conflicting class options
\if@pubversion
  \if@ASAPversion
      \ClassError{livecoms}
      {Nope nope nope, you cannot invoke 'pubversion' and 'ASAPversion' simultaneously. Please correct the class options.}
  \fi
\fi
% 2. Publication Version: put submission/acceptance dates in left footer and citation information in right footer
%%% DWS NOTE: would be nice if the left footer was in an if A-or-B type logical statement
\if@pubversion
  \lfoot{\ifthenelse{\value{page}=1}
    {\small\color{LiveCoMSMediumGrey}Received: \@publisheddatereceived \\ Accepted: \@publisheddateaccepted}
    {~\\~}
  }%
  \rfoot{\small\color{LiveCoMSMediumGrey}\href{https://doi.org/\@publishedDOI}{https://doi.org/\@publishedDOI}\\
    {\it Living J. Comp. Mol. Sci.} \@publishedyear, \@publishedvolume\nobreak\hspace{.05em}(\@publishedissue), \@publishedarticlenum
  }%
\fi
% 3. ASAP Version: put submission/acceptance dates in left footer and "ASAP Version" in right footer
\if@ASAPversion
  \lfoot{\ifthenelse{\value{page}=1}
    {\small\color{LiveCoMSMediumGrey}Received: \@publisheddatereceived \\ Accepted: \@publisheddateaccepted}
    {~\\~}
  }%
  \rfoot{\small\color{LiveCoMSMediumGrey}\href{https://doi.org/\@publishedDOI}{https://doi.org/\@publishedDOI}\\
    {\it Living J. Comp. Mol. Sci.} ASAP Version
  }%
\fi
% 4. Page Number in center of footer
\cfoot{\small\color{white} \vspace{\baselineskip} \small\color{LiveCoMSMediumGrey} \thepage\space of\space\pageref{LastPage}}%
\preto{\footrule}{\color{LiveCoMSMediumGrey}}
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0.4pt}% % No footer rule
%----------------------------------------------------------

%
% section/subsection/paragraph set-up
% Updated for LiveComs
% \setcounter{secnumdepth}{0}
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\LARGE\bfseries\raggedright}
  {\thesection}{1em}{#1}[]
\titleformat{\subsection}
  {\Large\bfseries\raggedright\color{LiveCoMSMediumGrey}}
  {\thesubsection}{1em}{#1}[]
\titleformat{\subsubsection}
  {\large\raggedright\color{LiveCoMSMediumGrey}}
  {\thesubsubsection}{1em}{#1}[]
\titleformat{\paragraph}
  {\large\raggedright\color{LiveCoMSMediumGrey}}
  {\theparagraph}{1em}{#1}[]
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{0pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{0pt}

\RequirePackage{enumitem}
\setlist{noitemsep}

\RequirePackage{alphalph}
\newalphalph{\fnsymbolmult}[mult]{\@fnsymbol}{5}

\newcounter{authorfn}
\setcounter{authorfn}{1}
\newcommand{\authfn}[1]{%
  \fnsymbolmult{\numexpr\value{authorfn}+#1}%
}

\def\@correspondence{}
\def\@contribution{}
\def\@presentaddress{}
\def\@deceased{}
% Added blurb for LiveComs
\def\@blurb{}
\def\@orcidblock{}


\newcommand{\corr}[2]{%
  \ifx\empty\@correspondence\else\appto{\@correspondence}{; }{}{}\fi
  \appto{\@correspondence}{%
    \url{#1}%
    \ifx\empty#2\else\space(#2)\fi
  }{}{}%
}

\newcommand{\contrib}[2][]{
  \appto{\@contribution}{%
  \ifx\empty#1\else\textsuperscript{#1}\fi
  #2\\
  }{}{}
}

\newcommand{\presentadd}[2][]{
  \ifx\empty\@presentaddress\else\appto{\@presentaddress}{; }{}{}\fi
  \appto{\@presentaddress}{%
  \ifx\empty#1\else\textsuperscript{#1}\fi
  #2%
  }{}{}
}

\newcommand{\deceased}[1]{\def\@deceased{\textsuperscript{#1}Deceased}}

% Added for LiveComs
\newcommand{\blurb}[1]{\def\@blurb{#1}}

\newcommand{\orcid}[2]{%
  \ifx\empty\@orcidblock\else\appto{\@orcidblock}{\\}{}{}\fi
  \appto{\@orcidblock}{%
    #1:\space%
    \ifx\empty#2\else\href{https://orcid.org/#2}{#2} \fi
  }{}{}%
}



\reversemarginpar

%
% custom title page
%
\renewcommand{\Authfont}{\bfseries\large\raggedright}
\renewcommand{\Affilfont}{\mdseries\large\raggedright}
\renewcommand{\Authands}{, }
\setlength{\affilsep}{16pt}
\renewcommand{\AB@affilsepx}{; \protect\Affilfont}

\newcommand{\themetadata}{%
    \textbf{*For correspondence:\\}  \@correspondence\par
    \ifx\empty\@contribution\else
    \bigskip\@contribution\par\fi
    \ifx\empty\@presentaddress\else
    \textbf{Present address: }\@presentaddress\par\fi
    \ifx\empty\@deceased\else\@deceased\par\fi
}

\patchcmd{\@author}{\AB@authlist\\[\affilsep]\AB@affillist}{\AB@authlist\\[\affilsep]
  %% Removed for LiveComs; will be placed after abstract in frontmatter
  % \marginpar{\raggedright\footnotesize\themetadata\par}
  \AB@affillist}{}{}

%% Added for LiveComs
\RequirePackage{environ}
\RequirePackage{textpos}

%% Abstract outside frontmatter will throw an error!
\RenewEnviron{abstract}{%
  \ClassError{livecoms}
  {Nope nope nope, please put the abstract inside the frontmatter environment.}
  {Please put the abstract inside the frontmatter environment.}
}

\NewEnviron{frontmatter}{%
  %% Define abstract's behavior when placed in frontmatter
  \renewenvironment{abstract}{%
     \setlength{\parindent}{0pt} %\raggedright
     \raisebox{-16pt-\baselineskip}[0pt][0pt]{\makebox[0pt][r]{\parbox[t]{3cm}{%
       \raggedright\itshape\footnotesize\@blurb\par\medskip%
       This version dated \@date%
     }\hspace*{1cm}}}%
     \textcolor{LiveCoMSMediumGrey}{\rule{\textwidth}{2pt}}
     \vskip16pt
     \textcolor{LiveCoMSLightBlue}{\large\bfseries\abstractname\space}
  }{%
     \vskip8pt
     \textcolor{LiveCoMSMediumGrey}{\rule{\textwidth}{2pt}}
     \vskip16pt
  }
  \twocolumn[%
    \protecting{%\begin{minipage}[b]{3cm}
    % \small\itshape
    % \raggedright\@blurb
    % \end{minipage}
    \hfill
    \begin{minipage}[b]{\textwidth-4cm}
    \BODY
    \themetadata%
    \end{minipage}}\vspace*{2\baselineskip}
  ]%
}

\renewcommand{\maketitle}{%
  \vskip36pt%
  {\color{LiveCoMSDarkBlue}\raggedright\bfseries\fontsize{22}{27}\selectfont \@title\par}%
  \vskip16pt
  {\@author\par}
  \vskip8pt
}

\newcommand{\makeorcid}{%
  % \textbf{*For correspondence:\\}  \@correspondence\par
  % \textbf{ORCID:\\}  \@correspondence\par
  \textbf{ORCID:\\}  \@orcidblock\par
}

%% Insert a grey line to separate floats from main text
\newcommand{\topfigrule}{\vskip8pt\noindent{\rule{\linewidth}{1pt}}}
\newcommand{\botfigrule}{\noindent{\rule{\linewidth}{1pt}}\vskip8pt}

\RequirePackage{newfloat}
\RequirePackage{wrapfig}
\AtEndEnvironment{wrapfigure}{\vskip8pt\noindent{\rule{\hsize}{1pt}}}
% \RequirePackage[lflt]{floatflt}
% \AtEndEnvironment{floatingfigure}{\vskip8pt\noindent\textcolor{LiveCoMSMediumGrey}{\rule{\hsize}{2pt}}}

\DeclareFloatingEnvironment[placement=hbt,name=Box]{featurebox}
\captionsetup[featurebox]{font={Large,bf,color=LiveCoMSDarkBlue}}

\newcounter{featurefigure}
\newcounter{featuretable}
\AtBeginEnvironment{featurebox}{%
  \setcounter{featurefigure}{0}%
  \setcounter{featuretable}{0}%
  \newcommand{\featurefig}[1]{%
    \refstepcounter{featurefigure}%
    \vskip\smallskipamount%
    {\small\textbf{\color{LiveCoMSDarkBlue}Box \arabic{featurebox} Figure \arabic{featurefigure}.}\space #1\par}\medskip}
  \newcommand{\featuretable}[1]{%
    \refstepcounter{featuretable}%
    \vskip\smallskipamount%
    {\small\textbf{\color{LiveCoMSDarkBlue}Box \arabic{featurebox} Table \arabic{featuretable}.}\space #1\par}\medskip}

}
\apptocmd{\featurebox}{%
  \begin{mdframed}[linewidth=0pt,backgroundcolor=LiveCoMSLightBlue!10,fontcolor=LiveCoMSDarkBlue]
  \if@reqslineno\addtolength{\linenumbersep}{1em}\internallinenumbers\fi%
}{}{}
\pretocmd{\endfeaturebox}{\end{mdframed}}{}{}

%% Starred version for LiveComs two-column
\AtBeginEnvironment{featurebox*}{%
  \setcounter{featurefigure}{0}%
  \setcounter{featuretable}{0}%
  \newcommand{\featurefig}[1]{%
    \refstepcounter{featurefigure}%
    \vskip\smallskipamount%
    {\small\textbf{\color{LiveCoMSDarkBlue}Box \arabic{featurebox} Figure \arabic{featurefigure}.}\space #1\par}\medskip}
  \newcommand{\featuretable}[1]{%
    \refstepcounter{featuretable}%
    \vskip\smallskipamount%
    {\small\textbf{\color{LiveCoMSDarkBlue}Box \arabic{featurebox} Table \arabic{featuretable}.}\space #1\par}\medskip}
}
\expandafter\apptocmd\csname featurebox*\endcsname{%
  \begin{mdframed}[linewidth=0pt,backgroundcolor=LiveCoMSLightBlue!10,fontcolor=LiveCoMSDarkBlue]
  \if@reqslineno\addtolength{\linenumbersep}{1em}\internallinenumbers\fi%
}{}{}
\expandafter\pretocmd\csname endfeaturebox*\endcsname{\end{mdframed}}{}{}

%% Unnecessary for LiveComs
% \newenvironment{fullwidth}{%
%   \begin{adjustwidth}{-4.5cm}{}
% }{\end{adjustwidth}}

%% Provide support for pseudocode and algorithms
\RequirePackage{algorithm,algpseudocode}
\captionsetup[algorithm]{%
   labelfont={bf},font=small,labelsep=period,
   justification=raggedright,singlelinecheck=false}
\newcommand\fs@notopruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
  \def\@fs@pre{}% \hrule height.8pt depth0pt \kern2pt}%
  \def\@fs@post{} %\kern2pt\hrule\relax}%
  \def\@fs@mid{\medskip\kern2pt\hrule\kern2pt}%
  \let\@fs@iftopcapt\iftrue}
\floatstyle{notopruled}
\restylefloat{algorithm}
\newcommand{\algorithmautorefname}{Algorithm}
\newcommand{\ALG}[1]{\autoref{alg:#1}}

%% Update some appendix sectional styles
\appto{\appendix}{%
  \@addtoreset{figure}{section}
  \@addtoreset{table}{section}
  \@addtoreset{featurebox}{section}
  \@addtoreset{algorithm}{section}
  % \numberwithin{figure}{section}
  % \numberwithin{table}{section}
  % \numberwithin{featurebox}{section}
  \titleformat{\section}
    {\LARGE\bfseries\color{LiveCoMSDarkBlue}}
    {\appendixname\ \thesection}{1em}{#1}[]

  \captionsetup*[figure]{name={Appendix \thesection\ Figure },font={color=LiveCoMSDarkBlue,small},skip=\smallskipamount}%

  \captionsetup*[table]{name={Appendix \thesection\ Table },font={color=LiveCoMSDarkBlue,small}}%
}

\newcounter{figsupp}
\setcounter{figsupp}{0}
\newcounter{data}
\setcounter{data}{0}
\def\supplist{}

\RequirePackage{newfile}
\newoutputstream{suppinfo}
\openoutputfile{\jobname.suppinfo}{suppinfo}


\AtBeginEnvironment{figure}{%
  \setcounter{figsupp}{0}
  \setcounter{data}{0}
  %% Updated 2017/06/30 to allow optional argument
  \newcommand{\figsupp}[3][]{%
    \refstepcounter{figsupp}%
    {%
    \ifstrequal{#1}{none}{}{%
      \small\textbf{Figure~\thefigure--Figure supplement \arabic{figsupp}.} \ifstrempty{#1}{#2}{#1}}\par}
    \addtostream{suppinfo}{%
      \noindent\protect\begin{minipage}{\linewidth}
      \protect #3\noexpand\par
      \textbf{Figure \thefigure--Figure supplement \arabic{figsupp}.} #2\noexpand\par
      \vskip8pt
      \protect\end{minipage}
      \vskip16pt
    }
  }
  \newcommand{\figdata}[1]{%
    \refstepcounter{data}
    {\small\textbf{Figure~\thefigure--source data \arabic{data}.} #1}\par
  }
}

%% Added for LiveComs (two columns)
\AtBeginEnvironment{figure*}{%
  \setcounter{figsupp}{0}
  \setcounter{data}{0}
  %% Updated 2017/06/30 to allow optional argument
  \newcommand{\figsupp}[3][]{%
    \refstepcounter{figsupp}%
    {%
    \ifstrequal{#1}{none}{}{%
      \small\textbf{Figure~\thefigure--Figure supplement \arabic{figsupp}.} \ifstrempty{#1}{#2}{#1}}\par}
    \addtostream{suppinfo}{%
      \noindent\protect\begin{minipage}{\linewidth}
      \protect #3\noexpand\par
      \textbf{Figure \thefigure--Figure supplement \arabic{figsupp}.} #2\noexpand\par
      \vskip8pt
      \protect\end{minipage}
      \vskip16pt
    }
  }
  \newcommand{\figdata}[1]{%
    \refstepcounter{data}
    {\small\textbf{Figure~\thefigure--source data \arabic{data}.} #1}\par
  }
}

\AtBeginEnvironment{table}{%
  \setcounter{data}{0}
  \newcommand{\tabledata}[1]{%
    \refstepcounter{data}
    {\small\textbf{Table~\thetable--source data \arabic{data}.} #1}\par
  }
}

%% Added for LiveComs (twocolumns)
\AtBeginEnvironment{table*}{%
  \setcounter{data}{0}
  \newcommand{\tabledata}[1]{%
    \refstepcounter{data}
    {\small\textbf{Table~\thetable--source data \arabic{data}.} #1}\par
  }
}

%% Checklists as floats
\RequirePackage{fontawesome}
\DeclareFloatingEnvironment[placement=hbtp,name=Checklists]{Checklists}
\newcounter{checklist}
\AtBeginEnvironment{Checklists}{%
  \setcounter{checklist}{0}
  \mdfsetup{skipabove=0pt,skipbelow=0pt,
    frametitleaboveskip=12pt,innerbottommargin=12pt,
    hidealllines=true,
    frametitlefont=\Large\bfseries\color{LiveCoMSLightBlue}}
}{}{}

\AtBeginEnvironment{Checklists*}{%
  \setcounter{checklist}{0}
  \mdfsetup{skipabove=0pt,skipbelow=0pt,
    frametitleaboveskip=12pt,innerbottommargin=12pt,
    hidealllines=true,
    frametitlefont=\Large\bfseries\color{LiveCoMSLightBlue}}
}{}{}

  \newenvironment{checklist}[1]{%
    \stepcounter{checklist}
    \ifnumodd{\thechecklist}
      {\def\cl@bgcolor{gray!12}}
      {\def\cl@bgcolor{gray!25}}
    \begin{mdframed}[
      frametitle=\MakeUppercase{#1},
      backgroundcolor=\cl@bgcolor]
      \setlist[itemize]{label=$\Box$,leftmargin=*}
  }{\end{mdframed}}

\AtEndDocument{%
  \closeoutputstream{suppinfo}
%   \pagestyle{empty}
  \renewcommand{\footrule}{}
  \rfoot{}
  \input{\jobname.suppinfo}
}

%% Use more traditional Appendix section approach
% \newcounter{appendix}
% \setcounter{appendix}{0}
% \newenvironment{appendixbox}{%
%   \setcounter{figure}{0}
%   \setcounter{table}{0}
%   \refstepcounter{appendix}%
%   \clearpage%
%   \patchcmd{\ttlf@section}{LiveCoMSMediumGrey}{LiveCoMSDarkBlue}{}{}
%   \noindent{\bfseries\Large\color{LiveCoMSMediumGrey}Appendix \arabic{appendix}\par}
%   \nolinenumbers%
%   %% Remove box colours for LiveComs
%   \begin{mdframed}[hidealllines=true,
%   % backgroundcolor=LiveCoMSLightBlue!10,
%   fontcolor=LiveCoMSDarkBlue,
%   % leftline=true,linecolor=LiveCoMSLightBlue,linewidth=1em
%   ]
%   \if@reqslineno\addtolength{\linenumbersep}{2em}\internallinenumbers\fi
% }{%
%   \end{mdframed}
% }

\RequirePackage[colorlinks=true,allcolors=black,citecolor=LiveCoMSLightBlue,linkcolor=LiveCoMSMediumGrey,urlcolor=LiveCoMSLightBlue]{hyperref}
\urlstyle{sf}

% Other desired commands
\renewcommand{\equationautorefname}{Eq.}
\newcommand{\FIG}[1]{\autoref{fig:#1}}
\newcommand{\TABLE}[1]{\autoref{tab:#1}}
\newcommand{\EQ}[1]{\autoref{eq:#1}}
\newcommand{\BOX}[1]{\autoref{box:#1}}
\let\oldautoref\autoref
\renewcommand{\autoref}[1]{\emph{\textbf{\oldautoref{#1}}}}

\endinput
