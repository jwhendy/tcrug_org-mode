<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: sunrise-commander.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=sunrise-commander.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: sunrise-commander.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=sunrise-commander.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for sunrise-commander.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=sunrise-commander.el" /><meta content="width=device-width" name="viewport" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('â')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://emacswiki.org/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="default"><div class="header"><div class="menu"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a href="http://www.emacswiki.org/emacs/Search" class="local">Search</a> <a href="http://www.emacswiki.org/emacs/ElispArea" class="local">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a href="http://www.emacswiki.org/emacs/Glossary" class="local">Glossary</a> <a href="http://www.emacswiki.org/emacs/RecentChanges" class="local">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a href="http://www.emacswiki.org/emacs/Suggestions" class="local">Suggestions</a> </span><form method="get" action="http://www.emacswiki.org/emacs" enctype="multipart/form-data" class="search" accept-charset="utf-8"><p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form></div><h1><a title="Click to search for references to this page" href="http://www.emacswiki.org/emacs?search=%22sunrise-commander%5c.el%22" rel="nofollow">sunrise-commander.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/sunrise-commander.el">Download</a> <a href="https://github.com/emacsmirror/emacswiki.org/blob/master/sunrise-commander.el">Git</a></p><pre><span class="comment">;;; sunrise-commander.el --- two-pane file manager for Emacs based on Dired and inspired by MC  -*- lexical-binding: t -*-</span>

<span class="comment">;; Copyright (C) 2007-2015 José Alfredo Romero Latouche.</span>

<span class="comment">;; Author: José Alfredo Romero L. &lt;escherdragon@gmail.com&gt;</span>
<span class="comment">;;	Štěpán Němec &lt;stepnem@gmail.com&gt;</span>
<span class="comment">;; Maintainer: José Alfredo Romero L. &lt;escherdragon@gmail.com&gt;</span>
<span class="comment">;; Created: 24 Sep 2007</span>
<span class="comment">;; Version: 6</span>
<span class="comment">;; RCS Version: $Rev: 463 $</span>
<span class="comment">;; Keywords: files, dired, midnight commander, norton, orthodox</span>
<span class="comment">;; URL: http://www.emacswiki.org/emacs/sunrise-commander.el</span>
<span class="comment">;; Compatibility: GNU Emacs 22+</span>

<span class="comment">;; This file is not part of GNU Emacs.</span>

<span class="comment">;; This program is free software: you can redistribute it and/or modify it under</span>
<span class="comment">;; the terms of the GNU General Public License as published by the Free Software</span>
<span class="comment">;; Foundation, either version 3 of the License, or (at your option) any later</span>
<span class="comment">;; version.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is distributed in the hope that it will be useful, but WITHOUT</span>
<span class="comment">;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS</span>
<span class="comment">;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more de-</span>
<span class="comment">;; tails.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License along with</span>
<span class="comment">;; this program. If not, see &lt;http://www.gnu.org/licenses/&gt;.</span>

<span class="comment">;;; Commentary:</span>

<span class="comment">;; The Sunrise Commmander is a double-pane file manager for Emacs. It's built</span>
<span class="comment">;; atop of Dired and takes advantage of all its power, but also provides many</span>
<span class="comment">;; handy features of its own:</span>

<span class="comment">;; * Sunrise is implemented as a derived major mode confined inside the pane</span>
<span class="comment">;; buffers, so its buffers and Dired ones can live together without easymenu or</span>
<span class="comment">;; viper to avoid key binding collisions.</span>

<span class="comment">;; * It automatically closes unused buffers and tries to never keep open more</span>
<span class="comment">;; than the one or two used to display the panes, though this behavior may be</span>
<span class="comment">;; disabled if desired.</span>

<span class="comment">;; * Each pane has its own history stack: press M-y / M-u for moving backwards /</span>
<span class="comment">;; forwards in the history of directories.</span>

<span class="comment">;; * Press M-t to swap (transpose) the panes.</span>

<span class="comment">;; * Press C-= for <span class="string">"smart"</span> file comparison using `<span class="constant important">ediff</span>'. It compares together</span>
<span class="comment">;; the first two files marked on each pane or, if no files have been marked, it</span>
<span class="comment">;; assumes that the second pane contains a file with the same name as the</span>
<span class="comment">;; selected one and tries to compare these two. You can also mark whole lists of</span>
<span class="comment">;; files to be compared and then just press C-= for comparing the next pair.</span>

<span class="comment">;; * Press = for fast <span class="string">"smart"</span> file comparison -- like above, but using regular</span>
<span class="comment">;; diff.</span>

<span class="comment">;; * Press C-M-= for directory comparison (by date / size / contents of files).</span>

<span class="comment">;; * Press C-c C-s to change the layout of the panes (horizontal/vertical/top)</span>

<span class="comment">;; * Press C-c / to interactively refine the contents of the current pane using</span>
<span class="comment">;; fuzzy (a.k.a. flex) matching, then:</span>
<span class="comment">;;    - press Delete or Backspace to revert the buffer to its previous state</span>
<span class="comment">;;    - press Return, C-n or C-p to exit and accept the current narrowed state</span>
<span class="comment">;;    - press Esc or C-g to abort the operation and revert the buffer</span>
<span class="comment">;;    - use ! to prefix characters that should NOT appear after a given position</span>
<span class="comment">;; Once narrowed and accepted, you can restore the original contents of the pane</span>
<span class="comment">;; by pressing g (revert-buffer).</span>

<span class="comment">;; * Sticky search: press C-c s to launch an interactive search that will remain</span>
<span class="comment">;; active from directory to directory, until you hit a regular file or press C-g</span>

<span class="comment">;; * Press C-x C-q to put the current pane in Editable Dired mode (allows to</span>
<span class="comment">;; edit the pane as if it were a regular file -- press C-c C-c to commit your</span>
<span class="comment">;; changes to the filesystem, or C-c C-k to abort).</span>

<span class="comment">;; * Press y to recursively calculate the total size (in bytes) of all files and</span>
<span class="comment">;; directories currently selected/marked in the active pane.</span>

<span class="comment">;; * Sunrise VIRTUAL mode integrates dired-virtual mode to Sunrise, allowing to</span>
<span class="comment">;; capture grep, find and locate results in regular files and to use them later</span>
<span class="comment">;; as if they were directories with all the Dired and Sunrise operations at your</span>
<span class="comment">;; fingertips.</span>
<span class="comment">;;</span>
<span class="comment">;; * The results of the following operations are displayed in VIRTUAL mode:</span>
<span class="comment">;;    - find-name-dired (press C-c C-n),</span>
<span class="comment">;;    - find-dired      (press C-c C-f),</span>
<span class="comment">;;    - grep            (press C-c C-g),</span>
<span class="comment">;;    - locate          (press C-c C-l),</span>
<span class="comment">;;    - list all recently visited files (press C-c C-r -- requires recentf),</span>
<span class="comment">;;    - list all directories in active pane's history ring (press C-c C-d).</span>

<span class="comment">;; * Supports AVFS (http://avf.sourceforge.net/) for transparent navigation</span>
<span class="comment">;; inside compressed archives (*.zip, *.tgz, *.tar.bz2, *.deb, etc. etc.)</span>
<span class="comment">;; You need to have AVFS with coda or fuse installed and running on your system</span>
<span class="comment">;; for this to work, though.</span>

<span class="comment">;; * Opening terminals directly from Sunrise:</span>
<span class="comment">;;    - Press C-c C-t to inconditionally open a new terminal into the currently</span>
<span class="comment">;;      selected directory in the active pane.</span>
<span class="comment">;;    - Use C-c t to switch to the last opened terminal, or (<span class="keyword cl">when</span> already inside</span>
<span class="comment">;;      a terminal) to cycle through all open terminals.</span>
<span class="comment">;;    - Press C-c T to switch to the last opened terminal and change directory</span>
<span class="comment">;;      to the one in the current directory.</span>
<span class="comment">;;    - Press C-c M-t to be prompted for a program name, and then open a new</span>
<span class="comment">;;      terminal using that program into the currently selected directory</span>
<span class="comment">;;      (eshell is a valid value; if no program can be found with the given name</span>
<span class="comment">;;      then the value of `<span class="constant important">sr-terminal-program</span>' is used instead).</span>

<span class="comment">;; * Terminal integration and Command line expansion: integrates tightly with</span>
<span class="comment">;; `<span class="constant important">eshell</span>' and `<span class="constant important">term-mode</span>' to allow interaction between terminal emulators in</span>
<span class="comment">;; line mode (C-c C-j) and the panes: the most important navigation commands</span>
<span class="comment">;; (up, down, mark, unmark, go to parent dir) can be executed on the active pane</span>
<span class="comment">;; directly from the terminal by pressing the usual keys with Meta: &lt;M-up&gt;,</span>
<span class="comment">;; &lt;M-down&gt;, etc. Additionally, the following substitutions are automagically</span>
<span class="comment">;; performed in `<span class="constant important">eshell</span>' and `<span class="constant important">term-line-mode</span>':</span>
<span class="comment">;;     %f - expands to the currently selected file in the left pane</span>
<span class="comment">;;     %F - expands to the currently selected file in the right pane</span>
<span class="comment">;;     %m - expands to the list of paths of all marked files in the left pane</span>
<span class="comment">;;     %M - expands to the list of paths of all marked files in the right pane</span>
<span class="comment">;;     %n - expands to the list of names of all marked files in the left pane</span>
<span class="comment">;;     %N - expands to the list of names of all marked files in the right pane</span>
<span class="comment">;;     %d - expands to the current directory in the left pane</span>
<span class="comment">;;     %D - expands to the current directory in the right pane</span>
<span class="comment">;;     %a - expands to the list of paths of all marked files in the active pane</span>
<span class="comment">;;     %A - expands to the current directory in the active pane</span>
<span class="comment">;;     %p - expands to the list of paths of all marked files in the passive pane</span>
<span class="comment">;;     %P - expands to the current directory in the passive pane</span>

<span class="comment">;; * Cloning of complete directory trees: press K to clone the selected files</span>
<span class="comment">;; and directories into the passive pane. Cloning is a more general operation</span>
<span class="comment">;; than copying, in which all directories are recursively created with the same</span>
<span class="comment">;; names and structures at the destination, while what happens to the files</span>
<span class="comment">;; within them depends on the option you choose:</span>
<span class="comment">;;    - <span class="string">"(F)ile System of..."</span> clones the FS structure of paths in a VIRTUAL pane,</span>
<span class="comment">;;    - <span class="string">"(D)irectories only"</span> ignores all files, copies only directories,</span>
<span class="comment">;;    - <span class="string">"(C)opies"</span> performs a regular recursive copy of all files and dirs,</span>
<span class="comment">;;    - <span class="string">"(H)ardlinks"</span> makes every new file a (hard) link to the original one</span>
<span class="comment">;;    - <span class="string">"(S)ymlinks"</span> creates absolute symbolic links for all files in the tree,</span>
<span class="comment">;;    - <span class="string">"(R)elative symlinks” creates relative symbolic links.</span>

<span class="comment">;; * Passive navigation: the usual navigation keys (n, p, Return, U, ;) combined</span>
<span class="comment">;; with Meta allow to move across the passive pane without actually having to</span>
<span class="comment">;; switch to it.</span>

<span class="comment">;; * Synchronized navigation: press C-c C-z to enable / disable synchronized</span>
<span class="comment">;; navigation. In this mode, the passive navigation keys (M-n, M-p, M-Return,</span>
<span class="comment">;; etc.) operate on both panes simultaneously. I've found this quite useful for</span>
<span class="comment">;; comparing hierarchically small to medium-sized directory trees (for large to</span>
<span class="comment">;; very large directory trees one needs something on the lines of diff -r</span>
<span class="comment">;; though).</span>

<span class="comment">;; * And much more -- press ? while in Sunrise mode for basic help, or h for a</span>
<span class="comment">;; complete list of all keybindings available (use C-e and C-y to scroll).</span>

<span class="comment">;; There is no help window like in MC, but if you really miss it, just get and</span>
<span class="comment">;; install the sunrise-x-buttons extension.</span>

<span class="comment">;; A lot of this code was once adapted from Kevin Burton's mc.el, but it has</span>
<span class="comment">;; evolved considerably since then. Another part (<span class="keyword cl">the</span> code for file copying and</span>
<span class="comment">;; renaming) derives originally from the Dired extensions written by Kurt</span>
<span class="comment">;; Nørmark for LAML (http://www.cs.aau.dk/~normark/scheme/distribution/laml/).</span>

<span class="comment">;; It's written on GNU Emacs 25 on Linux and tested on GNU Emacs 22, 23, 24 and</span>
<span class="comment">;; 25 for Linux and on EmacsW32 (version 23) for Windows. I have also received</span>
<span class="comment">;; feedback from users reporting it works OK on the Mac. It does not work either</span>
<span class="comment">;; on GNU Emacs 21 or XEmacs -- please drop me a line if you would like to help</span>
<span class="comment">;; porting it. All contributions and/or bug reports will be very welcome.</span>

<span class="comment">;; For more details on the file manager, several available extensions and many</span>
<span class="comment">;; cool tips &amp; tricks visit http://www.emacswiki.org/emacs/Sunrise_Commander</span>

<span class="comment">;;; Installation and Usage:</span>

<span class="comment">;; 1) Put this file somewhere in your Emacs `<span class="constant important">load-path</span>'.</span>

<span class="comment">;; 2) Add a (<span class="keyword">require</span> '<span class="constant">sunrise-commander</span>) to your .emacs file.</span>

<span class="comment">;; 3) Choose some unused extension for files to be opened in Sunrise VIRTUAL</span>
<span class="comment">;; mode and add it to `<span class="constant important">auto-mode-alist</span>', e.g. if you want to name your virtual</span>
<span class="comment">;; directories like *.svrm just add to your .emacs file a line like the</span>
<span class="comment">;; following:</span>
<span class="comment">;;</span>
<span class="comment">;;     (add-to-list 'auto-mode-alist '("</span>\\.srvm\\'<span class="string">" . sr-virtual-mode))</span>

<span class="comment">;; 4) Evaluate the new lines, or reload your .emacs file, or restart Emacs.</span>

<span class="comment">;; 5) Type M-x sunrise to invoke the Sunrise Commander (or much better: bind the</span>
<span class="comment">;; function to your favorite key combination). The command `<span class="constant important">sunrise-cd</span>' invokes</span>
<span class="comment">;; Sunrise and automatically selects the current file wherever it is in the</span>
<span class="comment">;; filesystem. Type h at any moment for information on available key bindings.</span>

<span class="comment">;; 6) Type M-x customize-group &lt;RET&gt; sunrise &lt;RET&gt; to customize options, fonts</span>
<span class="comment">;; and colors (activate AVFS support here, too).</span>

<span class="comment">;; 7) Enjoy :)</span>

<span class="comment">;;; Code:</span>

(<span class="keyword">require</span> '<span class="constant">advice</span>)
(<span class="keyword">require</span> '<span class="constant">desktop</span>)
(<span class="keyword">require</span> '<span class="constant">dired</span>)
(<span class="keyword">require</span> '<span class="constant">dired-aux</span>)
(<span class="keyword">require</span> '<span class="constant">dired-x</span>)
(<span class="keyword">require</span> '<span class="constant">enriched</span>)
(<span class="keyword">require</span> '<span class="constant">esh-mode</span>)
(<span class="keyword">require</span> '<span class="constant">find-dired</span>)
(<span class="keyword">require</span> '<span class="constant">font-lock</span>)
(<span class="keyword">require</span> '<span class="constant">hl-line</span>)
(<span class="keyword">require</span> '<span class="constant">sort</span>)
(<span class="keyword">require</span> '<span class="constant">term</span>)
(<span class="keyword">require</span> '<span class="constant">tramp</span>)
(<span class="keyword elisp">eval-when-compile</span> (<span class="keyword">require</span> '<span class="constant">cl</span>)
                   (<span class="keyword">require</span> '<span class="constant">recentf</span>))

(<span class="keyword elisp">eval-and-compile</span>
  (<span class="keyword cl">unless</span> (fboundp 'cl-labels)
    (<span class="keyword">defalias</span> '<span class="function">cl-labels</span> 'labels))
  (<span class="keyword cl">unless</span> (fboundp 'cl-letf)
    (<span class="keyword">defalias</span> '<span class="function">cl-letf</span> 'letf)))

(<span class="keyword">defgroup</span> <span class="type">sunrise</span> nil
  "</span>The Sunrise Commander File Manager.<span class="string">"
  <span class="builtin">:group</span> 'files)

(<span class="keyword">defcustom</span> <span class="variable">sr-show-file-attributes</span> t
  "</span>Whether to initially display file attributes in Sunrise panes.
You can always toggle file attributes display pressing
\\&lt;sr-mode-map&gt;\\[<span class="constant important">sr-toggle-attributes</span>].<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-autoload-extensions</span> t
  "</span>Whether to load extensions immediately after their declaration, or when the
SC core is loaded (e.g. when using autoload cookies).<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-show-hidden-files</span> nil
  "</span>Whether to initially display hidden files in Sunrise panes.
You can always toggle hidden files display pressing
\\&lt;sr-mode-map&gt;\\[<span class="constant important">dired-omit-mode</span>].
You can also customize what files are considered hidden by setting
`<span class="constant important">dired-omit-files</span>' and `<span class="constant important">dired-omit-extensions</span>' in your .emacs file.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-terminal-kill-buffer-on-exit</span> t
  "</span>Whether to kill terminal buffers after their shell process ends.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-terminal-program</span> "</span>eshell<span class="string">"
  "</span>The program to use for terminal emulation.
If this value is set to \"eshell\", the Emacs shell (`<span class="constant important">eshell</span>')
will be used.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">sr-listing-switches</span> "</span>-al<span class="string">"
  "</span>Listing switches passed to `<span class="constant important">ls</span>' when building Sunrise buffers.
\(Cf. `<span class="constant important">dired-listing-switches</span>'.)
  Most portable value: -al
  Recommended value on GNU systems: \
--time-style=locale --group-directories-first -alDhgG<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">sr-virtual-listing-switches</span> "</span>-ald<span class="string">"
  "</span>Listing switches for building buffers in `<span class="constant important">sr-virtual-mode</span>'.
Should not contain the -D option. See also `<span class="constant important">sr-listing-switches</span>'.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">sr-cursor-follows-mouse</span> t
  "</span>Determines whether the cursor inside the Sunrise panes should
follow the mouse in graphical environments.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean
  <span class="builtin">:set</span> (<span class="keyword">defun</span> <span class="function">sr-set-cursor-follows-mouse</span> (symbol value)
         "</span>Setter function for the `<span class="constant important">sr-set-cursor-follows-mouse</span>' custom option.<span class="string">"
         (mapc (<span class="keyword elisp">lambda</span> (buf)
                 (<span class="keyword elisp">with-current-buffer</span> buf
                   (<span class="keyword cl">when</span> (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode))
                     (setq track-mouse value))))
               (buffer-list))
         (set-default symbol value)))

(<span class="keyword">defcustom</span> <span class="variable">sr-mouse-events-threshold</span> 10
  "</span>Number of mouse movement events to ignore before following it
with the cursor. This helps to avoid capturing accidentally the
cursor when Sunrise is activated.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'integer)

(<span class="keyword">defcustom</span> <span class="variable">sr-avfs-root</span> nil
  "</span>Root of the AVFS virtual filesystem used for navigating compressed archives.
Setting this value activates AVFS support.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> '(choice
          (const <span class="builtin">:tag</span> "</span>AVFS support disabled<span class="string">" nil)
          (const <span class="builtin">:tag</span> "</span>~/.avfs (default mountavfs mount point)<span class="string">" "</span>~/.avfs<span class="string">")
          (directory <span class="builtin">:tag</span> "</span>Other AVFS root directory<span class="string">")))

(<span class="keyword">defcustom</span> <span class="variable">sr-avfs-handlers-alist</span> '(("</span>\\.[jwesh]ar$<span class="string">" . "</span>#uzip/<span class="string">")
                                    ("</span>\\.wsar$<span class="string">"      . "</span>#uzip/<span class="string">")
                                    ("</span>\\.xpi$<span class="string">"       . "</span>#uzip/<span class="string">")
                                    ("</span>\\.apk$<span class="string">"       . "</span>#uzip/<span class="string">")
                                    ("</span>\\.iso$<span class="string">"       . "</span>#iso9660/<span class="string">")
                                    ("</span>\\.patch$<span class="string">"     . "</span>#/<span class="string">")
                                    ("</span>\\.txz$<span class="string">"       . "</span>#/<span class="string">")
                                    ("</span>.<span class="string">"             . "</span>#/<span class="string">"))
  "</span>List of AVFS handlers to manage specific file extensions.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'alist)

(<span class="keyword">defcustom</span> <span class="variable">sr-md</span>5-shell-command "</span>md5sum %f | cut -d' ' -f1 2&gt;/dev/null<span class="string">"
  "</span>Shell command to use for calculating MD5 sums for files.
Used when comparing directories using the ``(c)ontents'' option.
Use %f as a placeholder for the name of the file.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">sr-window-split-style</span> 'horizontal
  "</span>The current window split configuration.
May be `<span class="constant important">horizontal</span>', `<span class="constant important">vertical</span>' or `<span class="constant important">top</span>'.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> '(choice
          (const horizontal)
          (const vertical)
          (const top)))

(<span class="keyword">defcustom</span> <span class="variable">sr-windows-locked</span> t
  "</span>When non-nil, vertical size of the panes will remain constant.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-windows-default-ratio</span> 66
  "</span>Percentage of the total height of the frame to use by default for the Sunrise
Commander panes.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'integer
  <span class="builtin">:set</span> (<span class="keyword">defun</span> <span class="function">sr-set-windows-default-ratio</span> (symbol value)
         "</span>Setter function for the `<span class="constant important">sr-windows-default-ratio</span>' custom option.<span class="string">"
         (<span class="keyword elisp">if</span> (and (integerp value) (&gt;= value 0) (&lt;= value 100))
             (set-default symbol value)
           (<span class="warning">error</span> "</span>Invalid value: %s<span class="string">" value))))

(<span class="keyword">defcustom</span> <span class="variable">sr-history-length</span> 20
  "</span>Number of entries to keep in each pane's history rings.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'integer)

(<span class="keyword">defcustom</span> <span class="variable">sr-kill-unused-buffers</span> t
  "</span>Whether buffers should be killed automatically by Sunrise when not displayed
in any of the panes.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-kill-quick-view-buffers</span> t
  "</span>Whether opening a new buffer in quick-view mode should kill any other buffer
opened previously in the same manner.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-confirm-kill-viewer</span> t
  "</span>Whether to ask for confirmation before killing a buffer opened in quick-view
mode.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-attributes-display-mask</span> nil
  "</span>Contols hiding/transforming columns with `<span class="constant important">sr-toggle-attributes</span>'.
If set, its value must be a list of symbols, one for each
attributes column. If the symbol is nil, then the corresponding
column will be hidden, and if it's not nil then the column will
be left untouched. The symbol may also be the name of a function
that takes one string argument and evaluates to a different
string -- in this case this function will be used to transform
the contents of the corresponding column and its result will be
displayed instead.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> '(repeat symbol))

(<span class="keyword">defcustom</span> <span class="variable">sr-fast-backup-extension</span> "</span>.bak<span class="string">"
  "</span>Determines the extension to append to the names of new files
created with the `<span class="constant important">sr-fast-backup-files</span>' function (@!). This can
be either a simple string or an s-expression to be evaluated at
run-time.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> '(choice
          (string <span class="builtin">:tag</span> "</span>Literal text<span class="string">")
          (sexp <span class="builtin">:tag</span> "</span>Symbolic expression<span class="string">")))

(<span class="keyword">defcustom</span> <span class="variable">sr-traditional-other-window</span> nil
  "</span>Sunrise modifies the behavior of the `<span class="constant important">other-window</span>' command,
so that focus is always given to the currently selected pane when
switching from external windows. If you'd prefer the original
Emacs behavior instead, then set this flag to t.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-fuzzy-negation-character</span> ?!
  "</span>Character to use for negating patterns when fuzzy-narrowing a pane.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> '(choice
          (const <span class="builtin">:tag</span> "</span>Fuzzy matching negation disabled<span class="string">" nil)
          (character <span class="builtin">:tag</span> "</span>Fuzzy matching negation character<span class="string">" ?!)))

(<span class="keyword">defcustom</span> <span class="variable">sr-init-hook</span> nil
  "</span>List of functions to be called before the Sunrise panes are displayed.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'hook
  <span class="builtin">:options</span> '(auto-insert))

(<span class="keyword">defcustom</span> <span class="variable">sr-start-hook</span> nil
  "</span>List of functions to be called after the Sunrise panes are displayed.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'hook
  <span class="builtin">:options</span> '(auto-insert))

(<span class="keyword">defcustom</span> <span class="variable">sr-refresh-hook</span> nil
  "</span>List of functions to be called every time a pane is refreshed.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'hook
  <span class="builtin">:options</span> '(auto-insert))

(<span class="keyword">defcustom</span> <span class="variable">sr-quit-hook</span> nil
  "</span>List of functions to be called after the Sunrise panes are hidden.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'hook
  <span class="builtin">:options</span> '(auto-insert))

(<span class="keyword">defcustom</span> <span class="variable">sr-recursive-grep-supported</span> t
  "</span>Whether the command specified by `<span class="constant important">sr-grep-command</span>' supports
the 'recursive' (-r) option.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">sr-grep-command</span> "</span>grep<span class="string">"
  "</span>Full path to the grep command for Sunrise to use in grep
  operations. In contrast to `<span class="constant important">grep-command</span>' this one does *not*
  support any options.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defvar</span> <span class="variable">sr-restore-buffer</span> nil
  "</span>Buffer to restore when Sunrise quits.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-prior-window-configuration</span> nil
  "</span>Window configuration before Sunrise was started.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-running</span> nil
  "</span>True when Sunrise commander mode is running.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-synchronized</span> nil
  "</span>True when synchronized navigation is on<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-current-window-overlay</span> nil
  "</span>Holds the current overlay which marks the current Dired buffer.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-clex-hotchar-overlay</span> nil
  "</span>Overlay used to highlight the hot character (%) during CLEX operations.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-left-directory</span> "</span>~/<span class="string">"
  "</span>Dired directory for the left window. See variable `<span class="constant important">dired-directory</span>'.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-left-buffer</span> nil
  "</span>Dired buffer for the left window.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-left-window</span> nil
  "</span>The left window of Dired.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-right-directory</span> "</span>~/<span class="string">"
  "</span>Dired directory for the right window. See variable `<span class="constant important">dired-directory</span>'.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-right-buffer</span> nil
  "</span>Dired buffer for the right window.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-right-window</span> nil
  "</span>The right window of Dired.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-current-frame</span> nil
  "</span>The frame Sunrise is active on (<span class="keyword elisp">if</span> any).<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-this-directory</span> "</span>~/<span class="string">"
  "</span>Dired directory in the active pane.
This isn't necessarily the same as `<span class="constant important">dired-directory</span>'.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-other-directory</span> "</span>~/<span class="string">"
  "</span>Dired directory in the passive pane.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-selected-window</span> 'left
  "</span>The window to select when Sunrise starts up.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-selected-window-width</span> nil
  "</span>The width the selected window should have on startup.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-history-registry</span> '((left) (right))
  "</span>Registry of visited directories for both panes.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-history-stack</span> '((left 0 . 0) (right 0 . 0))
  "</span>History stack counters.
The first counter on each side tracks (by value) the absolute
depth of the stack and (by sign) the direction it is currently
being traversed. The second counter points at the position of the
element that is immediately beneath the top of the stack.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-ti-openterms</span> nil
  "</span>Stack of currently open terminal buffers.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-ediff-on</span> nil
  "</span>Flag that indicates whether an `<span class="constant important">ediff</span>' is being currently done.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-clex-on</span> nil
  "</span>Flag that indicates that a CLEX operation is taking place.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-virtual-buffer</span> nil
  "</span>Local flag that indicates the current buffer was originally in
  VIRTUAL mode.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-dired-directory</span> "</span><span class="string">"
  "</span>Directory inside which `<span class="constant important">sr-mode</span>' is currently active.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-start-message</span>
  "</span>Been coding all night? Enjoy the Sunrise! (or press q to quit)<span class="string">"
  "</span>Message to display when Sunrise is started.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-panes-height</span> nil
  "</span>Current height of the pane windows.
Initial value is 2/3 the viewport height.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-current-path-faces</span> nil
  "</span>List of faces to display the path in the current pane (first wins)<span class="string">")
(make-variable-buffer-local 'sr-current-path-faces)

(<span class="keyword">defvar</span> <span class="variable">sr-inhibit-highlight</span> nil
  "</span>Special variable used to temporarily inhibit highlighting in panes.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-inhibit-switch</span> nil
  "</span>Special variable used to inhibit switching from one pane to the other.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-find-items</span> nil
  "</span>Special variable used by `<span class="constant important">sr-find</span>' to control the scope of find operations.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-desktop-save-handlers</span> nil
  "</span>List of extension-defined handlers to save Sunrise buffers with desktop.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-desktop-restore-handlers</span> nil
  "</span>List of extension-defined handlers to restore Sunrise buffers from desktop.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-backup-buffer</span> nil
  "</span>Variable holding a buffer-local value of the backup buffer.<span class="string">")
(make-variable-buffer-local 'sr-backup-buffer)

(<span class="keyword">defvar</span> <span class="variable">sr-goto-dir-function</span> nil
  "</span>Function to use to navigate to a given directory, or nil to do
the default.  The function receives one argument DIR, which is
the directory to go to.<span class="string">")

(<span class="keyword">defvar</span> <span class="variable">sr-mouse-events-count</span> 0
  "</span>Number of mouse movement events received before activating the
  `<span class="constant important">sr-cursor-follows-mouse</span>' feature.<span class="string">")

(<span class="keyword">defconst</span> <span class="variable">sr-side-lookup</span> (list '(left . right) '(right . left))
  "</span>Trivial alist used by the Sunrise Commander to lookup its own passive side.<span class="string">")

(<span class="keyword">defface</span> <span class="variable">sr-active-path-face</span>
  '((((type tty) (class color) (min-colors 8))
     <span class="builtin">:background</span> "</span>green<span class="string">" <span class="builtin">:foreground</span> "</span>yellow<span class="string">" <span class="builtin">:bold</span> t)
    (((type tty) (class mono)) <span class="builtin">:inverse-video</span> t)
    (t <span class="builtin">:background</span> "</span>#ace6ac<span class="string">" <span class="builtin">:foreground</span> "</span>yellow<span class="string">" <span class="builtin">:bold</span> t <span class="builtin">:height</span> 120))
  "</span>Face of the directory path in the active pane.<span class="string">"
  <span class="builtin">:group</span> 'sunrise)

(<span class="keyword">defface</span> <span class="variable">sr-passive-path-face</span>
  '((((type tty) (class color) (min-colors 8) (background dark))
     <span class="builtin">:background</span> "</span>black<span class="string">" <span class="builtin">:foreground</span> "</span>cyan<span class="string">")
    (((type tty) (class color) (min-colors 8) (background light))
     <span class="builtin">:background</span> "</span>white<span class="string">" <span class="builtin">:foreground</span> "</span>cyan<span class="string">")
    (t <span class="builtin">:background</span> "</span>white<span class="string">" <span class="builtin">:foreground</span> "</span>lightgray<span class="string">" <span class="builtin">:bold</span> t <span class="builtin">:height</span> 120))
  "</span>Face of the directory path in the passive pane.<span class="string">"
  <span class="builtin">:group</span> 'sunrise)

(<span class="keyword">defface</span> <span class="variable">sr-editing-path-face</span>
  '((t <span class="builtin">:background</span> "</span>red<span class="string">" <span class="builtin">:foreground</span> "</span>yellow<span class="string">" <span class="builtin">:bold</span> t <span class="builtin">:height</span> 120))
  "</span>Face of the directory path in the active pane while in editable pane mode.<span class="string">"
  <span class="builtin">:group</span> 'sunrise)

(<span class="keyword">defface</span> <span class="variable">sr-highlight-path-face</span>
  '((t <span class="builtin">:background</span> "</span>yellow<span class="string">" <span class="builtin">:foreground</span> "</span>#ace6ac<span class="string">" <span class="builtin">:bold</span> t <span class="builtin">:height</span> 120))
  "</span>Face of the directory path on mouse hover.<span class="string">"
  <span class="builtin">:group</span> 'sunrise)

(<span class="keyword">defface</span> <span class="variable">sr-clex-hotchar-face</span>
  '((t <span class="builtin">:foreground</span> "</span>red<span class="string">" <span class="builtin">:bold</span> t))
  "</span>Face of the hot character (%) in CLEX mode.
Indicates that a CLEX substitution may be about to happen.<span class="string">"
  <span class="builtin">:group</span> 'sunrise)

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; This is the core of Sunrise: the main idea is to apply `<span class="constant important">sr-mode</span>' only inside</span>
<span class="comment">;;; Sunrise buffers while keeping all of `<span class="constant important">dired-mode</span>' untouched.</span>

<span class="comment">;;; preserve this variable when switching from `<span class="constant important">dired-mode</span>' to another mode</span>
(put 'dired-subdir-alist 'permanent-local t)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">define-derived-mode</span> <span class="function">sr-mode</span> dired-mode "</span>Sunrise Commander<span class="string">"
  "</span>Two-pane file manager for Emacs based on Dired and inspired by MC.
The following keybindings are available:

        /, j .......... go to directory
        p, n .......... move cursor up/down
        M-p, M-n ...... move cursor up/down in passive pane
        ^, J .......... go to parent directory
        M-^, M-J ...... go to parent directory in passive pane
        Tab ........... switch to other pane
        C-Tab.......... switch to viewer window
        C-c Tab ....... switch to viewer window (console compatible)
        RET, f ........ visit selected file/directory
        M-RET, M-f .... visit selected file/directory in passive pane
        C-c RET ....... visit selected in passive pane (console compatible)
        b ............. visit selected file/directory in default browser
        F ............. visit all marked files, each in its own window
        C-u F ......... visit all marked files in the background
        o,v ........... quick visit selected file (scroll with C-M-v, C-M-S-v)
        C-u o, C-u v .. kill quick-visited buffer (restores normal scrolling)
        X ............. execute selected file
        C-u X.......... execute selected file with arguments

        + ............. create new directory
        M-+ ........... create new empty file(s)
        C ............. copy marked (or current) files and directories
        R ............. rename marked (or current) files and directories
        D ............. delete marked (or current) files and directories
        S ............. soft-link selected file/directory to passive pane
        Y ............. do relative soft-link of selected file in passive pane
        H ............. hard-link selected file to passive pane
        K ............. clone selected files and directories into passive pane
        N ............. in place copy/rename/link marked (or current) entries
        M-C ........... copy (using traditional dired-do-copy)
        M-R ........... rename (using traditional dired-do-rename)
        M-D ........... delete (using traditional dired-do-delete)
        M-S............ soft-link (using traditional dired-do-symlink)
        M-Y............ do relative soft-link (traditional dired-do-relsymlink)
        M-H............ hard-link selected file/directory (dired-do-hardlink)
        A ............. search marked files for regular expression
        Q ............. perform query-replace-regexp on marked files
        C-q ........... search occurrences of a string in marked files
        C-c s ......... start a \"sticky\" interactive search in the current pane

        M-a ........... move to beginning of current directory
        M-e ........... move to end of current directory
        M-y ........... go to previous directory in history
        M-u ........... go to next directory in history
        C-M-y ......... go to previous directory in history on passive pane
        C-M-u ......... go to next directory in history on passive pane

        g, C-c C-c .... refresh pane
        s ............. sort entries (by name, number, size, time or extension)
        r ............. reverse the order of entries in the active pane (sticky)
        C-o ........... show/hide hidden files (requires dired-omit-mode)
        C-Backspace ... hide/show file attributes in pane
        C-c Backspace . hide/show file attributes in pane (console compatible)
        y ............. show file type / size of selected files and directories.
        M-l ........... truncate/continue long lines in pane
        C-c v ......... put current panel in VIRTUAL mode
        C-c C-v ....... create new pure VIRTUAL buffer
        C-c C-w ....... browse directory tree using w3m

        M-t ........... transpose panes
        M-o ........... synchronize panes
        C-c C-s ....... change panes layout (vertical/horizontal/top-only)
        [ ............. enlarges the right pane by 5 columns
        ] ............. enlarges the left pane by 5 columns
        } ............. enlarges the panes vertically by 1 row
        C-} ........... enlarges the panes vertically as much as it can
        C-c } ......... enlarges the panes vertically as much as it can
        { ............. shrinks the panes vertically by 1 row
        C-{ ........... shrinks the panes vertically as much as it can
        C-c { ......... shrinks the panes vertically as much as it can
        \\ ............. restores the size of all windows back to «normal»
        C-c C-z ....... enable/disable synchronized navigation

        C-= ........... smart compare files (ediff)
        C-c = ......... smart compare files (console compatible)
        = ............. fast smart compare files (plain diff)
        C-M-= ......... compare panes
        C-x = ......... compare panes (console compatible)

        C-c C-f ....... execute Find-dired in Sunrise VIRTUAL mode
        C-c C-n ....... execute find-Name-dired in Sunrise VIRTUAL mode
        C-u C-c C-g ... execute find-Grep-dired with additional grep options
        C-c C-g ....... execute grep in Sunrise VIRTUAL mode
        C-c C-l ....... execute Locate in Sunrise VIRTUAL mode
        C-c C-r ....... browse list of Recently visited files (requires recentf)
        C-c C-c ....... [after find, locate or recent] dismiss virtual buffer
        C-c / ......... narrow the contents of current pane using fuzzy matching
        C-c b ......... partial Branch view of selected items in current pane
        C-c p ......... Prune paths matching regular expression from current pane
        <span class="comment">; ............. follow file (<span class="keyword cl">go</span> to same directory as selected file)</span>
        M-<span class="comment">; ........... follow file in passive pane</span>
        C-M-o ......... follow a projection of current directory in passive pane

        C-&gt; ........... save named checkpoint (a.k.a. \"bookmark panes\")
        C-c &gt; ......... save named checkpoint (console compatible)
        C-.    ........ restore named checkpoint
        C-c .  ........ restore named checkpoint

        C-x C-q ....... put pane in Editable Dired mode (commit with C-c C-c)
        @! ............ fast backup files (not dirs!), each to [filename].bak

        C-c t ......... open new terminal or switch to already open one
        C-c T ......... open terminal AND/OR change directory to current
        C-c C-t ....... open always a new terminal in current directory
        C-c M-t ....... open a new terminal using an alternative shell program
        q, C-x k ...... quit Sunrise Commander, restore previous window setup
        M-q ........... quit Sunrise Commander, don't restore previous windows

Additionally, the following traditional commander-style keybindings are provided
\(these may be disabled by customizing the `<span class="constant important">sr-use-commander-keys</span>' option):

        F2 ............ go to directory
        F3 ............ quick visit selected file
        F4 ............ visit selected file
        F5 ............ copy marked (or current) files and directories
        F6 ............ rename marked (or current) files and directories
        F7 ............ create new directory
        F8 ............ delete marked (or current) files and directories
        F10 ........... quit Sunrise Commander
        C-F3 .......... sort contents of current pane by name
        C-F4 .......... sort contents of current pane by extension
        C-F5 .......... sort contents of current pane by time
        C-F6 .......... sort contents of current pane by size
        C-F7 .......... sort contents of current pane numerically
        S-F7 .......... soft-link selected file/directory to passive pane
        Insert ........ mark file
        C-PgUp ........ go to parent directory

Any other dired keybinding (not overridden by any of the above) can be used in
Sunrise, like G for changing group, M for changing mode and so on.

Some more bindings are available in terminals opened using any of the Sunrise
functions (i.e. one of: C-c t, C-c T, C-c C-t, C-c M-t):

        C-c Tab ....... switch focus to the active pane
        C-c t ......... cycle through all currently open terminals
        C-c T ......... cd to the directory in the active pane
        C-c C-t ....... open new terminal, cd to directory in the active pane
        C-c <span class="comment">; ......... follow the current directory in the active pane</span>
        C-c { ......... shrink the panes vertically as much as possible
        C-c } ......... enlarge the panes vertically as much as possible
        C-c \\ ......... restore the size of all windows back to «normal»
        C-c C-j ....... put terminal in line mode
        C-c C-k ....... put terminal back in char mode

The following bindings are available only in line mode (eshell is considered to
be *always* in line mode):

        M-&lt;up&gt;, M-P ... move cursor up in the active pane
        M-&lt;down&gt;, M-N . move cursor down in the active pane
        M-Return ...... visit selected file/directory in the active pane
        M-J ........... go to parent directory in the active pane
        M-G ........... refresh active pane
        M-Tab ......... switch to passive pane (without leaving the terminal)
        M-M ........... mark selected file/directory in the active pane
        M-Backspace ... unmark previous file/directory in the active pane
        M-U ........... remove all marks from the active pane
        C-Tab ......... switch focus to the active pane

In a terminal in line mode the following substitutions are also performed
automatically:

       %f - expands to the currently selected file in the left pane
       %F - expands to the currently selected file in the right pane
       %m - expands to the list of paths of all marked files in the left pane
       %M - expands to the list of paths of all marked files in the right pane
       %n - expands to the list of names of all marked files in the left pane
       %N - expands to the list of names of all marked files in the right pane
       %d - expands to the current directory in the left pane
       %D - expands to the current directory in the right pane
       %a - expands to the list of paths of all marked files in the active pane
       %A - expands to the current directory in the active pane
       %p - expands to the list of paths of all marked files in the passive pane
       %P - expands to the current directory in the passive pane
       %% - inserts a single % sign.
<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  (<span class="keyword cl">unless</span> (string-match "</span>\\(Sunrise\\)<span class="string">" (buffer-name))
    (rename-buffer (concat (buffer-name) "</span> (Sunrise)<span class="string">") t))
  (set-keymap-parent sr-mode-map dired-mode-map)
  (sr-highlight)
  (dired-omit-mode dired-omit-mode)

  (make-local-variable 'truncate-partial-width-windows)
  (setq truncate-partial-width-windows (sr-truncate-v t))

  (set (make-local-variable 'buffer-read-only) t)
  (set (make-local-variable 'dired-header-face) 'sr-passive-path-face)
  (set (make-local-variable 'dired-recursive-deletes) 'top)
  (set (make-local-variable 'truncate-lines) nil)
  (set (make-local-variable 'desktop-save-buffer) 'sr-desktop-save-buffer)
  (set (make-local-variable 'revert-buffer-function) 'sr-revert-buffer)
  (set (make-local-variable 'buffer-quit-function) 'sr-quit)
  (set (make-local-variable 'sr-show-file-attributes) sr-show-file-attributes)
  (set (make-local-variable 'mouse-1-click-follows-link) nil)
  (set (make-local-variable 'track-mouse) sr-cursor-follows-mouse)
  (set (make-local-variable 'hl-line-sticky-flag) nil)
  (hl-line-mode 1)
)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">define-derived-mode</span> <span class="function">sr-virtual-mode</span> dired-virtual-mode "</span>Sunrise VIRTUAL<span class="string">"
  "</span>Sunrise Commander Virtual Mode. Useful for reusing find and locate results.<span class="string">"
  <span class="builtin">:group</span> 'sunrise
  (set-keymap-parent sr-virtual-mode-map sr-mode-map)
  (sr-highlight)
  (enriched-mode -1)

  (make-local-variable 'truncate-partial-width-windows)
  (setq truncate-partial-width-windows (sr-truncate-v t))

  (set (make-local-variable 'buffer-read-only) t)
  (set (make-local-variable 'dired-header-face) 'sr-passive-path-face)
  (set (make-local-variable 'truncate-lines) nil)
  (set (make-local-variable 'desktop-save-buffer) 'sr-desktop-save-buffer)
  (set (make-local-variable 'revert-buffer-function) 'sr-revert-buffer)
  (set (make-local-variable 'buffer-quit-function) 'sr-quit)
  (set (make-local-variable 'sr-show-file-attributes) sr-show-file-attributes)
  (set (make-local-variable 'mouse-1-click-follows-link) nil)
  (set (make-local-variable 'track-mouse) sr-cursor-follows-mouse)
  (set (make-local-variable 'hl-line-sticky-flag) nil)
  (hl-line-mode 1)

  (define-key sr-virtual-mode-map "</span>\C-c\C-c<span class="string">" 'sr-virtual-dismiss)
  (define-key sr-virtual-mode-map "</span>\C-cv<span class="string">"    'sr-backup-buffer))

(<span class="keyword">defmacro</span> <span class="function">sr-within</span> (dir form)
  "</span>Evaluate FORM in Sunrise context.<span class="string">"
  `(<span class="keyword elisp">unwind-protect</span>
       (<span class="keyword elisp">progn</span>
         (setq sr-dired-directory
               (file-name-as-directory (abbreviate-file-name ,dir)))
         (ad-activate 'dired-find-buffer-nocreate)
         ,form)
     (ad-deactivate 'dired-find-buffer-nocreate)
     (setq sr-dired-directory "</span><span class="string">")))

(<span class="keyword">defmacro</span> <span class="function">sr-save-aspect</span> (<span class="type">&amp;rest</span> body)
  "</span>Restore omit mode, hidden attributes and point after a directory transition.<span class="string">"
  `(<span class="keyword elisp">let</span> ((inhibit-read-only t)
         (omit (or dired-omit-mode -1))
         (attrs (eval 'sr-show-file-attributes))
         (path-faces sr-current-path-faces))
     ,@body
     (dired-omit-mode omit)
     (<span class="keyword elisp">if</span> path-faces
         (setq sr-current-path-faces path-faces))
     (<span class="keyword elisp">if</span> (string= "</span>NUMBER<span class="string">" (get sr-selected-window 'sorting-order))
         (sr-sort-by-operation 'sr-numerical-sort-op))
     (<span class="keyword elisp">if</span> (get sr-selected-window 'sorting-reverse)
         (sr-reverse-pane))
     (setq sr-show-file-attributes attrs)
     (sr-display-attributes (point-min) (point-max) sr-show-file-attributes)
     (sr-restore-point-if-same-buffer)))

(<span class="keyword">defmacro</span> <span class="function">sr-save-selected-window</span> (<span class="type">&amp;rest</span> body)
  "</span>Execute BODY, then select the previously selected window.
During the operation, `<span class="constant important">sr-inhibit-switch</span>' is set to t.
Uses `<span class="constant important">save-selected-window</span>' internally.<span class="string">"
  `(<span class="keyword elisp">let</span> ((sr-inhibit-switch t))
     (<span class="keyword elisp">save-selected-window</span>
       ,@body)))

(<span class="keyword">defmacro</span> <span class="function">sr-alternate-buffer</span> (form)
  "</span>Execute FORM in a new buffer, after killing the previous one.<span class="string">"
  `(<span class="keyword elisp">let</span> ((dispose nil))
     (<span class="keyword cl">unless</span> (or (not (or dired-directory (eq major-mode 'sr-tree-mode)))
                 (eq sr-left-buffer sr-right-buffer))
       (setq dispose (current-buffer)))
     ,form
     (setq sr-this-directory default-directory)
     (sr-keep-buffer)
     (sr-highlight)
     (<span class="keyword cl">when</span> (and sr-kill-unused-buffers (buffer-live-p dispose))
       (<span class="keyword elisp">with-current-buffer</span> dispose
         (bury-buffer)
         (set-buffer-modified-p nil)
         (<span class="keyword cl">unless</span> (kill-buffer dispose)
           (kill-local-variable 'sr-current-path-faces))))))

(<span class="keyword">defmacro</span> <span class="function">sr-in-other</span> (form)
  "</span>Execute FORM in the context of the passive pane.
Helper macro for passive &amp; synchronized navigation.<span class="string">"
  `(<span class="keyword elisp">let</span> ((home sr-selected-window))
     (<span class="keyword elisp">let</span> ((sr-inhibit-highlight t))
       (<span class="keyword elisp">if</span> sr-synchronized ,form)
       (sr-change-window)
       (<span class="keyword elisp">condition-case</span> description
           ,form
         (<span class="warning">error</span> (message (cadr description)))))
     (<span class="keyword elisp">if</span> (not sr-running)
         (sr-select-window home)
       (run-hooks 'sr-refresh-hook)
       (sr-change-window))))

(<span class="keyword">defmacro</span> <span class="function">sr-silently</span> (<span class="type">&amp;rest</span> body)
  "</span>Inhibit calls to `<span class="constant important">message</span>' in BODY.<span class="string">"
  `(cl-letf (((symbol-function 'message) (<span class="keyword elisp">lambda</span> (_msg <span class="type">&amp;rest</span> _args) (ignore))))
     ,@body))

(<span class="keyword elisp">eval-and-compile</span>
  (<span class="keyword">defun</span> <span class="function">sr-symbol</span> (side type)
    "</span>Synthesize Sunrise symbols (`<span class="constant important">sr-left-buffer</span>', `<span class="constant important">sr-right-window</span>', etc.).<span class="string">"
    (intern (concat "</span>sr-<span class="string">" (symbol-name side) "</span>-<span class="string">" (symbol-name type)))))

(<span class="keyword">defun</span> <span class="function">sr-dired-mode</span> ()
  "</span>Set Sunrise mode in every Dired buffer opened in Sunrise (called in a hook).<span class="string">"
  (<span class="keyword elisp">if</span> (and sr-running
           (eq (selected-frame) sr-current-frame)
           (sr-equal-dirs dired-directory default-directory)
           (not (eq major-mode 'sr-mode)))
      (<span class="keyword elisp">let</span> ((dired-listing-switches dired-listing-switches)
            (sorting-options (or (get sr-selected-window 'sorting-options) "</span><span class="string">")))
        (<span class="keyword cl">unless</span> (string-match tramp-file-name-regexp default-directory)
          (setq dired-listing-switches
                (concat sr-listing-switches sorting-options)))
        (sr-mode)
        (dired-unadvertise dired-directory))))
(add-hook 'dired-before-readin-hook 'sr-dired-mode)

(<span class="keyword">defun</span> <span class="function">sr-bookmark-jump</span> ()
  "</span>Handle panes opened from bookmarks in Sunrise.<span class="string">"
  (<span class="keyword cl">when</span> (and sr-running
             (memq (selected-window) (list sr-left-window sr-right-window)))
    (<span class="keyword elisp">let</span> ((last-buf (symbol-value (sr-symbol sr-selected-window 'buffer))))
      (setq dired-omit-mode (<span class="keyword elisp">with-current-buffer</span> last-buf dired-omit-mode))
      (setq sr-this-directory default-directory)
      (<span class="keyword elisp">if</span> (sr-equal-dirs sr-this-directory sr-other-directory)
          (sr-synchronize-panes t)
        (revert-buffer))
      (sr-keep-buffer)
      (<span class="keyword cl">unless</span> (memq last-buf (list (current-buffer) (sr-other 'buffer)))
        (kill-buffer last-buf)))))
(add-hook 'bookmark-after-jump-hook 'sr-bookmark-jump)

(<span class="keyword">defun</span> <span class="function">sr-virtualize-pane</span> ()
  "</span>Put the current normal view in VIRTUAL mode.<span class="string">"
  (interactive)
  (<span class="keyword cl">when</span> (eq major-mode 'sr-mode)
    (<span class="keyword elisp">let</span> ((focus (dired-get-filename 'verbatim t)))
      (sr-save-aspect
       (<span class="keyword cl">when</span> (eq sr-left-buffer sr-right-buffer)
         (dired default-directory)
         (sr-keep-buffer))
       (sr-virtual-mode))
      (<span class="keyword elisp">if</span> focus (sr-focus-filename focus)))))

(<span class="keyword">defun</span> <span class="function">sr-virtual-dismiss</span> ()
  "</span>Restore normal pane view in Sunrise VIRTUAL mode.<span class="string">"
  (interactive)
  (<span class="keyword cl">when</span> (eq major-mode 'sr-virtual-mode)
    (<span class="keyword elisp">let</span> ((focus (dired-get-filename 'verbatim t)))
      (sr-process-kill)
      (sr-save-aspect
       (sr-alternate-buffer (sr-goto-dir sr-this-directory))
       (<span class="keyword elisp">if</span> focus (sr-focus-filename focus))
       (revert-buffer)))))

(<span class="keyword">defun</span> <span class="function">sr-backup-buffer</span> ()
  "</span>Create a backup copy of the current buffer.
Used as a cache during revert operations.<span class="string">"
  (interactive)
  (sr-kill-backup-buffer)
  (<span class="keyword elisp">let</span> ((buf (current-buffer)))
    (setq sr-backup-buffer (generate-new-buffer "</span>*Sunrise Backup*<span class="string">"))
    (<span class="keyword elisp">with-current-buffer</span> sr-backup-buffer
      (insert-buffer-substring buf))
    (run-hooks 'sr-refresh-hook)))

(<span class="keyword">defun</span> <span class="function">sr-kill-backup-buffer</span> ()
  "</span>Kill the backup buffer associated to the current one, if there is any.<span class="string">"
  (<span class="keyword cl">when</span> (buffer-live-p sr-backup-buffer)
    (kill-buffer sr-backup-buffer)
    (setq sr-backup-buffer nil)))
(add-hook 'kill-buffer-hook       'sr-kill-backup-buffer)
(add-hook 'change-major-mode-hook 'sr-kill-backup-buffer)

(add-to-list 'enriched-translations '(invisible (t "</span>x-invisible<span class="string">")))
(<span class="keyword">defun</span> <span class="function">sr-enrich-buffer</span> ()
  "</span>Activate `<span class="constant important">enriched-mode</span>' before saving a Sunrise buffer to a file.
This is done so all its dired-filename attributes are kept in the file.<span class="string">"
  (<span class="keyword elisp">if</span> (memq major-mode '(sr-mode sr-virtual-mode))
      (enriched-mode 1)))
(add-hook 'before-save-hook 'sr-enrich-buffer)

(<span class="keyword">defun</span> <span class="function">sr-extend-with</span> (extension <span class="type">&amp;optional</span> filename)
  "</span>Try to enhance Sunrise with EXTENSION (argument must be a symbol).
An extension can be loaded from optional FILENAME. If found, the extension is
immediately loaded, but only if `<span class="constant important">sr-autoload-extensions</span>' is not nil.<span class="string">"
  (<span class="keyword cl">when</span> sr-autoload-extensions
    (<span class="keyword">require</span> <span class="constant">extension</span> filename t)))

(<span class="keyword">defadvice</span> <span class="function">dired-find-buffer-nocreate</span>
    (before sr-advice-findbuffer (dirname <span class="type">&amp;optional</span> mode))
  "</span>A hack to avoid some Dired mode quirks in the Sunrise Commander.<span class="string">"
  (<span class="keyword elisp">if</span> (sr-equal-dirs sr-dired-directory dirname)
      (setq mode 'sr-mode)))
<span class="comment">;; ^--- activated by sr-within macro</span>

(<span class="keyword">defadvice</span> <span class="function">dired-dwim-target-directory</span>
    (around sr-advice-dwim-target ())
  "</span>Tweak the target directory guessing mechanism when Sunrise Commander is on.<span class="string">"
  (<span class="keyword elisp">if</span> (and sr-running (eq (selected-frame) sr-current-frame))
      (setq ad-return-value sr-other-directory)
    ad-do-it))
(ad-activate 'dired-dwim-target-directory)

(<span class="keyword">defadvice</span> <span class="function">select-window</span>
    (after sr-ad-select-window (window <span class="type">&amp;optional</span> norecord))
  "</span>Detect Sunrise pane switches and update tracking state accordingly.<span class="string">"
  (sr-detect-switch))
(ad-activate 'select-window)

(<span class="keyword">defadvice</span> <span class="function">other-window</span>
    (around sr-advice-other-window (count <span class="type">&amp;optional</span> all-frames))
  "</span>Select the correct Sunrise Commander pane when switching from other windows.<span class="string">"
  (<span class="keyword elisp">if</span> (or (not sr-running) sr-ediff-on)
      ad-do-it
    (<span class="keyword elisp">let</span> ((from (selected-window))
          (to (next-window)))
      (<span class="keyword elisp">if</span> (or sr-traditional-other-window
              (not (memq to (list sr-left-window sr-right-window)))
              (memq from (list sr-left-window sr-right-window)))
          ad-do-it
        (sr-select-window sr-selected-window))))
  (sr-detect-switch))
(ad-activate 'other-window)

(<span class="keyword">defadvice</span> <span class="function">use-hard-newlines</span>
    (around sr-advice-use-hard-newlines (<span class="type">&amp;optional</span> arg insert))
  "</span>Stop asking if I want hard lines the in Sunrise Commander, just guess.<span class="string">"
  (<span class="keyword elisp">if</span> (memq major-mode '(sr-mode sr-virtual-mode))
      (<span class="keyword elisp">let</span> ((inhibit-read-only t))
        (setq insert 'guess)
        ad-do-it)
    ad-do-it))
(ad-activate 'use-hard-newlines)

(<span class="keyword">defadvice</span> <span class="function">dired-insert-set-properties</span>
    (around sr-advice-dired-insert-set-properties (beg end))
  "</span>Manage hidden attributes in files added externally (e.g. from find-dired) to
the Sunrise Commander.<span class="string">"
  (<span class="keyword elisp">if</span> (not (memq major-mode '(sr-mode sr-virtual-mode)))
      ad-do-it
    (<span class="keyword elisp">with-no-warnings</span>
      (sr-display-attributes beg end sr-show-file-attributes))))
(ad-activate 'dired-insert-set-properties)

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Sunrise Commander keybindings:</span>

(define-key sr-mode-map "</span>\C-m<span class="string">"        'sr-advertised-find-file)
(define-key sr-mode-map "</span>f<span class="string">"           'sr-advertised-find-file)
(define-key sr-mode-map "</span>X<span class="string">"           'sr-advertised-execute-file)
(define-key sr-mode-map "</span>o<span class="string">"           'sr-quick-view)
(define-key sr-mode-map "</span>v<span class="string">"           'sr-quick-view)
(define-key sr-mode-map "</span>/<span class="string">"           'sr-goto-dir)
(define-key sr-mode-map "</span>j<span class="string">"           'sr-goto-dir)
(define-key sr-mode-map "</span>^<span class="string">"           'sr-dired-prev-subdir)
(define-key sr-mode-map "</span>J<span class="string">"           'sr-dired-prev-subdir)
(define-key sr-mode-map "</span><span class="comment">;<span class="string">"           'sr-follow-file)</span>
(define-key sr-mode-map "</span>\M-t<span class="string">"        'sr-transpose-panes)
(define-key sr-mode-map "</span>\M-o<span class="string">"        'sr-synchronize-panes)
(define-key sr-mode-map "</span>\C-\M-o<span class="string">"     'sr-project-path)
(define-key sr-mode-map "</span>\M-y<span class="string">"        'sr-history-prev)
(define-key sr-mode-map "</span>\M-u<span class="string">"        'sr-history-next)
(define-key sr-mode-map "</span>\C-c&gt;<span class="string">"       'sr-checkpoint-save)
(define-key sr-mode-map "</span>\C-c.<span class="string">"       'sr-checkpoint-restore)
(define-key sr-mode-map "</span>\C-c\C-z<span class="string">"    'sr-sync)
(define-key sr-mode-map "</span>\C-c\C-c<span class="string">"    'revert-buffer)

(define-key sr-mode-map "</span>\t<span class="string">"          'sr-change-window)
(define-key sr-mode-map "</span>\C-c\t<span class="string">"      'sr-select-viewer-window)
(define-key sr-mode-map "</span>\M-a<span class="string">"        'sr-beginning-of-buffer)
(define-key sr-mode-map "</span>\M-e<span class="string">"        'sr-end-of-buffer)
(define-key sr-mode-map "</span>\C-c\C-s<span class="string">"    'sr-split-toggle)
(define-key sr-mode-map "</span>]<span class="string">"           'sr-enlarge-left-pane)
(define-key sr-mode-map "</span>[<span class="string">"           'sr-enlarge-right-pane)
(define-key sr-mode-map "</span>}<span class="string">"           'sr-enlarge-panes)
(define-key sr-mode-map "</span>{<span class="string">"           'sr-shrink-panes)
(define-key sr-mode-map "</span>\\"          'sr-lock-panes)
(define-key sr-mode-map <span class="string">"\C-c}"</span>       'sr-max-lock-panes)
(define-key sr-mode-map <span class="string">"\C-c{"</span>       'sr-min-lock-panes)
(define-key sr-mode-map <span class="string">"\C-o"</span>        'dired-omit-mode)
(define-key sr-mode-map <span class="string">"b"</span>           'sr-browse-file)
(define-key sr-mode-map <span class="string">"\C-c\C-w"</span>    'sr-browse-pane)
(define-key sr-mode-map <span class="string">"\C-c\d"</span>      'sr-toggle-attributes)
(define-key sr-mode-map <span class="string">"\M-l"</span>        'sr-toggle-truncate-lines)
(define-key sr-mode-map <span class="string">"s"</span>           'sr-interactive-sort)
(define-key sr-mode-map <span class="string">"r"</span>           'sr-reverse-pane)
(define-key sr-mode-map <span class="string">"\C-e"</span>        'sr-scroll-up)
(define-key sr-mode-map <span class="string">"\C-y"</span>        'sr-scroll-down)
(define-key sr-mode-map <span class="string">" "</span>           'sr-scroll-quick-view)
(define-key sr-mode-map <span class="string">"\M- "</span>        'sr-scroll-quick-view-down)
(define-key sr-mode-map [?\S- ]       'sr-scroll-quick-view-down)

(define-key sr-mode-map <span class="string">"C"</span>           'sr-do-copy)
(define-key sr-mode-map <span class="string">"K"</span>           'sr-do-clone)
(define-key sr-mode-map <span class="string">"R"</span>           'sr-do-rename)
(define-key sr-mode-map <span class="string">"D"</span>           'sr-do-delete)
(define-key sr-mode-map <span class="string">"x"</span>           'sr-do-flagged-delete)
(define-key sr-mode-map <span class="string">"S"</span>           'sr-do-symlink)
(define-key sr-mode-map <span class="string">"Y"</span>           'sr-do-relsymlink)
(define-key sr-mode-map <span class="string">"H"</span>           'sr-do-hardlink)
(define-key sr-mode-map <span class="string">"N"</span>           'sr-inplace)
(define-key sr-mode-map <span class="string">"\M-C"</span>        'dired-do-copy)
(define-key sr-mode-map <span class="string">"\M-R"</span>        'dired-do-rename)
(define-key sr-mode-map <span class="string">"\M-D"</span>        'dired-do-delete)
(define-key sr-mode-map <span class="string">"\M-S"</span>        'dired-do-symlink)
(define-key sr-mode-map <span class="string">"\M-Y"</span>        'dired-do-relsymlink)
(define-key sr-mode-map <span class="string">"\M-H"</span>        'dired-do-hardlink)
(define-key sr-mode-map <span class="string">"\C-x\C-q"</span>    'sr-editable-pane)
(define-key sr-mode-map <span class="string">"@"</span>           'sr-fast-backup-files)
(define-key sr-mode-map <span class="string">"\M-+"</span>        'sr-create-files)

(define-key sr-mode-map <span class="string">"="</span>           'sr-diff)
(define-key sr-mode-map <span class="string">"\C-c="</span>       'sr-ediff)
(define-key sr-mode-map <span class="string">"\C-x="</span>       'sr-compare-panes)

(define-key sr-mode-map <span class="string">"\C-c\C-f"</span>    'sr-find)
(define-key sr-mode-map <span class="string">"\C-c\C-n"</span>    'sr-find-name)
(define-key sr-mode-map <span class="string">"\C-c\C-g"</span>    'sr-grep)
(define-key sr-mode-map <span class="string">"\C-cb"</span>       'sr-flatten-branch)
(define-key sr-mode-map <span class="string">"\C-cp"</span>       'sr-prune-paths)
(define-key sr-mode-map <span class="string">"\C-c\C-l"</span>    'sr-locate)
(define-key sr-mode-map <span class="string">"\C-c/"</span>       'sr-fuzzy-narrow)
(define-key sr-mode-map <span class="string">"\C-c\C-r"</span>    'sr-recent-files)
(define-key sr-mode-map <span class="string">"\C-c\C-d"</span>    'sr-recent-directories)
(define-key sr-mode-map <span class="string">"\C-cv"</span>       'sr-virtualize-pane)
(define-key sr-mode-map <span class="string">"\C-c\C-v"</span>    'sr-pure-virtual)
(define-key sr-mode-map <span class="string">"Q"</span>           'sr-do-query-replace-regexp)
(define-key sr-mode-map <span class="string">"\C-q"</span>        'sr-multi-occur)
(define-key sr-mode-map <span class="string">"F"</span>           'sr-do-find-marked-files)
(define-key sr-mode-map <span class="string">"A"</span>           'sr-do-search)
(define-key sr-mode-map <span class="string">"\C-cs"</span>       'sr-sticky-isearch-forward)
(define-key sr-mode-map <span class="string">"\C-cr"</span>       'sr-sticky-isearch-backward)
(define-key sr-mode-map <span class="string">"\C-x\C-f"</span>    'sr-find-file)
(define-key sr-mode-map <span class="string">"y"</span>           'sr-show-files-info)

(define-key sr-mode-map <span class="string">"\M-n"</span>        'sr-next-line-other)
(define-key sr-mode-map [M-down]      'sr-next-line-other)
(define-key sr-mode-map [A-down]      'sr-next-line-other)
(define-key sr-mode-map <span class="string">"\M-p"</span>        'sr-prev-line-other)
(define-key sr-mode-map [M-up]        'sr-prev-line-other)
(define-key sr-mode-map [A-up]        'sr-prev-line-other)
(define-key sr-mode-map <span class="string">"\M-j"</span>        'sr-goto-dir-other)
(define-key sr-mode-map <span class="string">"\M-\C-m"</span>     'sr-advertised-find-file-other)
(define-key sr-mode-map <span class="string">"\M-f"</span>        'sr-advertised-find-file-other)
(define-key sr-mode-map <span class="string">"\C-c\C-m"</span>    'sr-advertised-find-file-other)
(define-key sr-mode-map <span class="string">"\M-^"</span>        'sr-prev-subdir-other)
(define-key sr-mode-map <span class="string">"\M-J"</span>        'sr-prev-subdir-other)
(define-key sr-mode-map <span class="string">"\M-m"</span>        'sr-mark-other)
(define-key sr-mode-map <span class="string">"\M-M"</span>        'sr-unmark-backward-other)
(define-key sr-mode-map <span class="string">"\M-U"</span>        'sr-unmark-all-marks-other)
(define-key sr-mode-map <span class="string">"\M-<span class="comment">;"</span>        'sr-follow-file-other)</span>
(define-key sr-mode-map <span class="string">"\C-\M-y"</span>     'sr-history-prev-other)
(define-key sr-mode-map <span class="string">"\C-\M-u"</span>     'sr-history-next-other)

(define-key sr-mode-map <span class="string">"\C-ct"</span>       'sr-term)
(define-key sr-mode-map <span class="string">"\C-cT"</span>       'sr-term-cd)
(define-key sr-mode-map <span class="string">"\C-c\C-t"</span>    'sr-term-cd-newterm)
(define-key sr-mode-map <span class="string">"\C-c\M-t"</span>    'sr-term-cd-program)
(define-key sr-mode-map <span class="string">"\C-c<span class="comment">;"</span>       'sr-follow-viewer)</span>
(define-key sr-mode-map <span class="string">"q"</span>           'sr-quit)
(define-key sr-mode-map <span class="string">"\C-xk"</span>       'sr-kill-pane-buffer)
(define-key sr-mode-map <span class="string">"\M-q"</span>        'sunrise-cd)
(define-key sr-mode-map <span class="string">"h"</span>           'sr-describe-mode)
(define-key sr-mode-map <span class="string">"?"</span>           'sr-summary)
(define-key sr-mode-map <span class="string">"k"</span>           'dired-do-kill-lines)
(define-key sr-mode-map [remap undo]  'sr-undo)
(define-key sr-mode-map [remap undo-only] 'sr-undo)
(define-key sr-mode-map [backspace]   'dired-unmark-backward)

(define-key sr-mode-map [mouse-1]        'sr-mouse-advertised-find-file)
(define-key sr-mode-map [mouse-2]        'sr-mouse-change-window)
(define-key sr-mode-map [mouse-movement] 'sr-mouse-move-cursor)

(define-key sr-mode-map [(control &gt;)]         'sr-checkpoint-save)
(define-key sr-mode-map [(control .)]         'sr-checkpoint-restore)
(define-key sr-mode-map [(control tab)]       'sr-select-viewer-window)
(define-key sr-mode-map [(control backspace)] 'sr-toggle-attributes)
(define-key sr-mode-map [(control ?\=)]       'sr-ediff)
(define-key sr-mode-map [(control meta ?\=)]  'sr-compare-panes)
(define-key sr-mode-map [(control })]         'sr-max-lock-panes)
(define-key sr-mode-map [(control {)]         'sr-min-lock-panes)

(<span class="keyword">defvar</span> <span class="variable">sr-commander-keys</span>
  '(([(f2)]            . sr-goto-dir)
    ([(f3)]            . sr-quick-view)
    ([(f4)]            . sr-advertised-find-file)
    ([(f5)]            . sr-do-copy)
    ([(f6)]            . sr-do-rename)
    ([(f7)]            . dired-create-directory)
    ([(f8)]            . sr-do-delete)
    ([(f10)]           . sr-quit)
    ([(control f3)]    . sr-sort-by-name)
    ([(control f4)]    . sr-sort-by-extension)
    ([(control f5)]    . sr-sort-by-time)
    ([(control f6)]    . sr-sort-by-size)
    ([(control f7)]    . sr-sort-by-number)
    ([(shift f7)]      . sr-do-symlink)
    ([(insert)]        . sr-mark-toggle)
    ([(control prior)] . sr-dired-prev-subdir))
  <span class="string">"Traditional commander-style keybindings for the Sunrise Commander."</span>)

(<span class="keyword">defcustom</span> <span class="variable">sr-use-commander-keys</span> t
  <span class="string">"Whether to use traditional commander-style function keys (F5 = copy, etc)"</span>
  <span class="builtin">:group</span> 'sunrise
  <span class="builtin">:type</span> 'boolean
  <span class="builtin">:set</span> (<span class="keyword">defun</span> <span class="function">sr-set-commander-keys</span> (symbol value)
         <span class="string">"Setter function for the `<span class="constant important">sr-use-commander-keys</span>' custom option."</span>
         (<span class="keyword elisp">if</span> value
             (mapc (<span class="keyword elisp">lambda</span> (x)
                     (define-key sr-mode-map (car x) (cdr x))) sr-commander-keys)
           (mapc (<span class="keyword elisp">lambda</span> (x)
                   (define-key sr-mode-map (car x) nil)) sr-commander-keys))
         (set-default symbol value)))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Initialization and finalization functions:</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sunrise</span> (<span class="type">&amp;optional</span> left-directory right-directory filename)
  <span class="string">"Toggle the Sunrise Commander file manager.
If LEFT-DIRECTORY is given, the left window will display that
directory (same for RIGHT-DIRECTORY). Specifying nil for any of
these values uses the default, ie. $HOME."</span>
  (interactive)
  (message <span class="string">"Starting Sunrise Commander..."</span>)

  (<span class="keyword elisp">if</span> (not sr-running)
      (<span class="keyword elisp">let</span> ((welcome sr-start-message))
        (<span class="keyword elisp">if</span> left-directory
            (setq sr-left-directory left-directory))
        (<span class="keyword elisp">if</span> right-directory
            (setq sr-right-directory right-directory))

        (sr-switch-to-nonpane-buffer)
        (setq sr-restore-buffer (current-buffer)
              sr-current-frame (window-frame (selected-window))
              sr-prior-window-configuration (current-window-configuration))
        (sr-setup-windows)
        (<span class="keyword elisp">if</span> filename
            (<span class="keyword elisp">condition-case</span> description
                (sr-focus-filename (file-name-nondirectory filename))
              (<span class="warning">error</span> (setq welcome (cadr description)))))
        (setq sr-this-directory default-directory)
        (sr-highlight) <span class="comment">;;&lt;-- W32Emacs needs this</span>
        (hl-line-mode 1)
        (message <span class="string">"%s"</span> welcome)
        (setq sr-running t))
    (<span class="keyword elisp">let</span> ((my-frame (window-frame (selected-window))))
      (sr-quit)
      (message <span class="string">"All life leaps out to greet the light..."</span>)
      (<span class="keyword cl">unless</span> (eq my-frame (window-frame (selected-window)))
        (select-frame my-frame)
        (sunrise left-directory right-directory filename)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sr-dired</span> (<span class="type">&amp;optional</span> target switches)
  <span class="string">"Visit the given TARGET (file or directory) in `<span class="constant important">sr-mode</span>'.
If provided, use SWITCHES instead of `<span class="constant important">sr-listing-switches</span>'."</span>
  (interactive
   (list
    (read-file-name <span class="string">"Visit (file or directory): "</span> nil nil nil)))
  (<span class="keyword elisp">let</span>* ((target (expand-file-name (or target default-directory)))
         (file (<span class="keyword elisp">if</span> (file-directory-p target) nil target))
         (directory (<span class="keyword elisp">if</span> file (file-name-directory target) target))
         (dired-omit-mode (<span class="keyword elisp">if</span> sr-show-hidden-files -1 1))
         (sr-listing-switches (or switches sr-listing-switches)))
    (<span class="keyword cl">unless</span> (file-readable-p directory)
      (<span class="warning">error</span> <span class="string">"%s is not readable!"</span> (sr-directory-name-proper directory)))
    (<span class="keyword cl">unless</span> (and sr-running (eq (selected-frame) sr-current-frame)) (sunrise))
    (sr-select-window sr-selected-window)
    (<span class="keyword elisp">if</span> file
        (sr-follow-file file)
      (sr-goto-dir directory))
    (hl-line-mode 1)
    (sr-display-attributes (point-min) (point-max) sr-show-file-attributes)
    (sr-this 'buffer)))

(<span class="keyword">defun</span> <span class="function">sr-choose-cd-target</span> ()
  <span class="string">"Select a suitable target directory for cd operations."</span>
  (<span class="keyword elisp">if</span> (and sr-running (eq (selected-frame) sr-current-frame))
      sr-this-directory
    default-directory))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sunrise-cd</span> ()
  <span class="string">"Toggle the Sunrise Commander FM keeping the current file in focus.
If Sunrise is off, enable it and focus the file displayed in the current buffer.
If Sunrise is on, disable it and switch to the buffer currently displayed in the
viewer window."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (not (and sr-running
                (eq (window-frame sr-left-window) (selected-frame))))
      (sr-dired (or (buffer-file-name) (sr-choose-cd-target)))
    (sr-quit t)
    (message <span class="string">"Hast thou a charm to stay the morning-star in his steep course?"</span>)))

(<span class="keyword">defun</span> <span class="function">sr-this</span> (<span class="type">&amp;optional</span> type)
  <span class="string">"Return object of type TYPE corresponding to the active side of the manager.
If TYPE is not specified (nil), returns a symbol (`<span class="constant important">left</span>' or `<span class="constant important">right</span>').
If TYPE is `<span class="constant important">buffer</span>' or `<span class="constant important">window</span>', returns the corresponding buffer
or window."</span>
  (<span class="keyword elisp">if</span> type
      (symbol-value (sr-symbol sr-selected-window type))
    sr-selected-window))

(<span class="keyword">defun</span> <span class="function">sr-other</span> (<span class="type">&amp;optional</span> type)
  <span class="string">"Return object of type TYPE corresponding to the passive side of the manager.
If TYPE is not specified (nil), returns a symbol (`<span class="constant important">left</span>' or `<span class="constant important">right</span>').
If TYPE is `<span class="constant important">buffer</span>' or `<span class="constant important">window</span>', returns the corresponding
buffer or window."</span>
  (<span class="keyword elisp">let</span> ((side (cdr (assq sr-selected-window sr-side-lookup))))
    (<span class="keyword elisp">if</span> type
        (symbol-value (sr-symbol side type))
      side)))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Window management functions:</span>

(<span class="keyword">defmacro</span> <span class="function">sr-setup-pane</span> (side)
  <span class="string">"Helper macro for the function `<span class="constant important">sr-setup-windows</span>'."</span>
  `(<span class="keyword elisp">let</span> ((sr-selected-window ',side))
     (setq ,(sr-symbol side 'window) (selected-window))
     (<span class="keyword elisp">if</span> (buffer-live-p ,(sr-symbol side 'buffer))
         (<span class="keyword elisp">progn</span>
           (switch-to-buffer ,(sr-symbol side 'buffer))
           (setq ,(sr-symbol side 'directory) default-directory))
       (<span class="keyword elisp">let</span> ((sr-running t))
         (sr-dired ,(sr-symbol side 'directory))))))

(<span class="keyword">defun</span> <span class="function">sr-setup-visible-panes</span> ()
  <span class="string">"Set up sunrise on all visible panes."</span>
  (sr-setup-pane left)
  (<span class="keyword cl">unless</span> (eq sr-window-split-style 'top)
    (other-window 1)
    (sr-setup-pane right)))

(<span class="keyword">defun</span> <span class="function">sr-setup-windows</span>()
  <span class="string">"Set up the Sunrise window configuration (two windows in `<span class="constant important">sr-mode</span>')."</span>
  (run-hooks 'sr-init-hook)
  <span class="comment">;;get rid of all windows except one (not any of the panes!)</span>
  (sr-select-viewer-window)
  (delete-other-windows)
  (<span class="keyword elisp">if</span> (buffer-live-p other-window-scroll-buffer)
      (switch-to-buffer other-window-scroll-buffer)
    (sr-switch-to-nonpane-buffer))

  <span class="comment">;;now create the viewer window</span>
  (<span class="keyword cl">unless</span> (and sr-panes-height (&lt; sr-panes-height (frame-height)))
    (setq sr-panes-height (sr-get-panes-size)))
  (<span class="keyword elisp">if</span> (and (&lt;= sr-panes-height (* 2 window-min-height))
           (eq sr-window-split-style 'vertical))
      (setq sr-panes-height (* 2 window-min-height)))
  (split-window (selected-window) sr-panes-height)

  (<span class="keyword cl">case</span> sr-window-split-style
    (horizontal (split-window-horizontally))
    (vertical   (split-window-vertically))
    (top        (ignore))
    (t (<span class="warning">error</span> <span class="string">"Unrecognised `<span class="constant important">sr-window-split-style</span>' value: %s"</span>
              sr-window-split-style)))

  (sr-setup-visible-panes)

  <span class="comment">;;select the correct window</span>
  (sr-select-window sr-selected-window)
  (sr-restore-panes-width)
  (run-hooks 'sr-start-hook))

(<span class="keyword">defun</span> <span class="function">sr-switch-to-nonpane-buffer</span> ()
  <span class="string">"Try to switch to a buffer that is *not* a Sunrise pane."</span>
  (<span class="keyword elisp">let</span> ((start (current-buffer)))
    (<span class="keyword elisp">while</span> (and
              start
              (or (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode))
                  (memq (current-buffer) (list sr-left-buffer sr-right-buffer))))
        (bury-buffer)
        (<span class="keyword elisp">if</span> (eq start (current-buffer)) (setq start nil)))))

(<span class="keyword">defun</span> <span class="function">sr-restore-prior-configuration</span> ()
  <span class="string">"Restore the configuration stored in `<span class="constant important">sr-prior-window-configuration</span>' if any.
Return t if a configuration to restore could be found, nil otherwise."</span>
  (<span class="keyword cl">when</span> sr-prior-window-configuration
    (set-window-configuration sr-prior-window-configuration)
    (<span class="keyword elisp">if</span> (buffer-live-p sr-restore-buffer)
        (set-buffer sr-restore-buffer))
    t))

(<span class="keyword">defun</span> <span class="function">sr-lock-window</span> (_frame)
  <span class="string">"Resize the left Sunrise pane to have the \"right\" size."</span>
  (<span class="keyword cl">when</span> sr-running
    (<span class="keyword elisp">if</span> (not (window-live-p sr-left-window))
        (setq sr-running nil)
      (<span class="keyword elisp">let</span> ((sr-windows-locked sr-windows-locked))
        (<span class="keyword cl">when</span> (&gt; window-min-height (- (frame-height)
                                      (window-height sr-left-window)))
          (setq sr-windows-locked nil))
        (and sr-windows-locked
             (not sr-ediff-on)
             (not (eq sr-window-split-style 'vertical))
             (window-live-p sr-left-window)
             (sr-save-selected-window
               (select-window sr-left-window)
               (<span class="keyword elisp">let</span>* ((sr-panes-height (or sr-panes-height (window-height)))
                      (my-delta (- sr-panes-height (window-height))))
                 (enlarge-window my-delta))
               (scroll-right)
               (<span class="keyword cl">when</span> (window-live-p sr-right-window)
                 (select-window sr-right-window)
                 (scroll-right))))))))

<span class="comment">;; This keeps the size of the Sunrise panes constant:</span>
(add-hook 'window-size-change-functions 'sr-lock-window)

(<span class="keyword">defun</span> <span class="function">sr-highlight</span>(<span class="type">&amp;optional</span> face)
  <span class="string">"Set up the path line in the current buffer.
With optional FACE, register this face as the current face to display the active
path line."</span>
  (<span class="keyword cl">when</span> (and (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode))
             (not sr-inhibit-highlight))
    (<span class="keyword elisp">let</span> ((inhibit-read-only t))
      (<span class="keyword elisp">save-excursion</span>
        (goto-char (point-min))
        (sr-hide-avfs-root)
        (sr-highlight-broken-links)
        (sr-graphical-highlight face)
        (sr-force-passive-highlight)
        (run-hooks 'sr-refresh-hook)))))

(<span class="keyword">defun</span> <span class="function">sr-unhighlight</span> (face)
  <span class="string">"Remove FACE from the list of faces of the active path line."</span>
  (<span class="keyword cl">when</span> face
    (setq sr-current-path-faces (delq face sr-current-path-faces))
    (overlay-put sr-current-window-overlay 'face
                 (or (car sr-current-path-faces) 'sr-active-path-face))))

(<span class="keyword">defun</span> <span class="function">sr-hide-avfs-root</span> ()
  <span class="string">"Hide the AVFS virtual filesystem root (<span class="keyword elisp">if</span> any) on the path line."</span>
  (<span class="keyword elisp">if</span> sr-avfs-root
      (<span class="keyword elisp">let</span> ((start nil) (end nil)
            (next (search-forward sr-avfs-root (point-at-eol) t)))
        (<span class="keyword elisp">if</span> next (setq start (- next (length sr-avfs-root))))
        (<span class="keyword elisp">while</span> next
          (setq end (point)
                next (search-forward sr-avfs-root (point-at-eol) t)))
        (<span class="keyword cl">when</span> end
          (add-text-properties start end '(invisible t))))))

(<span class="keyword">defun</span> <span class="function">sr-highlight-broken-links</span> ()
  <span class="string">"Mark broken symlinks with an exclamation mark."</span>
  (<span class="keyword elisp">let</span> ((dired-marker-char ?!))
    (<span class="keyword elisp">while</span> (search-forward-regexp dired-re-sym nil t)
      (<span class="keyword cl">unless</span> (or (not (eq 32 (char-after (line-beginning-position))))
                  (file-exists-p (dired-get-filename)))
        (dired-mark 1)))))

(<span class="keyword">defsubst</span> <span class="function">sr-invalid-overlayp</span> ()
  <span class="string">"Test for invalidity of the current buffer's graphical path line overlay.
Returns t if the overlay is no longer valid and should be replaced."</span>
  (or (not (overlayp sr-current-window-overlay))
      (eq (overlay-start sr-current-window-overlay)
          (overlay-end sr-current-window-overlay))))

(<span class="keyword">defun</span> <span class="function">sr-graphical-highlight</span> (<span class="type">&amp;optional</span> face)
  <span class="string">"Set up the graphical path line in the current buffer.
\(Fancy fonts and clickable path.)"</span>
  (<span class="keyword elisp">let</span> ((begin) (end) (inhibit-read-only t))

    (<span class="keyword cl">when</span> (sr-invalid-overlayp)
      <span class="comment">;;determine begining and end</span>
      (<span class="keyword elisp">save-excursion</span>
        (goto-char (point-min))
        (search-forward-regexp <span class="string">"\\S "</span> nil t)
        (setq begin (1- (point)))
        (end-of-line)
        (setq end (1- (point))))

      <span class="comment">;;build overlay</span>
      (<span class="keyword cl">when</span> sr-current-window-overlay
        (delete-overlay sr-current-window-overlay))
      (set (make-local-variable 'sr-current-window-overlay)
           (make-overlay begin end))

      <span class="comment">;;path line hover effect:</span>
      (add-text-properties
       begin
       end
       '(mouse-face sr-highlight-path-face
                    help-echo <span class="string">"click to move up"</span>)
       nil))
    (<span class="keyword cl">when</span> face
      (setq sr-current-path-faces (cons face sr-current-path-faces)))
    (overlay-put sr-current-window-overlay 'face
                 (or (car sr-current-path-faces) 'sr-active-path-face))
    (overlay-put sr-current-window-overlay 'window (selected-window))))

(<span class="keyword">defun</span> <span class="function">sr-force-passive-highlight</span> (<span class="type">&amp;optional</span> revert)
  <span class="string">"Set up the graphical path line in the passive pane.
With optional argument REVERT, executes `<span class="constant important">revert-buffer</span>' on the passive buffer."</span>
    (<span class="keyword cl">unless</span> (or (not (buffer-live-p (sr-other 'buffer)))
                (eq sr-left-buffer sr-right-buffer))
      (<span class="keyword elisp">with-current-buffer</span> (sr-other 'buffer)
        (<span class="keyword cl">when</span> sr-current-window-overlay
          (delete-overlay sr-current-window-overlay))
        (<span class="keyword cl">when</span> (and revert
                   (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode)))
          (revert-buffer)))))

(<span class="keyword">defun</span> <span class="function">sr-quit</span> (<span class="type">&amp;optional</span> norestore)
  <span class="string">"Quit Sunrise and restore Emacs to the previous state."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (not sr-running)
      (bury-buffer)
    (<span class="keyword elisp">let</span> ((buffer-read-only nil))
      (setq sr-running nil
            sr-current-frame nil)
      (sr-save-directories)
      (sr-save-panes-width)
      (<span class="keyword cl">when</span> (or norestore (not (sr-restore-prior-configuration)))
        (sr-select-viewer-window)
        (delete-other-windows))
      (sr-bury-panes)
      (run-hooks 'sr-quit-hook))))

(add-hook 'delete-frame-functions
          (<span class="keyword elisp">lambda</span> (frame)
            (<span class="keyword elisp">if</span> (and sr-running (eq frame sr-current-frame)) (sr-quit))))

(<span class="keyword">defun</span> <span class="function">sr-save-directories</span> ()
  <span class="string">"Save current directories in the panes to use them at the next startup."</span>
  (<span class="keyword elisp">save-current-buffer</span>
    (<span class="keyword cl">when</span> (window-live-p sr-left-window)
      (set-buffer (window-buffer sr-left-window))
      (<span class="keyword cl">when</span> (memq major-mode '(sr-mode sr-tree-mode))
        (setq sr-left-directory default-directory)
        (setq sr-left-buffer (current-buffer))))

    (<span class="keyword cl">when</span> (window-live-p sr-right-window)
      (set-buffer (window-buffer sr-right-window))
      (<span class="keyword cl">when</span> (memq major-mode '(sr-mode sr-tree-mode))
        (setq sr-right-directory default-directory)
        (setq sr-right-buffer (current-buffer))))))

(<span class="keyword">defun</span> <span class="function">sr-bury-panes</span> ()
  <span class="string">"Send both pane buffers to the end of the `<span class="constant important">buffer-list</span>'."</span>
  (mapc (<span class="keyword elisp">lambda</span> (x)
          (bury-buffer (symbol-value (sr-symbol x 'buffer))))
        '(left right)))

(<span class="keyword">defun</span> <span class="function">sr-save-panes-width</span> ()
  <span class="string">"Save the width of the panes to use them at the next startup."</span>
  (<span class="keyword cl">unless</span> sr-selected-window-width
    (<span class="keyword elisp">if</span> (and (window-live-p sr-left-window)
             (window-live-p sr-right-window))
        (setq sr-selected-window-width
              (window-width
               (symbol-value (sr-symbol sr-selected-window 'window))))
      (setq sr-selected-window-width t))))

(<span class="keyword">defun</span> <span class="function">sr-restore-panes-width</span> ()
  <span class="string">"Restore the last registered pane width."</span>
  (<span class="keyword cl">when</span> (and (eq sr-window-split-style 'horizontal)
             (numberp sr-selected-window-width))
    (enlarge-window-horizontally
     (min (- sr-selected-window-width (window-width))
          (- (frame-width) (window-width) window-min-width)))))

(<span class="keyword">defun</span> <span class="function">sr-resize-panes</span> (<span class="type">&amp;optional</span> reverse)
  <span class="string">"Enlarge (or shrink, if REVERSE is t) the left pane by 5 columns."</span>
  (<span class="keyword cl">when</span> (and (window-live-p sr-left-window)
             (window-live-p sr-right-window))
    (<span class="keyword elisp">let</span> ((direction (or (and reverse -1) 1)))
      (sr-save-selected-window
        (select-window sr-left-window)
        (enlarge-window-horizontally (* 5 direction))))
    (setq sr-selected-window-width nil)))

(<span class="keyword">defun</span> <span class="function">sr-enlarge-left-pane</span> ()
  <span class="string">"Enlarge the left pane by 5 columns."</span>
  (interactive)
  (<span class="keyword cl">when</span> (&lt; (1+ window-min-width) (window-width sr-right-window))
      (sr-resize-panes)
      (sr-save-panes-width)))

(<span class="keyword">defun</span> <span class="function">sr-enlarge-right-pane</span> ()
  <span class="string">"Enlarge the right pane by 5 columns."</span>
  (interactive)
  (<span class="keyword cl">when</span> (&lt; (1+ window-min-width) (window-width sr-left-window))
      (sr-resize-panes t)
      (sr-save-panes-width)))

(<span class="keyword">defun</span> <span class="function">sr-get-panes-size</span> (<span class="type">&amp;optional</span> size)
  <span class="string">"Tell what the maximal, minimal and normal pane sizes should be."</span>
  (<span class="keyword elisp">let</span> ((frame (frame-height)))
    (<span class="keyword cl">case</span> size
      (max (max (- frame window-min-height 1) 5))
      (min (min (1+ window-min-height) 5))
      (t  (/ (* sr-windows-default-ratio (frame-height)) 100)))))

(<span class="keyword">defun</span> <span class="function">sr-enlarge-panes</span> ()
  <span class="string">"Enlarge both panes vertically."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((sr-windows-locked nil)
        (max (sr-get-panes-size 'max))
        (ratio 1)
        delta)
    (sr-save-selected-window
      (<span class="keyword cl">when</span> (eq sr-window-split-style 'vertical)
        (select-window sr-right-window)
        (setq ratio 2)
        (setq delta (- max (window-height)))
        (<span class="keyword elisp">if</span> (&gt; (/ max ratio) (window-height))
            (shrink-window (<span class="keyword elisp">if</span> (&lt; 2 delta) -2 -1))))
      (select-window sr-left-window)
      (<span class="keyword elisp">if</span> (&gt; (/ max ratio) (window-height))
          (shrink-window -1))
      (setq sr-panes-height (* (window-height) ratio)))))

(<span class="keyword">defun</span> <span class="function">sr-shrink-panes</span> ()
  <span class="string">"Shink both panes vertically."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((sr-windows-locked nil)
        (min (sr-get-panes-size 'min))
        (ratio 1)
        delta)
    (sr-save-selected-window
      (<span class="keyword cl">when</span> (eq sr-window-split-style 'vertical)
        (select-window sr-right-window)
        (setq ratio 2)
        (setq delta (- (window-height) min))
        (<span class="keyword elisp">if</span> (&lt; min (window-height))
            (shrink-window (<span class="keyword elisp">if</span> (&lt; 2 delta) 2 1))))
      (select-window sr-left-window)
      (<span class="keyword elisp">if</span> (&lt; min (window-height))
          (shrink-window 1))
      (setq sr-panes-height (* (window-height) ratio)))))

(<span class="keyword">defun</span> <span class="function">sr-lock-panes</span> (<span class="type">&amp;optional</span> height)
  <span class="string">"Resize and lock the panes at some vertical position.
The optional argument determines the height to lock the panes at.
Valid values are `<span class="constant important">min</span>' and `<span class="constant important">max</span>'<span class="comment">; given any other value, locks</span>
the panes at normal position."</span>
  (interactive)
  (<span class="keyword elisp">if</span> sr-running
    (<span class="keyword elisp">if</span> (not (and (window-live-p sr-left-window)
                  (or (window-live-p sr-right-window)
                      (eq sr-window-split-style 'top))))
        (sr-setup-windows)
      (setq sr-panes-height (sr-get-panes-size height))
      (<span class="keyword elisp">let</span> ((locked sr-windows-locked))
        (setq sr-windows-locked t)
        (<span class="keyword elisp">if</span> height
            (shrink-window 1)
          (setq sr-selected-window-width t)
          (balance-windows))
        (<span class="keyword cl">unless</span> locked
          (sit-for 0.1)
          (setq sr-windows-locked nil))))
    (sunrise)))

(<span class="keyword">defun</span> <span class="function">sr-max-lock-panes</span> ()
  (interactive)
  (sr-save-panes-width)
  (sr-lock-panes 'max))

(<span class="keyword">defun</span> <span class="function">sr-min-lock-panes</span> ()
  (interactive)
  (sr-save-panes-width)
  (sr-lock-panes 'min))

(<span class="keyword">defun</span> <span class="function">sr-mouse-disown-cursor</span> ()
  <span class="string">"Reset the mouse movement event counter. This is used to
implement the `<span class="constant important">sr-cursor-follows-mouse</span>' feature."</span>
  (setq sr-mouse-events-count 0))
(add-hook 'sr-init-hook 'sr-mouse-disown-cursor)

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; File system navigation functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-advertised-find-file</span> (<span class="type">&amp;optional</span> filename)
  <span class="string">"Handle accesses to file system objects through the user interface.
Includes cases when the user presses return, f or clicks on the path line."</span>
  (interactive)
  (<span class="keyword cl">unless</span> filename
    (<span class="keyword elisp">if</span> (eq 1 (line-number-at-pos)) <span class="comment">;; &lt;- Click or Enter on path line.</span>
        (<span class="keyword elisp">let</span>* ((path (buffer-substring (point) (point-at-eol)))
               (levels (1- (length (split-string path <span class="string">"/"</span>)))))
          (<span class="keyword elisp">if</span> (&lt; 0 levels)
              (sr-dired-prev-subdir levels)
            (sr-beginning-of-buffer)))
      (setq filename (dired-get-filename nil t)
            filename (and filename (expand-file-name filename)))))
  (<span class="keyword elisp">if</span> filename
      (<span class="keyword elisp">if</span> (file-exists-p filename)
          (sr-find-file filename)
        (<span class="warning">error</span> <span class="string">"Sunrise: nonexistent target"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-advertised-execute-file</span> (<span class="type">&amp;optional</span> prefix)
  <span class="string">"Execute the currently selected file in a new subprocess."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">let</span> ((path (dired-get-filename nil t)) (label) (args))
    (<span class="keyword elisp">if</span> path
        (setq label  (file-name-nondirectory path))
      (<span class="warning">error</span> <span class="string">"Sunrise: no executable file on this line"</span>))
    (<span class="keyword cl">unless</span> (and (not (file-directory-p path)) (file-executable-p path))
      (<span class="warning">error</span> <span class="string">"Sunrise: \"%s\" is not an executable file"</span> label))
    (<span class="keyword cl">when</span> prefix
      (setq args (read-string (format <span class="string">"arguments for \"%s\": "</span> label))
            label (format <span class="string">"%s %s"</span> label args)))
    (message <span class="string">"Sunrise: executing \"%s\" in new process"</span> label)
    (<span class="keyword elisp">if</span> args
        (apply #'start-process (append (list <span class="string">"Sunrise Subprocess"</span> nil path)
                                       (split-string args)))
      (start-process <span class="string">"Sunrise Subprocess"</span> nil path))))

(<span class="keyword">defun</span> <span class="function">sr-find-file</span> (filename <span class="type">&amp;optional</span> wildcards)
  <span class="string">"Determine the proper way of handling an object in the file system.
FILENAME can be either a regular file, a regular directory, a
Sunrise VIRTUAL directory, or a virtual directory served by
AVFS."</span>
  (interactive (find-file-read-args <span class="string">"Find file or directory: "</span> nil))
  (<span class="keyword elisp">cond</span> ((file-directory-p filename) (sr-find-regular-directory filename))
        ((and (sr-avfs-directory-p filename) (sr-avfs-dir filename))
         (sr-find-regular-directory (sr-avfs-dir filename)))
        ((sr-virtual-directory-p filename) (sr-find-virtual-directory filename))
        (t (sr-find-regular-file filename wildcards))))

(<span class="keyword">defun</span> <span class="function">sr-virtual-directory-p</span> (filename)
  <span class="string">"Tell whether FILENAME is the path to a Sunrise VIRTUAL directory."</span>
  (eq 'sr-virtual-mode (assoc-default filename auto-mode-alist 'string-match)))

(<span class="keyword">defun</span> <span class="function">sr-avfs-directory-p</span> (filename)
  <span class="string">"Tell whether FILENAME can be seen as the root of an AVFS virtual directory."</span>
  (<span class="keyword elisp">let</span> ((mode (assoc-default filename auto-mode-alist 'string-match)))
    (and sr-avfs-root
         (or (eq 'archive-mode mode)
             (eq 'tar-mode mode)
             (and (listp mode) (eq 'jka-compr (cadr mode)))
             (not (equal <span class="string">"."</span> (sr-assoc-key filename
                                           sr-avfs-handlers-alist
                                           'string-match)))))))

(<span class="keyword">defun</span> <span class="function">sr-find-regular-directory</span> (directory)
  <span class="string">"Visit the given regular directory in the active pane."</span>
  (setq directory (file-name-as-directory directory))
  (<span class="keyword elisp">let</span> ((parent (expand-file-name <span class="string">"../"</span>)))
    (<span class="keyword elisp">if</span> (and (not (sr-equal-dirs parent default-directory))
             (sr-equal-dirs directory parent))
        (sr-dired-prev-subdir)
      (sr-goto-dir directory))))

(<span class="keyword">defun</span> <span class="function">sr-find-virtual-directory</span> (sr-virtual-dir)
  <span class="string">"Visit the given Sunrise VIRTUAL directory in the active pane."</span>
  (sr-save-aspect
   (sr-alternate-buffer (find-file sr-virtual-dir)))
  (sr-history-push sr-virtual-dir)
  (set-visited-file-name nil t)
  (sr-keep-buffer)
  (sr-backup-buffer))

(<span class="keyword">defun</span> <span class="function">sr-find-regular-file</span> (filename <span class="type">&amp;optional</span> wildcards)
  <span class="string">"Deactivate Sunrise and visit FILENAME as a regular file with WILDCARDS.
\(See `<span class="constant important">find-file</span>' for more details on wildcard expansion.)"</span>
  (<span class="keyword elisp">condition-case</span> description
      (<span class="keyword elisp">let</span> ((buff (find-file-noselect filename nil nil wildcards)))
        (sr-save-panes-width)
        (sr-quit)
        (set-window-configuration sr-prior-window-configuration)
        (switch-to-buffer buff))
    (<span class="warning">error</span> (message <span class="string">"%s"</span> (cadr description)))))

(<span class="keyword">defun</span> <span class="function">sr-avfs-dir</span> (filename)
  <span class="string">"Return the virtual path for accessing FILENAME through AVFS.
Returns nil if AVFS cannot manage this kind of file."</span>
  (<span class="keyword elisp">let</span>* ((handler (assoc-default filename sr-avfs-handlers-alist 'string-match))
         (vdir (concat filename handler)))
    (<span class="keyword cl">unless</span> (sr-overlapping-paths-p sr-avfs-root vdir)
      (setq vdir (concat sr-avfs-root vdir)))
    (<span class="keyword elisp">if</span> (file-attributes vdir) vdir nil)))

(<span class="keyword">defun</span> <span class="function">sr-goto-dir</span> (dir)
  <span class="string">"Change the current directory in the active pane to the given one."</span>
  (interactive <span class="string">"DChange directory (file or pattern): "</span>)
  (<span class="keyword elisp">if</span> sr-goto-dir-function
      (funcall sr-goto-dir-function dir)
    (<span class="keyword cl">unless</span> (and (eq major-mode 'sr-mode) (sr-equal-dirs dir default-directory))
      (<span class="keyword elisp">if</span> (and sr-avfs-root
               (null (posix-string-match <span class="string">"#"</span> dir)))
          (setq dir
                (replace-regexp-in-string
                 (directory-file-name (expand-file-name sr-avfs-root)) <span class="string">""</span> dir)))
      (sr-save-aspect
       (sr-within dir (sr-alternate-buffer (dired dir))))
      (sr-history-push default-directory)
      (sr-beginning-of-buffer))))

(<span class="keyword">defun</span> <span class="function">sr-dired-prev-subdir</span> (<span class="type">&amp;optional</span> count)
  <span class="string">"Go to the parent directory, or COUNT subdirectories upwards."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword cl">unless</span> (sr-equal-dirs default-directory <span class="string">"/"</span>)
    (<span class="keyword elisp">let</span>* ((count (or count 1))
           (to (replace-regexp-in-string <span class="string">"x"</span> <span class="string">"../"</span> (make-string count ?x)))
           (from (expand-file-name (substring to 1)))
           (from (sr-directory-name-proper from))
           (from (replace-regexp-in-string <span class="string">"\\(?:#.*/?$\\|/$\\)"</span> <span class="string">""</span> from))
           (to (replace-regexp-in-string <span class="string">"\\.\\./$"</span> <span class="string">""</span> (expand-file-name to))))
      (sr-goto-dir to)
      (<span class="keyword cl">unless</span> (sr-equal-dirs from to)
        (sr-focus-filename from)))))

(<span class="keyword">defun</span> <span class="function">sr-follow-file</span> (<span class="type">&amp;optional</span> target-path)
  <span class="string">"Go to the same directory where the selected file is.
Very useful inside Sunrise VIRTUAL buffers."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (null target-path)
      (setq target-path (dired-get-filename nil t)))

  (<span class="keyword elisp">let</span> ((target-dir (file-name-directory target-path))
        (target-symlink (file-symlink-p target-path))
        (target-file))

    <span class="comment">;; if the target is a symlink and there's nothing more interesting to do</span>
    <span class="comment">;; then follow the symlink:</span>
    (<span class="keyword cl">when</span> (and target-symlink
               (string= target-dir (dired-current-directory))
               (not (eq major-mode 'sr-virtual-mode)))
      (<span class="keyword cl">unless</span> (file-exists-p target-symlink)
        (<span class="warning">error</span> <span class="string">"Sunrise: file is a symlink to a nonexistent target"</span>))
      (setq target-path target-symlink)
      (setq target-dir (file-name-directory target-symlink)))

    (setq target-file (file-name-nondirectory target-path))

    (<span class="keyword cl">when</span> target-dir <span class="comment">;; &lt;-- nil in symlinks to other files in same directory:</span>
      (setq target-dir (sr-chop ?/ target-dir))
      (sr-goto-dir target-dir))
    (sr-focus-filename target-file)))

(<span class="keyword">defun</span> <span class="function">sr-follow-viewer</span> ()
  <span class="string">"Go to the directory of the file displayed in the viewer window."</span>
  (interactive)
  (<span class="keyword cl">when</span> sr-running
    (<span class="keyword elisp">let</span>* ((viewer (sr-viewer-window))
           (viewer-buffer (<span class="keyword elisp">if</span> viewer (window-buffer viewer)))
           (target-dir) (target-file))
      (<span class="keyword cl">when</span> viewer-buffer
        (<span class="keyword elisp">with-current-buffer</span> viewer-buffer
          (setq target-dir default-directory
                target-file (sr-directory-name-proper (buffer-file-name)))))
      (sr-select-window sr-selected-window)
      (<span class="keyword elisp">if</span> target-dir (sr-goto-dir target-dir))
      (<span class="keyword elisp">if</span> target-file (sr-focus-filename target-file)))))

(<span class="keyword">defun</span> <span class="function">sr-project-path</span> ()
  <span class="string">"Find projections of the active directory over the passive one.

Locates interactively all descendants of the directory in the passive pane that
have a path similar to the directory in the active pane.

For instance, if the active pane is displaying directory /a/b/c and the passive
one is displaying /x/y, this command will check for the existence of any of the
following: /x/y/a/b/c, /x/y/b/c, /x/y/c and /x/y. Each (existing) directory
located according to this schema will be known hereafter as a 'projection of the
directory /a/b/c over /x/y'.

If many projections of the active directory over the passive one exist, one can
rotate among all of them by invoking `<span class="constant important">sr-project-path</span>' repeatedly : they will be
visited in order, from longest path to shortest."</span>

  (interactive)
  (<span class="keyword elisp">let</span>* ((sr-synchronized nil)
         (path (sr-chop ?/ (expand-file-name (dired-current-directory))))
         (pos (<span class="keyword elisp">if</span> (&lt; 0 (length path)) 1)) (candidate) (next-key))
    (<span class="keyword elisp">while</span> pos
      (setq candidate (concat sr-other-directory (substring path pos))
            pos (string-match <span class="string">"/"</span> path (1+ pos))
            pos (<span class="keyword elisp">if</span> pos (1+ pos)))
      (<span class="keyword cl">when</span> (and (file-directory-p candidate)
                 (not (sr-equal-dirs sr-this-directory candidate)))
        (sr-goto-dir-other candidate)
        (setq next-key (read-key-sequence <span class="string">"(press C-M-o again for more)"</span>))
        (<span class="keyword elisp">if</span> (eq (lookup-key sr-mode-map next-key) 'sr-project-path)
            (sr-history-prev-other)
          (setq unread-command-events (listify-key-sequence next-key)
                pos nil))))
    (<span class="keyword cl">unless</span> next-key
      (message <span class="string">"Sunrise: sorry, no suitable projections found"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-history-push</span> (element)
  <span class="string">"Push a new path into the history stack of the current pane."</span>
  (<span class="keyword elisp">let</span> ((type (sr-history-entry-type element)))
    (<span class="keyword cl">when</span> type
      (<span class="keyword elisp">let</span>* ((pane (assoc sr-selected-window sr-history-registry))
             (hist (cdr pane))
             (len (length hist)))
        (<span class="keyword elisp">if</span> (&gt;= len sr-history-length)
            (nbutlast hist (- len sr-history-length)))
        (<span class="keyword cl">when</span> (eq 'local type)
          (setq element (abbreviate-file-name (sr-chop ?/ element))))
        (setq hist (delete element hist))
        (push element hist)
        (setcdr pane hist))
      (sr-history-stack-reset))))

(<span class="keyword">defun</span> <span class="function">sr-history-next</span> ()
  <span class="string">"Navigate forward in the history of the active pane."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((side (assoc sr-selected-window sr-history-stack)))
    (<span class="keyword cl">unless</span> (zerop (cadr side))
      (sr-history-move -1))
    (<span class="keyword cl">when</span> (zerop (cadr side))
      (sr-history-stack-reset))))

(<span class="keyword">defun</span> <span class="function">sr-history-prev</span> ()
  <span class="string">"Navigate backwards in the history of the active pane."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((history (cdr (assoc sr-selected-window sr-history-registry)))
        (stack (cdr (assoc sr-selected-window sr-history-stack))))
    (<span class="keyword cl">when</span> (&lt; (abs (cdr stack)) (1- (length history)))
      (sr-history-move 1))))

(<span class="keyword">defun</span> <span class="function">sr-history-move</span> (step)
  <span class="string">"Traverse the history of the active pane in a stack-like fashion.
This function re-arranges the history list of the current pane so as to make it
simulate a stack of directories, from which one can 'pop' the current directory
and 'push' it back, keeping the most recently visited entries always near the
top of the stack."</span>
  (<span class="keyword elisp">let</span>* ((side (assoc sr-selected-window sr-history-stack))
         (depth (cadr side)) (goal) (target-dir))
    (<span class="keyword cl">when</span> (&gt; 0 (* step depth))
      (sr-history-stack-reset))
    (setq goal  (1+ (cddr side))
          depth (* step (+ (abs depth) step))
          target-dir (sr-history-pick goal))
    (<span class="keyword cl">when</span> target-dir
      (sr-goto-dir target-dir)
      (setcdr side (cons depth goal)))))

(<span class="keyword">defun</span> <span class="function">sr-history-stack-reset</span> ()
  <span class="string">"Reset the current history stack counter."</span>
  (<span class="keyword elisp">let</span> ((side (assoc sr-selected-window sr-history-stack)))
    (setcdr side '(0 . 0))))

(<span class="keyword">defun</span> <span class="function">sr-history-pick</span> (position)
  <span class="string">"Return directory at POSITION in current history.
If the entry was removed or made inaccessible since our last visit, remove it
from the history list and check among the previous ones until an accessible
directory is found, or the list runs out of entries."</span>
  (<span class="keyword elisp">let</span>* ((history (cdr (assoc sr-selected-window sr-history-registry)))
         (target (nth position history)))
    (<span class="keyword elisp">while</span> (not (sr-history-entry-type target))
      (delete target history)
      (setq target (nth position history)))
    target))

(<span class="keyword">defun</span> <span class="function">sr-history-entry-type</span> (entry)
  <span class="string">"Determine the type of the given history ENTRY.
Evaluate to: 'tramp if the entry is a valid remote entry, 'local
if the entry represents a directory in the local file system, or
nil if the argument is not a valid history entry."</span>
  (<span class="keyword cl">when</span> entry
    (<span class="keyword elisp">let</span> ((isTramp (string-match tramp-file-name-regexp entry)))
      (<span class="keyword elisp">if</span> isTramp
          'tramp
        (<span class="keyword elisp">if</span> (file-accessible-directory-p entry) 'local)))))

(<span class="keyword">defun</span> <span class="function">sr-history-purge-remote</span>()
  <span class="string">"Remove all remote entries from the history of directories."</span>
  (interactive)
  (mapc
   (<span class="keyword elisp">lambda</span> (side)
     (<span class="keyword elisp">let</span> ((pane (assoc side sr-history-registry))
           (regex tramp-file-name-regexp))
       (setcdr pane (delq nil (mapcar (<span class="keyword elisp">lambda</span> (x)
                                        (and (not (string-match regex x)) x))
                                      (cdr pane))))))
   '(left right)))

(<span class="keyword">defun</span> <span class="function">sr-require-checkpoints-extension</span> (<span class="type">&amp;optional</span> noerror)
  <span class="string">"Bootstrap code for checkpoint support.
Just tries to require the appropriate checkpoints extension
depending on the version of bookmark.el being used."</span>
  (<span class="keyword">require</span> '<span class="constant">bookmark</span> nil t)
  (<span class="keyword elisp">let</span>* ((feature
          (<span class="keyword elisp">cond</span> ((fboundp 'bookmark-make-record) 'sunrise-x-checkpoints)
                (t 'sunrise-x-old-checkpoints)))
         (name (symbol-name feature)))
    (or
     (not (<span class="keyword">featurep</span> '<span class="constant">sunrise-commander</span>))
     (<span class="keyword">require</span> <span class="constant">feature</span> nil t)
     noerror
     (<span class="warning">error</span> <span class="string">"Feature `<span class="constant important">%s</span>' not found!\
For checkpoints to work, download http://joseito.republika.pl/%s.el.gz\
and add it to your `<span class="constant important">load-path</span>'"</span> name name))))

(<span class="keyword">defmacro</span> <span class="function">sr-checkpoint-command</span> (function-name)
  `(<span class="keyword">defun</span> <span class="function"></span>,function-name (<span class="type">&amp;optional</span> arg)
     (interactive)
     (sr-require-checkpoints-extension)
     (<span class="keyword elisp">if</span> (commandp #',function-name)
         (call-interactively #',function-name)
       (funcall #',function-name arg))))
(sr-checkpoint-command sr-checkpoint-save)
(sr-checkpoint-command sr-checkpoint-restore)
(sr-checkpoint-command sr-checkpoint-handler)
<span class="comment">;;;###<span class="warning">autoload</span> (autoload 'sr-checkpoint-handler <span class="string">"sunrise-commander"</span> <span class="string">""</span> t)</span>

(<span class="keyword">defun</span> <span class="function">sr-do-find-marked-files</span> (<span class="type">&amp;optional</span> noselect)
  <span class="string">"Sunrise replacement for `<span class="constant important">dired-do-find-marked-files</span>'."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">let</span>* ((files (delq nil (mapcar (<span class="keyword elisp">lambda</span> (x)
                                    (and (file-regular-p x) x))
                                  (dired-get-marked-files)))))
    (<span class="keyword cl">unless</span> files
      (<span class="warning">error</span> <span class="string">"Sunrise: no regular files to open"</span>))
    (<span class="keyword cl">unless</span> noselect (sr-quit))
    (dired-simultaneous-find-file files noselect)))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Graphical interface interaction functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-detect-switch</span> ()
  <span class="string">"Detect Sunrise pane switches and update tracking state accordingly."</span>
  (<span class="keyword cl">when</span> (and sr-running
             (not sr-inhibit-switch)
             (eq (selected-window) (sr-other 'window)))
    (<span class="keyword elisp">let</span> ((there sr-this-directory))
      (setq sr-selected-window (sr-other)
            sr-selected-window-width nil
            sr-this-directory default-directory
            sr-other-directory there)
      (sr-save-panes-width)
      (sr-highlight))))

(<span class="keyword">defun</span> <span class="function">sr-change-window</span>()
  <span class="string">"Change to the other Sunrise pane."</span>
  (interactive)
  (sr-select-window (sr-other))
  (setq sr-selected-window-width nil))

(<span class="keyword">defun</span> <span class="function">sr-mouse-change-window</span> (e)
  <span class="string">"Change to the Sunrise pane clicked in by the mouse."</span>
  (interactive <span class="string">"e"</span>)
  (mouse-set-point e))

(<span class="keyword">defun</span> <span class="function">sr-mouse-move-cursor</span> (event)
  <span class="string">"Move the cursor to the current mouse position.
This function is called only if the `<span class="constant important">sr-cursor-follows-mouse</span>' custom variable
\(which see) has not been set to nil."</span>
  (interactive <span class="string">"e"</span>)
  (<span class="keyword elisp">if</span> (&lt;= sr-mouse-events-count sr-mouse-events-threshold)
      (setq sr-mouse-events-count (1+ sr-mouse-events-count))
    (<span class="keyword cl">when</span> (mouse-movement-p event)
      (<span class="keyword elisp">let</span> ((mouse-pos (cadadr event))
            (mouse-win (caadr event)))
        (<span class="keyword cl">when</span> (eq mouse-win (sr-other 'window))
          (sr-change-window))
        (<span class="keyword cl">when</span> (numberp mouse-pos)
          (goto-char mouse-pos))))))

(<span class="keyword">defun</span> <span class="function">sr-select-window</span> (side)
  <span class="string">"Select/highlight the given Sunrise window (right or left)."</span>
  (select-window (symbol-value (sr-symbol side 'window))))

(<span class="keyword">defun</span> <span class="function">sr-viewer-window</span> ()
  <span class="string">"Return an active window that can be used as the viewer."</span>
  (<span class="keyword elisp">if</span> (or (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode))
          (memq (current-buffer) (list sr-left-buffer sr-right-buffer)))
      (<span class="keyword elisp">let</span> ((current-window (selected-window)) (target-window))
        (<span class="keyword cl">dotimes</span> (_times 2)
          (setq current-window (next-window current-window))
          (<span class="keyword cl">unless</span> (memq current-window (list sr-left-window sr-right-window))
            (setq target-window current-window)))
        target-window)
    (selected-window)))

(<span class="keyword">defun</span> <span class="function">sr-select-viewer-window</span> (<span class="type">&amp;optional</span> force-setup)
  <span class="string">"Select a window that is not a Sunrise pane.
If no suitable active window can be found and FORCE-SETUP is set,
calls the function `<span class="constant important">sr-setup-windows</span>' and tries once again."</span>
  (interactive <span class="string">"p"</span>)
  (<span class="keyword elisp">let</span> ((selected sr-selected-window)
        (viewer (sr-viewer-window)))
    (<span class="keyword elisp">if</span> (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode))
        (hl-line-mode 1))
    (<span class="keyword elisp">if</span> viewer
        (select-window viewer)
      (<span class="keyword cl">when</span> force-setup
        (sr-setup-windows)
        (select-window (sr-viewer-window))))
    (setq sr-selected-window selected)))

(<span class="keyword">defun</span> <span class="function">sr-beginning-of-buffer</span>()
  <span class="string">"Go to the first directory/file in Dired."</span>
  (interactive)
  (goto-char (point-min))
  (<span class="keyword cl">when</span> (re-search-forward directory-listing-before-filename-regexp nil t)
    (<span class="keyword cl">dotimes</span> (_times 2)
      (<span class="keyword cl">when</span> (looking-at <span class="string">"\.\.?/?$"</span>)
        (dired-next-line 1)))))

(<span class="keyword">defun</span> <span class="function">sr-end-of-buffer</span>()
  <span class="string">"Go to the last directory/file in Dired."</span>
  (interactive)
  (goto-char (point-max))
  (re-search-backward directory-listing-before-filename-regexp)
  (dired-next-line 0))

(<span class="keyword">defun</span> <span class="function">sr-focus-filename</span> (filename)
  <span class="string">"Try to select FILENAME in the current buffer."</span>
  (<span class="keyword elisp">if</span> (and dired-omit-mode
           (string-match (dired-omit-regexp) filename))
      (dired-omit-mode -1))
  (<span class="keyword elisp">let</span> ((sr-inhibit-highlight t)
        (expr (sr-chop ?/ filename)))
    (<span class="keyword elisp">cond</span> ((file-symlink-p filename)
           (setq expr (concat (regexp-quote expr) <span class="string">" -&gt;"</span>)))
          ((file-directory-p filename)
           (setq expr (concat (regexp-quote expr) <span class="string">"\\(?:/\\|$\\)"</span>)))
          ((file-regular-p filename)
           (setq expr (concat (regexp-quote expr) <span class="string">"$"</span>))))
    (setq expr (concat <span class="string">"[0-9] +"</span> expr))
    (beginning-of-line)
    (<span class="keyword cl">unless</span> (re-search-forward expr nil t)
      (re-search-backward expr nil t)))
  (beginning-of-line)
  (re-search-forward directory-listing-before-filename-regexp nil t))

(<span class="keyword">defun</span> <span class="function">sr-split-toggle</span>()
  <span class="string">"Change Sunrise window layout from horizontal to vertical to top and so on."</span>
  (interactive)
  (<span class="keyword cl">case</span> sr-window-split-style
    (horizontal (sr-split-setup 'vertical))
    (vertical (sr-split-setup 'top))
    (top (<span class="keyword elisp">progn</span>
           (sr-split-setup 'horizontal)
           (sr-in-other (revert-buffer))))
    (t (sr-split-setup 'horizontal))))

(<span class="keyword">defun</span> <span class="function">sr-split-setup</span>(split-type)
  (setq sr-window-split-style split-type)
  (<span class="keyword cl">when</span> sr-running
    (<span class="keyword cl">when</span> (eq sr-window-split-style 'top)
      (sr-select-window 'left)
      (delete-window sr-right-window)
      (setq sr-panes-height (window-height)))
    (sr-setup-windows))
  (message <span class="string">"Sunrise: split style changed to \"%s\""</span> (symbol-name split-type)))

(<span class="keyword">defun</span> <span class="function">sr-transpose-panes</span> ()
  <span class="string">"Change the order of the panes."</span>
  (interactive)
  (<span class="keyword cl">unless</span> (eq sr-left-buffer sr-right-buffer)
    (mapc (<span class="keyword elisp">lambda</span> (x)
            (<span class="keyword elisp">let</span> ((left (sr-symbol 'left x)) (right (sr-symbol 'right x)) (tmp))
              (setq tmp (symbol-value left))
              (set left (symbol-value right))
              (set right tmp)))
          '(directory buffer window))
    (<span class="keyword elisp">let</span> ((tmp sr-this-directory))
      (setq sr-this-directory sr-other-directory
            sr-other-directory tmp))
    (<span class="keyword elisp">let</span> ((here sr-selected-window))
      (select-window sr-right-window)
      (sr-setup-visible-panes)
      (sr-select-window here))))

(<span class="keyword">defun</span> <span class="function">sr-synchronize-panes</span> (<span class="type">&amp;optional</span> reverse)
  <span class="string">"Change the directory in the other pane to that in the current one.
If the optional parameter REVERSE is non-nil, performs the
opposite operation, ie. changes the directory in the current pane
to that in the other one."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">let</span> ((target (current-buffer)) (sr-inhibit-highlight t))
    (sr-change-window)
    (<span class="keyword elisp">if</span> reverse
        (setq target (current-buffer))
      (sr-alternate-buffer (switch-to-buffer target))
      (sr-history-push default-directory))
    (sr-change-window)
    (<span class="keyword cl">when</span> reverse
      (sr-alternate-buffer (switch-to-buffer target))
      (sr-history-push default-directory)
      (revert-buffer)))
  (sr-highlight))

(<span class="keyword">defun</span> <span class="function">sr-browse-pane</span> ()
  <span class="string">"Browse the directory in the active pane."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (not (<span class="keyword">featurep</span> '<span class="constant">browse-url</span>))
      (<span class="warning">error</span> <span class="string">"Sunrise: feature `<span class="constant important">browse-url</span>' not available!"</span>)
    (<span class="keyword elisp">let</span> ((url (concat <span class="string">"file://"</span> (expand-file-name default-directory))))
      (message <span class="string">"Browsing directory %s "</span> default-directory)
      (<span class="keyword elisp">if</span> (<span class="keyword">featurep</span> '<span class="constant">w</span>3m)
          (eval '(w3m-goto-url url))
        (browse-url url)))))

(<span class="keyword">defun</span> <span class="function">sr-browse-file</span> (<span class="type">&amp;optional</span> file)
  <span class="string">"Display the selected file in the default web browser."</span>
  (interactive)
  (<span class="keyword cl">unless</span> (<span class="keyword">featurep</span> '<span class="constant">browse-url</span>)
    (<span class="warning">error</span> <span class="string">"ERROR: Feature browse-url not available!"</span>))
  (setq file (or file (dired-get-filename)))
  (sr-save-selected-window
    (sr-select-viewer-window)
    (<span class="keyword elisp">let</span> ((buff (current-buffer)))
      (browse-url (concat <span class="string">"file://"</span> file))
      (<span class="keyword cl">unless</span> (eq buff (current-buffer))
        (sr-scrollable-viewer (current-buffer)))))
  (message <span class="string">"Browsing \"%s\" in web browser"</span> file))

(<span class="keyword">defun</span> <span class="function">sr-revert-buffer</span> (<span class="type">&amp;optional</span> _ignore-auto _no-confirm)
  <span class="string">"Revert the current pane using the contents of the backup buffer (<span class="keyword elisp">if</span> any).
If the buffer is non-virtual the backup buffer is killed."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (buffer-live-p sr-backup-buffer)
      (<span class="keyword elisp">let</span> ((marks (dired-remember-marks (point-min) (point-max)))
            (focus (dired-get-filename 'verbatim t))
            (inhibit-read-only t))
        (erase-buffer)
        (insert-buffer-substring sr-backup-buffer)
        (sr-beginning-of-buffer)
        (dired-mark-remembered marks)
        (<span class="keyword elisp">if</span> focus (sr-focus-filename focus))
        (dired-change-marks ?\t ?*)
        (<span class="keyword elisp">if</span> (eq 'sr-mode major-mode) (sr-kill-backup-buffer)))
    (<span class="keyword cl">unless</span> (or (eq major-mode 'sr-virtual-mode)
                (local-variable-p 'sr-virtual-buffer))
      (dired-revert)
      (<span class="keyword elisp">if</span> (string= <span class="string">"NUMBER"</span> (get sr-selected-window 'sorting-order))
          (sr-sort-by-number t)
        (<span class="keyword elisp">if</span> (get sr-selected-window 'sorting-reverse)
            (sr-reverse-pane)))))
  (sr-display-attributes (point-min) (point-max) sr-show-file-attributes)
  (sr-highlight))

(<span class="keyword">defun</span> <span class="function">sr-kill-pane-buffer</span> ()
  <span class="string">"Kill the buffer currently displayed in the active pane, or quit Sunrise.
Custom variable `<span class="constant important">sr-kill-unused-buffers</span>' controls whether unused buffers are
killed automatically by Sunrise when the user navigates away from the directory
they contain. When this flag is set, all requests to kill the current buffer are
managed by just calling `<span class="constant important">sr-quit</span>'."</span>
  (interactive)
  (<span class="keyword elisp">if</span> sr-kill-unused-buffers
      (sr-quit)
    (kill-buffer (current-buffer))
    (<span class="keyword elisp">let</span> ((_x (pop (cdr (assoc sr-selected-window sr-history-registry)))))
      (sr-history-stack-reset))))

(<span class="keyword">defun</span> <span class="function">sr-quick-view</span> (<span class="type">&amp;optional</span> arg)
  <span class="string">"Quickly view the currently selected item.
On regular files, opens the file in quick-view mode (see `<span class="constant important">sr-quick-view-file</span>'
for more details), on directories, visits the selected directory in the passive
pane, and on symlinks follows the file the link points to in the passive pane.
With optional argument kills the last quickly viewed file without opening a new
buffer."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">if</span> arg
      (sr-quick-view-kill)
    (<span class="keyword elisp">let</span> ((name (dired-get-filename nil t)))
      (<span class="keyword elisp">cond</span> ((file-directory-p name) (sr-quick-view-directory name))
            ((file-symlink-p name) (sr-quick-view-symlink name))
            (t (sr-quick-view-file))))))

(<span class="keyword">defun</span> <span class="function">sr-quick-view-kill</span> ()
  <span class="string">"Kill the last buffer opened using quick view (<span class="keyword elisp">if</span> any)."</span>
  (<span class="keyword elisp">let</span> ((buf other-window-scroll-buffer))
    (<span class="keyword cl">when</span> (and (buffer-live-p buf)
               (or (not sr-confirm-kill-viewer)
                   (y-or-n-p (format <span class="string">"Kill buffer %s? "</span> (buffer-name buf)))))
      (setq other-window-scroll-buffer nil)
      (<span class="keyword elisp">save-window-excursion</span> (kill-buffer buf)))))

(<span class="keyword">defun</span> <span class="function">sr-quick-view-directory</span> (name)
  <span class="string">"Open the directory NAME in the passive pane."</span>
  (<span class="keyword elisp">let</span> ((name (expand-file-name name)))
    (sr-in-other (sr-advertised-find-file name))))

(<span class="keyword">defun</span> <span class="function">sr-quick-view-symlink</span> (name)
  <span class="string">"Follow the target of the symlink NAME in the passive pane."</span>
  (<span class="keyword elisp">let</span> ((name (expand-file-name (file-symlink-p name))))
    (<span class="keyword elisp">if</span> (file-exists-p name)
        (sr-in-other (sr-follow-file name))
      (<span class="warning">error</span> <span class="string">"Sunrise: file is a symlink to a nonexistent target"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-quick-view-file</span> ()
  <span class="string">"Open the selected file on the viewer window without selecting it.
Kills any other buffer opened previously the same way."</span>
  (<span class="keyword elisp">let</span> ((split-width-threshold (* 10 (window-width)))
        (filename (expand-file-name (dired-get-filename nil t))))
    (sr-save-selected-window
      (<span class="keyword elisp">condition-case</span> description
          (<span class="keyword elisp">progn</span>
            (sr-select-viewer-window)
            (find-file filename)
            (<span class="keyword elisp">if</span> (and sr-kill-quick-view-buffers
                     (not (eq (current-buffer) other-window-scroll-buffer))
                     (buffer-live-p other-window-scroll-buffer))
                (kill-buffer other-window-scroll-buffer))
            (sr-scrollable-viewer (current-buffer)))
        (<span class="warning">error</span> (message <span class="string">"%s"</span> (cadr description)))))))

<span class="comment">;; These clean up after a quick view:</span>
(add-hook 'sr-quit-hook (<span class="keyword">defun</span> <span class="function">sr-sr-quit-function</span> ()
                          (setq other-window-scroll-buffer nil)))
(add-hook 'kill-buffer-hook
          (<span class="keyword">defun</span> <span class="function">sr-kill-viewer-function</span> ()
            (<span class="keyword elisp">if</span> (eq (current-buffer) other-window-scroll-buffer)
                (setq other-window-scroll-buffer  nil))))

(<span class="keyword">defun</span> <span class="function">sr-mask-attributes</span> (beg end)
  <span class="string">"Manage the hiding of attributes in region from BEG to END.
Selective hiding of specific attributes can be controlled by customizing the
`<span class="constant important">sr-attributes-display-mask</span>' variable."</span>
  (<span class="keyword elisp">let</span> ((cursor beg) props)
    (cl-labels ((sr-make-display-props
            (display-function-or-flag)
            (<span class="keyword elisp">cond</span> ((functionp display-function-or-flag)
                   `(display
                     ,(apply display-function-or-flag
                             (list (buffer-substring cursor (1- (point)))))))
                  ((null display-function-or-flag) '(invisible t))
                  (t nil))))
      (<span class="keyword elisp">if</span> sr-attributes-display-mask
          (<span class="keyword cl">block</span> block
            (mapc (<span class="keyword elisp">lambda</span> (<span class="keyword cl">do</span>-display)
                    (search-forward-regexp <span class="string">"\\w"</span>)
                    (search-forward-regexp <span class="string">"\\s-"</span>)
                    (forward-char -1)
                    (setq props (sr-make-display-props do-display))
                    (<span class="keyword cl">when</span> props
                      (add-text-properties cursor (point) props))
                    (setq cursor (point))
                    (<span class="keyword elisp">if</span> (&gt;= (point) end) (<span class="keyword cl">return</span>-from block)))
                  sr-attributes-display-mask))
        (<span class="keyword cl">unless</span> (&gt;= cursor end)
          (add-text-properties cursor (1- end) '(invisible t)))))))

(<span class="keyword">defun</span> <span class="function">sr-display-attributes</span> (beg end visiblep)
  <span class="string">"Manage the display of file attributes in the region from BEG to END.
if VISIBLEP is nil then shows file attributes in region, otherwise hides them."</span>
  (<span class="keyword elisp">let</span> ((inhibit-read-only t) (next))
    (<span class="keyword elisp">save-excursion</span>
      (goto-char beg)
      (forward-line -1)
      (<span class="keyword elisp">while</span> (and (null next) (&lt; (point) end))
        (forward-line 1)
        (setq next (dired-move-to-filename)))
      (<span class="keyword elisp">while</span> (and next (&lt; next end))
        (beginning-of-line)
        (forward-char 1)
        (<span class="keyword elisp">if</span> (not visiblep)
            (sr-mask-attributes (point) next)
          (remove-text-properties (point) next '(invisible t))
          (remove-text-properties (point) next '(display)))
        (forward-line 1)
        (setq next (dired-move-to-filename))))))

(<span class="keyword">defun</span> <span class="function">sr-toggle-attributes</span> ()
  <span class="string">"Hide/Show the attributes of all files in the active pane."</span>
  (interactive)
  (setq sr-show-file-attributes (not sr-show-file-attributes))
  (sr-display-attributes (point-min) (point-max) sr-show-file-attributes))

(<span class="keyword">defun</span> <span class="function">sr-toggle-truncate-lines</span> ()
  <span class="string">"Enable/Disable truncation of long lines in the active pane."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (sr-truncate-p)
      (<span class="keyword elisp">progn</span>
        (setq truncate-partial-width-windows (sr-truncate-v nil))
        (message <span class="string">"Sunrise: wrapping long lines"</span>))
    (<span class="keyword elisp">progn</span>
      (setq truncate-partial-width-windows (sr-truncate-v t))
      (message <span class="string">"Sunrise: truncating long lines"</span>)))
  (sr-silently (dired-do-redisplay)))

(<span class="keyword">defun</span> <span class="function">sr-truncate-p</span> ()
  <span class="string">"Return non-nil if `<span class="constant important">truncate-partial-width-windows</span>' affects the current pane.
Used by `<span class="constant important">sr-toggle-truncate-lines</span>'."</span>
  (<span class="keyword elisp">if</span> (numberp truncate-partial-width-windows)
      (&lt; 0 truncate-partial-width-windows)
    truncate-partial-width-windows))

(<span class="keyword">defun</span> <span class="function">sr-truncate-v</span> (active)
  <span class="string">"Return the appropriate value for `<span class="constant important">truncate-partial-width-widows</span>'.
Depends on the Emacs version being used. Used by
`<span class="constant important">sr-toggle-truncate-lines</span>'."</span>
  (or (and (version&lt;= <span class="string">"23"</span> emacs-version)
           (or (and active 3000) 0))
      active))

(<span class="keyword">defun</span> <span class="function">sr-sort-order</span> (label option)
  <span class="string">"Change the sorting order of the active pane.
Appends additional options to `<span class="constant important">dired-listing-switches</span>' and
reverts the buffer."</span>
  (<span class="keyword elisp">if</span> (eq major-mode 'sr-virtual-mode)
      (sr-sort-virtual option)
    (<span class="keyword elisp">let</span> ((option (<span class="keyword elisp">if</span> (= 0 (length option)) option (concat <span class="string">" -"</span> option))))
      (put sr-selected-window 'sorting-order label)
      (put sr-selected-window 'sorting-options option)
      (<span class="keyword elisp">let</span> ((dired-listing-switches dired-listing-switches))
        (<span class="keyword cl">unless</span> (string-match <span class="string">"^/ftp:"</span> default-directory)
          (setq dired-listing-switches sr-listing-switches))
        (dired-sort-other (concat dired-listing-switches option) t))
      (revert-buffer)))
  (message <span class="string">"Sunrise: sorting entries by %s"</span> label))

(<span class="keyword">defmacro</span> <span class="function">sr-defun-sort-by</span> (postfix options)
  <span class="string">"Helper macro for defining `<span class="constant important">sr-sort-by-xxx</span>' functions."</span>
  `(<span class="keyword">defun</span> <span class="function"></span>,(intern (format <span class="string">"sr-sort-by-%s"</span> postfix)) ()
     ,(format <span class="string">"Sorts the contents of the current Sunrise pane by %s."</span> postfix)
     (interactive)
     (sr-sort-order ,(upcase postfix) ,options)))
(sr-defun-sort-by <span class="string">"name"</span> <span class="string">""</span>)
(sr-defun-sort-by <span class="string">"extension"</span> <span class="string">"X"</span>)
(sr-defun-sort-by <span class="string">"time"</span> <span class="string">"t"</span>)
(sr-defun-sort-by <span class="string">"size"</span> <span class="string">"S"</span>)

(<span class="keyword">defun</span> <span class="function">sr-sort-by-number</span> (<span class="type">&amp;optional</span> inhibit-label)
  <span class="string">"Sort the contents of the current Sunrise pane numerically.
Displays entries containing unpadded numbers in a more logical
order than when sorted alphabetically by name."</span>
  (interactive)
  (sr-sort-by-operation 'sr-numerical-sort-op (<span class="keyword cl">unless</span> inhibit-label <span class="string">"NUMBER"</span>))
  (<span class="keyword elisp">if</span> (get sr-selected-window 'sorting-reverse) (sr-reverse-pane)))

(<span class="keyword">defun</span> <span class="function">sr-interactive-sort</span> (order)
  <span class="string">"Prompt for a new sorting order for the active pane and apply it."</span>
  (interactive <span class="string">"cSort by (n)ame, n(u)mber, (s)ize, (t)ime or e(x)tension? "</span>)
  (<span class="keyword elisp">if</span> (&gt;= order 97)
      (setq order (- order 32)))
  (<span class="keyword cl">case</span> order
    (?U (sr-sort-by-number))
    (?T (sr-sort-by-time))
    (?S (sr-sort-by-size))
    (?X (sr-sort-by-extension))
    (t  (sr-sort-by-name))))

(<span class="keyword">defun</span> <span class="function">sr-reverse-pane</span> (<span class="type">&amp;optional</span> interactively)
  <span class="string">"Reverse the contents of the active pane."</span>
  (interactive <span class="string">"p"</span>)
  (<span class="keyword elisp">let</span> ((line (line-number-at-pos))
        (reverse (get sr-selected-window 'sorting-reverse)))
    (sr-sort-by-operation 'identity)
    (<span class="keyword cl">when</span> interactively
      (put sr-selected-window 'sorting-reverse (not reverse))
      (goto-char (point-min)) (forward-line (1- line))
      (re-search-forward directory-listing-before-filename-regexp nil t))))

(<span class="keyword">defun</span> <span class="function">sr-sort-virtual</span> (option)
  <span class="string">"Manage sorting of buffers in Sunrise VIRTUAL mode."</span>
  (<span class="keyword elisp">let</span> ((opt (string-to-char option)) (inhibit-read-only t) (beg) (end))
    (<span class="keyword cl">case</span> opt
      (?X (sr-end-of-buffer)
          (setq end (point-at-eol))
          (sr-beginning-of-buffer)
          (setq beg (point-at-bol))
          (sort-regexp-fields nil <span class="string">"^.*$"</span> <span class="string">"[/.][<span class="negation">^</span>/.]+$"</span> beg end))
      (?t (sr-sort-by-operation
           (<span class="keyword elisp">lambda</span> (x) (sr-attribute-sort-op 5 t x)) <span class="string">"TIME"</span>))
      (?S (sr-sort-by-operation
           (<span class="keyword elisp">lambda</span> (x) (sr-attribute-sort-op 7 t x)) <span class="string">"SIZE"</span>))
      (t (sr-sort-by-operation
          (<span class="keyword elisp">lambda</span> (x) (sr-attribute-sort-op -1 nil x)) <span class="string">"NAME"</span>)))))

(<span class="keyword">defun</span> <span class="function">sr-sort-by-operation</span> (operation <span class="type">&amp;optional</span> label)
  <span class="string">"General function for reordering the contents of a Sunrise pane.
OPERATION is a function that receives a list produced by
`<span class="constant important">sr-build-sort-lists</span>', reorders it in some way, transforming it
into a list that can be passed to `<span class="constant important">sort-reorder</span>', so the records
in the current buffer are reordered accordingly. The LABEL is a
string that will be used to set the sorting order of the current
pane and then displayed in the minibuffer<span class="comment">; if it's not provided</span>
or its value is nil then the ordering enforced by this function
is transient and can be undone by reverting the pane, or by
moving it to a different directory. See `<span class="constant important">sr-numerical-sort-op</span>'
and `<span class="constant important">sr-attribute-sort-op</span>' for examples of OPERATIONs."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((messages (&gt; (- (point-max) (point-min)) 50000))
        (focus (dired-get-filename 'verbatim t))
        (inhibit-read-only t))
    (<span class="keyword elisp">if</span> messages (message <span class="string">"Finding sort keys..."</span>))
    (<span class="keyword elisp">let</span>* ((sort-lists (sr-build-sort-lists))
           (old (reverse sort-lists))
           (beg) (end))
      (<span class="keyword elisp">if</span> messages (message <span class="string">"Sorting records..."</span>))
      (setq sort-lists (apply operation (list sort-lists)))
      (<span class="keyword elisp">if</span> messages (message <span class="string">"Reordering buffer..."</span>))
      (<span class="keyword elisp">save-excursion</span>
        (<span class="keyword elisp">save-restriction</span>
          (sr-end-of-buffer)
          (setq end (point-at-eol))
          (sr-beginning-of-buffer)
          (setq beg (point-at-bol))
          (narrow-to-region beg end)
          (sort-reorder-buffer sort-lists old)))
      (<span class="keyword elisp">if</span> messages (message <span class="string">"Reordering buffer... Done"</span>)))
    (sr-highlight)
    (<span class="keyword elisp">if</span> focus (sr-focus-filename focus))
    (<span class="keyword cl">when</span> label
      (put sr-selected-window 'sorting-order label)
      (message <span class="string">"Sunrise: sorting entries by %s"</span> label)))
  nil)

(<span class="keyword">defun</span> <span class="function">sr-numerical-sort-op</span> (sort-lists)
  <span class="string">"Strategy used to numerically sort contents of a Sunrise pane.
Used by `<span class="constant important">sr-sort-by-operation</span>'. See `<span class="constant important">sr-sort-by-number</span>' for more
on this kind of sorting."</span>
  (mapcar
   'cddr
   (sort
    (sort
     (mapcar
      (<span class="keyword elisp">lambda</span> (x)
        (<span class="keyword elisp">let</span> ((key (buffer-substring-no-properties (car x) (cddr x))))
          (append
           (list key
                 (string-to-number (replace-regexp-in-string <span class="string">"^[<span class="negation">^</span>0-9]*"</span> <span class="string">""</span> key))
                 (cdr x))
           (cdr x))))
      sort-lists)
     (<span class="keyword elisp">lambda</span> (a b) (string&lt; (car a) (car b))))
    (<span class="keyword elisp">lambda</span> (a b) (&lt; (cadr a) (cadr b))))))

(<span class="keyword">defun</span> <span class="function">sr-attribute-sort-op</span> (nth-attr as-number sort-lists)
  <span class="string">"Strategy used to sort contents of a Sunrise pane according to file attributes.
Used by `<span class="constant important">sr-sort-by-operation</span>'. See `<span class="constant important">file-attributes</span>' for a list
of supported attributes and their positions. Directories are
forced to remain always on top. NTH-ATTR is the position of the
attribute to use for sorting, or -1 for the name of the file.
AS-NUMBER determines whether comparisons will be numeric or
alphabetical. SORT-LISTS is a list of positions obtained from
`<span class="constant important">sr-build-sort-lists</span>'."</span>
  (<span class="keyword elisp">let</span> ((attributes (sr-files-attributes))
        (zero (<span class="keyword elisp">if</span> as-number 0 <span class="string">""</span>)))
    (mapcar
     'cddr
     (sort
      (sort
       (mapcar
        (<span class="keyword elisp">lambda</span> (x)
          (<span class="keyword elisp">let</span>* ((key (buffer-substring-no-properties (car x) (cddr x)))
                 (key (sr-chop ?/ (replace-regexp-in-string <span class="string">" -&gt; .*$"</span> <span class="string">""</span> key)))
                 (attrs (assoc-default key attributes))
                 (index))
            (<span class="keyword cl">when</span> attrs
              (setq attrs (apply 'cons attrs)
                    index (or (nth (1+ nth-attr) attrs) zero))
              (append (list (cadr attrs) index (cdr x)) (cdr x)))))
        sort-lists)
       (<span class="keyword elisp">lambda</span> (a b) (sr-compare nth-attr (cadr b) (cadr a))))
      (<span class="keyword elisp">lambda</span> (a b)
        (<span class="keyword elisp">if</span> (and (car a) (car b))
            (sr-compare nth-attr (cadr b) (cadr a))
          (and (car a) (not (stringp (car a))))))))))

(<span class="keyword">defun</span> <span class="function">sr-build-sort-lists</span> ()
  <span class="string">"Analyse contents of the current Sunrise pane for `<span class="constant important">sr-sort-by-operation</span>'.
Builds a list of dotted lists of the form (a b . c) -- where 'a'
is the position at the start of the file name in an entry, while
'b' and 'c' are the start and end positions of the whole entry.
These lists are used by `<span class="constant important">sr-sort-by-operation</span>' to sort the
contents of the pane in arbitrary ways."</span>
  (delq nil
        (mapcar
         (<span class="keyword elisp">lambda</span> (x) (and (atom (car x)) x))
         (<span class="keyword elisp">save-excursion</span>
           (sr-beginning-of-buffer)
           (beginning-of-line)
           (sort-build-lists 'forward-line 'end-of-line 'dired-move-to-filename
                             nil)))))

(<span class="keyword">defun</span> <span class="function">sr-compare</span> (mode a b)
  <span class="string">"General comparison function, used to sort files in VIRTUAL buffers.
MODE must be a number<span class="comment">; if it is less than 0, the direction of the</span>
comparison is inverted: (sr-compare -1 a b) === (sr-compare 1
b a). Compares numbers using `&lt;', strings case-insensitively
using `string&lt;' and lists recursively until the first two
elements that are non-equal are found."</span>
  (<span class="keyword elisp">if</span> (&lt; mode 0) (<span class="keyword elisp">let</span> (tmp) (setq tmp a a b b tmp mode (abs mode))))
  (<span class="keyword elisp">cond</span> ((or (null a) (null b)) nil)
        ((and (listp a) (listp b)) (<span class="keyword elisp">if</span> (= (car a) (car b))
                                       (sr-compare mode (cdr a) (cdr b))
                                     (sr-compare mode (car a) (car b))))
        ((and (stringp a) (stringp b)) (string&lt; (downcase a) (downcase b)))
        ((and (numberp a) (numberp b)) (&lt; a b))
        (t nil)))

(<span class="keyword">defun</span> <span class="function">sr-scroll-up</span> ()
  <span class="string">"Scroll the current pane or (<span class="keyword elisp">if</span> active) the viewer pane 1 line up."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (buffer-live-p other-window-scroll-buffer)
      (sr-save-selected-window
        (sr-select-viewer-window)
        (scroll-up 1))
    (scroll-up 1)))

(<span class="keyword">defun</span> <span class="function">sr-scroll-down</span> ()
  <span class="string">"Scroll the current pane or (<span class="keyword elisp">if</span> active) the viewer pane 1 line down."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (buffer-live-p other-window-scroll-buffer)
      (sr-save-selected-window
        (sr-select-viewer-window)
        (scroll-down 1))
    (scroll-down 1)))

(<span class="keyword">defun</span> <span class="function">sr-scroll-quick-view</span> ()
  <span class="string">"Scroll down the viewer window during a quick view."</span>
  (interactive)
  (<span class="keyword elisp">if</span> other-window-scroll-buffer (scroll-other-window)))

(<span class="keyword">defun</span> <span class="function">sr-scroll-quick-view-down</span> ()
  <span class="string">"Scroll down the viewer window during a quick view."</span>
  (interactive)
  (<span class="keyword elisp">if</span> other-window-scroll-buffer (scroll-other-window-down nil)))

(<span class="keyword">defun</span> <span class="function">sr-undo</span> ()
  <span class="string">"Restore selection as it was before the last file operation."</span>
  (interactive)
  (dired-undo)
  (sr-highlight))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Passive &amp; synchronized navigation functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-sync</span> ()
  <span class="string">"Toggle the Sunrise synchronized navigation feature."</span>
  (interactive)
  (setq sr-synchronized (not sr-synchronized))
  (mapc 'sr-mark-sync (list sr-left-buffer sr-right-buffer))
  (message <span class="string">"Sunrise: sync navigation is now %s"</span> (<span class="keyword elisp">if</span> sr-synchronized <span class="string">"ON"</span> <span class="string">"OFF"</span>))
  (run-hooks 'sr-refresh-hook)
  (sr-in-other (run-hooks 'sr-refresh-hook)))

(<span class="keyword">defun</span> <span class="function">sr-mark-sync</span> (<span class="type">&amp;optional</span> buffer)
  <span class="string">"Change `<span class="constant important">mode-name</span>' depending on whether synchronized navigation is enabled."</span>
  (<span class="keyword elisp">save-window-excursion</span>
    (<span class="keyword elisp">if</span> buffer
        (switch-to-buffer buffer))
    (setq mode-name (concat <span class="string">"Sunrise "</span>
                            (<span class="keyword elisp">if</span> sr-synchronized <span class="string">"SYNC-NAV"</span> <span class="string">"Commander"</span>)))))

<span class="comment">;; This advertises synchronized navigation in all new buffers:</span>
(add-hook 'sr-mode-hook 'sr-mark-sync)

(<span class="keyword">defun</span> <span class="function">sr-next-line-other</span> ()
  <span class="string">"Move the cursor down in the passive pane."</span>
  (interactive)
  (sr-in-other (dired-next-line 1)))

(<span class="keyword">defun</span> <span class="function">sr-prev-line-other</span> ()
  <span class="string">"Move the cursor up in the passive pane."</span>
  (interactive)
  (sr-in-other (dired-next-line -1)))

(<span class="keyword">defun</span> <span class="function">sr-goto-dir-other</span> (dir)
  <span class="string">"Change the current directory in the passive pane to the given one."</span>
  (interactive (list (read-directory-name
                      <span class="string">"Change directory in PASSIVE pane (file or pattern): "</span>
                      sr-other-directory)))
  (sr-in-other (sr-goto-dir dir)))

(<span class="keyword">defun</span> <span class="function">sr-advertised-find-file-other</span> ()
  <span class="string">"Open the file/directory selected in the passive pane."</span>
  (interactive)
  (<span class="keyword elisp">if</span> sr-synchronized
      (<span class="keyword elisp">let</span> ((target (sr-directory-name-proper (dired-get-filename))))
        (sr-change-window)
        (<span class="keyword elisp">if</span> (file-directory-p target)
            (sr-goto-dir (expand-file-name target))
          (<span class="keyword elisp">if</span> (y-or-n-p <span class="string">"Unable to synchronize. Disable sync navigation? "</span>)
              (sr-sync)))
        (sr-change-window)
        (sr-advertised-find-file))
    (sr-in-other (sr-advertised-find-file))))

(<span class="keyword">defun</span> <span class="function">sr-mouse-advertised-find-file</span> (_e)
  <span class="string">"Open the file/directory pointed to by the mouse."</span>
  (interactive <span class="string">"e"</span>)
  (sr-advertised-find-file))

(<span class="keyword">defun</span> <span class="function">sr-prev-subdir-other</span> (<span class="type">&amp;optional</span> count)
  <span class="string">"Go to the previous subdirectory in the passive pane."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">let</span> ((count (or count 1)))
    (sr-in-other (sr-dired-prev-subdir count))))

(<span class="keyword">defun</span> <span class="function">sr-follow-file-other</span> ()
  <span class="string">"Go to the directory of the selected file, but in the passive pane."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((filename (dired-get-filename nil t)))
    (sr-in-other (sr-follow-file filename))))

(<span class="keyword">defun</span> <span class="function">sr-history-prev-other</span> ()
  <span class="string">"Change to previous directory (<span class="keyword elisp">if</span> any) in the passive pane's history list."</span>
  (interactive)
  (sr-in-other (sr-history-prev)))

(<span class="keyword">defun</span> <span class="function">sr-history-next-other</span> ()
  <span class="string">"Change to the next directory (<span class="keyword elisp">if</span> any) in the passive pane's history list."</span>
  (interactive)
  (sr-in-other (sr-history-next)))

(<span class="keyword">defun</span> <span class="function">sr-mark-other</span> (arg)
  <span class="string">"Mark the current (or next ARG) files in the passive pane."</span>
  (interactive <span class="string">"P"</span>)
  (setq arg (or arg 1))
  (sr-in-other (dired-mark arg)))

(<span class="keyword">defun</span> <span class="function">sr-unmark-backward-other</span> (arg)
  (interactive <span class="string">"p"</span>)
  (sr-in-other (dired-unmark-backward arg)))

(<span class="keyword">defun</span> <span class="function">sr-unmark-all-marks-other</span> ()
  <span class="string">"Remove all marks from the passive pane."</span>
  (interactive)
  (sr-in-other (dired-unmark-all-marks)))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Progress feedback functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-progress-prompt</span> (op-name)
  <span class="string">"Build the default progress feedback message."</span>
  (concat <span class="string">"Sunrise: "</span> op-name <span class="string">"... "</span>))

(<span class="keyword">defun</span> <span class="function">sr-make-progress-reporter</span> (op-name totalsize)
  <span class="string">"Make a new Sunrise progress reporter.
Prepends two integers (accumulator and scale) to a standard
progress reporter (built using `<span class="constant important">make-progress-reporter</span>' from
subr.el): accumulator keeps the current state of the reporter,
and scale is used when the absolute value of 100% is bigger than
`<span class="constant important">most-positive-fixnum</span>'."</span>
  (<span class="keyword elisp">let</span> ((accumulator 0) (scale 1) (maxval totalsize))
    (<span class="keyword cl">when</span> (&gt; totalsize most-positive-fixnum)
      (setq scale (/ totalsize most-positive-fixnum))
      (setq maxval most-positive-fixnum))
    (list accumulator scale
          (make-progress-reporter
           (sr-progress-prompt op-name) 0 maxval 0 1 0.5))))

(<span class="keyword">defun</span> <span class="function">sr-progress-reporter-update</span> (reporter size)
  <span class="string">"Update REPORTER (a Sunrise progress reporter) by adding SIZE to its state."</span>
  (<span class="keyword elisp">let</span> ((scale (cadr reporter)))
    (setcar reporter (+ (truncate (/ size scale)) (car reporter)))
    (progress-reporter-update (car (cddr reporter)) (car reporter))))

(<span class="keyword">defun</span> <span class="function">sr-progress-reporter-done</span> (reporter)
  <span class="string">"Print REPORTER's feedback message followed by \"done\" in echo area."</span>
  (progress-reporter-done (car (cddr reporter))))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; File manipulation functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-create-files</span> (<span class="type">&amp;optional</span> qty)
  <span class="string">"Interactively create empty file(s) with the given name or template.
Optional prefix argument specifies the number of files to create.
*NEVER* overwrites existing files. A template may contain one
%-sequence like those used by `<span class="constant important">format</span>', but the only supported
specifiers are: d (decimal), x (hex) or o (octal)."</span>
  (interactive <span class="string">"p"</span>)
  (<span class="keyword elisp">let</span>* ((qty (or (and (integerp qty) (&lt; 0 qty) qty) 1))
         (prompt (<span class="keyword elisp">if</span> (&gt;= 1 qty) <span class="string">"Create file: "</span>
                   (format <span class="string">"Create %d files using template: "</span> qty)))
         (filename (read-file-name prompt)) (name))
    (<span class="keyword elisp">with-temp-buffer</span>
      (<span class="keyword elisp">if</span> (&gt;= 1 qty)
          (<span class="keyword cl">unless</span> (file-exists-p filename) (write-file filename))
        (<span class="keyword cl">unless</span> (string-match <span class="string">"%[0-9]*[dox]"</span> filename)
          (setq filename (concat filename <span class="string">".%d"</span>)))
        (setq filename (replace-regexp-in-string <span class="string">"%\\([<span class="negation">^</span>%]\\)"</span> <span class="string">"%%\\1"</span> filename)
              filename (replace-regexp-in-string
                        <span class="string">"%%\\([0-9]*[dox]\\)"</span> <span class="string">"%\\1"</span> filename))
        (<span class="keyword cl">dotimes</span> (n qty)
          (setq name (format filename (1+ n)))
          (<span class="keyword cl">unless</span> (file-exists-p name) (write-file name)))))
    (sr-revert-buffer)))

(<span class="keyword">defun</span> <span class="function">sr-editable-pane</span> ()
  <span class="string">"Put the current pane in File Names Editing mode (`<span class="constant important">wdired-mode</span>')."</span>
  (interactive)
  (sr-graphical-highlight 'sr-editing-path-face)
  (<span class="keyword elisp">let</span>* ((was-virtual (eq major-mode 'sr-virtual-mode))
         (major-mode 'dired-mode))
    (wdired-change-to-wdired-mode)
    (<span class="keyword elisp">if</span> was-virtual
        (set (make-local-variable 'sr-virtual-buffer) t)))
  (run-hooks 'sr-refresh-hook))

(<span class="keyword">defun</span> <span class="function">sr-readonly-pane</span> (as-virtual)
  <span class="string">"Put the current pane back in Sunrise mode."</span>
  (<span class="keyword cl">when</span> as-virtual
    (sr-virtual-mode)
    (sr-force-passive-highlight t))
  (dired-build-subdir-alist)
  (sr-revert-buffer))

(<span class="keyword">defmacro</span> <span class="function">sr-protect-terminate-wdired</span> (<span class="type">&amp;rest</span> body)
  <span class="string">"Compile the `<span class="constant important">cl-letf</span>' forms used in `<span class="constant important">sr-terminate-wdired</span>'.
This macro allows interpreted code to work without requiring
cl-macs at runtime."</span>
  `(cl-letf (((symbol-function 'yes-or-no-p) (<span class="keyword elisp">lambda</span> (prompt) (ignore)))
          ((symbol-function 'revert-buffer)
           (<span class="keyword elisp">lambda</span> (<span class="type">&amp;optional</span> ignore-auto noconfirm preserve-modes))
           (ignore)))
     ,@body))

(<span class="keyword">defun</span> <span class="function">sr-terminate-wdired</span> (fun)
  <span class="string">"Restore the current pane's original mode after editing with WDired."</span>
  (ad-add-advice
   fun
   (ad-make-advice
    (intern (concat <span class="string">"sr-advice-"</span> (symbol-name fun))) nil t
    `(advice
      lambda ()
      (<span class="keyword elisp">if</span> (not sr-running)
          ad-do-it
        (<span class="keyword elisp">let</span> ((was-virtual (local-variable-p 'sr-virtual-buffer))
              (saved-point (point)))
          (sr-save-aspect
           (setq major-mode 'wdired-mode)
           (sr-protect-terminate-wdired ad-do-it)
           (sr-readonly-pane was-virtual)
           (goto-char saved-point))
          (sr-unhighlight 'sr-editing-path-face)))))
   'around 'last)
  (ad-activate fun nil))
(sr-terminate-wdired 'wdired-finish-edit)
(sr-terminate-wdired 'wdired-abort-changes)

(<span class="keyword">defun</span> <span class="function">sr-do-copy</span> ()
  <span class="string">"Copy selected files and directories recursively to the passive pane."</span>
  (interactive)
  (<span class="keyword elisp">let</span>* ((items (dired-get-marked-files nil))
         (vtarget (sr-virtual-target))
         (target (or vtarget sr-other-directory))
         (progress))
    (<span class="keyword elisp">if</span> (and (not vtarget) (sr-equal-dirs default-directory sr-other-directory))
        (dired-do-copy)
      (<span class="keyword cl">when</span> (sr-ask <span class="string">"Copy"</span> target items #'y-or-n-p)
        (<span class="keyword elisp">if</span> vtarget
            (<span class="keyword elisp">progn</span>
              (sr-copy-virtual)
              (message <span class="string">"Done: %d items(s) copied"</span> (length items)))
          (<span class="keyword elisp">progn</span>
            (setq progress (sr-make-progress-reporter
                            <span class="string">"copying"</span> (sr-files-size items)))
            (sr-clone items target #'copy-file progress ?C)
            (sr-progress-reporter-done progress)))
        (sr-silently (dired-unmark-all-marks))))))

(<span class="keyword">defun</span> <span class="function">sr-do-symlink</span> ()
  <span class="string">"Symlink selected files or directories from one pane to the other."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (sr-equal-dirs default-directory sr-other-directory)
      (dired-do-symlink)
    (sr-link #'make-symbolic-link <span class="string">"Symlink"</span> dired-keep-marker-symlink)))

(<span class="keyword">defun</span> <span class="function">sr-do-relsymlink</span> ()
  <span class="string">"Symlink selected files or directories from one pane to the other relatively.
See `<span class="constant important">dired-make-relative-symlink</span>'."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (sr-equal-dirs default-directory sr-other-directory)
      (dired-do-relsymlink)
    (sr-link #'dired-make-relative-symlink
             <span class="string">"RelSymLink"</span>
             dired-keep-marker-relsymlink)))

(<span class="keyword">defun</span> <span class="function">sr-do-hardlink</span> ()
  <span class="string">"Same as `<span class="constant important">dired-do-hardlink</span>', but refuse to hardlink files to VIRTUAL buffers."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (sr-virtual-target)
      (<span class="warning">error</span> <span class="string">"Cannot hardlink files to a VIRTUAL buffer, try (C)opying instead"</span>)
    (dired-do-hardlink)))

(<span class="keyword">defun</span> <span class="function">sr-do-rename</span> ()
  <span class="string">"Move selected files and directories recursively from one pane to the other."</span>
  (interactive)
  (<span class="keyword cl">when</span> (sr-virtual-target)
    (<span class="warning">error</span> <span class="string">"Cannot move files to a VIRTUAL buffer, try (C)opying instead"</span>))
  (<span class="keyword elisp">if</span> (sr-equal-dirs default-directory sr-other-directory)
      (dired-do-rename)
    (<span class="keyword elisp">let</span> ((marked (dired-get-marked-files)))
      (<span class="keyword cl">when</span> (sr-ask <span class="string">"Move"</span> sr-other-directory marked #'y-or-n-p)
        (<span class="keyword elisp">let</span> ((names (mapcar #'file-name-nondirectory marked))
              (progress (sr-make-progress-reporter <span class="string">"renaming"</span> (length marked)))
              (inhibit-read-only t))
          (sr-in-other
           (<span class="keyword elisp">progn</span>
             (sr-move-files marked default-directory progress)
             (revert-buffer)
             (<span class="keyword cl">when</span> (eq major-mode 'sr-mode)
               (dired-mark-remembered
                (mapcar (<span class="keyword elisp">lambda</span> (x) (cons (expand-file-name x) ?R)) names))
               (sr-focus-filename (car names)))))
          (sr-progress-reporter-done progress))
        (sr-silently (revert-buffer))))))

(<span class="keyword">defun</span> <span class="function">sr-do-delete</span> ()
  <span class="string">"Remove selected files from the file system."</span>
  (interactive)
  (<span class="keyword elisp">let</span>* ((files (dired-get-marked-files))
         (mode (sr-ask <span class="string">"Delete"</span> nil files #'sr-y-n-or-a-p))
         (deletion-mode (<span class="keyword elisp">cond</span> ((eq mode 'ALWAYS) 'always)
                              (mode 'top)
                              (t (<span class="warning">error</span> <span class="string">"(No deletions performed)"</span>)))))
    (mapc (<span class="keyword elisp">lambda</span> (x)
            (message <span class="string">"Deleting %s"</span> x)
            (dired-delete-file x deletion-mode)) files)
    (<span class="keyword elisp">if</span> (eq major-mode 'sr-virtual-mode)
        (dired-do-kill-lines)
      (revert-buffer))))

(<span class="keyword">defun</span> <span class="function">sr-do-flagged-delete</span> ()
  <span class="string">"Remove flagged files from the file system."</span>
  (interactive)
  (<span class="keyword elisp">let</span>* ((dired-marker-char dired-del-marker)
         (regexp (dired-marker-regexp)) )
    (<span class="keyword elisp">if</span> (<span class="keyword elisp">save-excursion</span> (goto-char (point-min))
                        (re-search-forward regexp nil t))
        (sr-do-delete)
      (message <span class="string">"(No deletions requested)"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-do-clone-prompt</span> (<span class="type">&amp;optional</span> is-fs)
  <span class="string">"Prompt for the criteria to use when performing a clone operation."</span>
  (<span class="keyword elisp">let</span>* ((menu <span class="string">"(D)irectories only, (C)opies, (H)ardlinks, (S)ymlinks or (R)elative symlinks? "</span>)
         (maybe-fs (and (sr-virtual-source) (not (sr-virtual-target))))
         (prompt (<span class="keyword elisp">cond</span> (is-fs (concat <span class="string">"Clone as file system of: "</span> menu))
                       (maybe-fs (concat <span class="string">"Clone as: (F)ile System of: "</span> menu))
                       (t (concat <span class="string">"Clone as: "</span> menu))))
         (resp (read-event prompt)))

    (<span class="keyword elisp">cond</span> ((and maybe-fs (memq resp '(?f ?F))) (sr-do-clone-prompt t))
          ((not (memq resp '(?d ?D ?c ?C ?h ?H ?s ?S ?r ?R))) (sr-do-clone-prompt))
          (is-fs (list resp ?t))
          (t (list resp)))))

(<span class="keyword">defun</span> <span class="function">sr-do-clone</span> (<span class="type">&amp;optional</span> mode is-fs)
  <span class="string">"Clone all selected items recursively into the passive pane."</span>
  (interactive (sr-do-clone-prompt))

  (<span class="keyword elisp">if</span> (sr-virtual-target)
      (<span class="warning">error</span> <span class="string">"Cannot clone into a VIRTUAL buffer, try (C)opying instead"</span>))
  (<span class="keyword elisp">if</span> (sr-equal-dirs default-directory sr-other-directory)
      (<span class="warning">error</span> <span class="string">"Cannot clone inside one single directory, please select a\
 different one in the passive pane"</span>))

  (<span class="keyword elisp">let</span> ((target sr-other-directory) clone-op items progress)
    (<span class="keyword elisp">if</span> (and mode (&gt;= mode 97)) (setq mode (- mode 32)))
    (setq clone-op
          (<span class="keyword cl">case</span> mode
            (?D nil)
            (?C #'copy-file)
            (?H #'add-name-to-file)
            (?S #'make-symbolic-link)
            (?R #'dired-make-relative-symlink)
            (t (<span class="warning">error</span> <span class="string">"Invalid cloning mode: %c"</span> mode))))
    (setq items (dired-get-marked-files nil))
    (setq progress (sr-make-progress-reporter
                    <span class="string">"cloning"</span> (sr-files-size items)))
    (<span class="keyword elisp">if</span> is-fs
        (sr-clone-fs (dired-get-marked-files t) target clone-op progress)
      (sr-clone (dired-get-marked-files nil) target clone-op progress ?K))
    (dired-unmark-all-marks)
    (message <span class="string">"Done: %d items(s) dispatched"</span> (length items))))

(<span class="keyword">defun</span> <span class="function">sr-fast-backup-files</span> ()
  <span class="string">"Make backup copies of all marked files inside the same directory.
The extension to append to each filename can be controlled by
setting the value of the `<span class="constant important">sr-fast-backup-extension</span>' custom
variable. Directories are not copied."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((extension (<span class="keyword elisp">if</span> (listp sr-fast-backup-extension)
                       (eval sr-fast-backup-extension)
                     sr-fast-backup-extension)))
    (dired-do-copy-regexp <span class="string">"$"</span> extension))
  (revert-buffer))

(<span class="keyword">defun</span> <span class="function">sr-clone-fs</span> (items target clone-op progress)
  <span class="string">"Clone all the given ITEMS (paths to files and/or directories)
recursively to TARGET (a directory), but keeping the directory
structure given by every path in ITEMS. CLONE-OP is the cloning
operation and PROGRESS is the progress monitor."</span>
  (mapc (<span class="keyword elisp">lambda</span> (i)
          (<span class="keyword elisp">let</span>* ((from (expand-file-name i))
                 (to (concat (directory-file-name target) <span class="string">"/"</span>
                             (or (file-name-directory i) <span class="string">""</span>))))
            (<span class="keyword cl">unless</span> (file-exists-p to)
              (make-directory to t))
            (sr-clone (list from) to clone-op progress nil)))
        items))

(<span class="keyword">defun</span> <span class="function">sr-clone</span> (items target clone-op progress mark-char)
  <span class="string">"Clone all the given ITEMS (files and directories) recursively
to TARGET (a directory) using CLONE-OP as the cloning operation
and reporting progress to the given PROGRESS monitor. Finally,
mark all resulting artifacts with the MARK-CHAR mark."</span>
  (<span class="keyword elisp">let</span> ((names (mapcar #'file-name-nondirectory items))
        (inhibit-read-only t))
    (<span class="keyword elisp">with-current-buffer</span> (sr-other 'buffer)
      (sr-clone-files items target clone-op progress))
    (<span class="keyword cl">when</span> (window-live-p (sr-other 'window))
      (sr-in-other
       (<span class="keyword elisp">progn</span>
         (revert-buffer)
         (<span class="keyword cl">when</span> (and mark-char (memq major-mode '(sr-mode sr-virtual-mode)))
           (dired-mark-remembered
            (mapcar (<span class="keyword elisp">lambda</span> (x) (cons (expand-file-name x) mark-char)) names))
           (sr-focus-filename (car names))))))))

(<span class="keyword">defun</span> <span class="function">sr-clone-files</span> (file-paths target-dir clone-op progress
                                  <span class="type">&amp;optional</span> do-overwrite)
  <span class="string">"Clone all files in FILE-PATHS to TARGET-DIR using CLONE-OP to
clone the files. FILE-PATHS should be a list of absolute paths."</span>
  (setq target-dir (replace-regexp-in-string <span class="string">"/?$"</span> <span class="string">"/"</span> target-dir))
  (mapc
   (function
    (<span class="keyword elisp">lambda</span> (f)
      (sr-progress-reporter-update progress (nth 7 (file-attributes f)))
      (<span class="keyword elisp">let</span>* ((name (file-name-nondirectory f))
             (target-file (concat target-dir name))
             (symlink-to (file-symlink-p (sr-chop ?/ f)))
             (clone-args (list f target-file t)))
        (<span class="keyword elisp">cond</span>
         (symlink-to
          (<span class="keyword elisp">progn</span>
            (<span class="keyword elisp">if</span> (file-exists-p symlink-to)
                (setq symlink-to (expand-file-name symlink-to)))
            (make-symbolic-link symlink-to target-file do-overwrite)))

         ((file-directory-p f)
          (<span class="keyword elisp">let</span> ((initial-path (file-name-directory f)))
            (<span class="keyword cl">unless</span> (file-symlink-p initial-path)
              (sr-clone-directory
               initial-path name target-dir clone-op progress do-overwrite))))

         (clone-op
          <span class="comment">;; (message <span class="string">"[[Cloning: %s =&gt; %s]]"</span> f target-file)</span>
          (<span class="keyword elisp">if</span> (eq clone-op 'copy-file)
              (setq clone-args
                    (append clone-args (list dired-copy-preserve-time))))
          (<span class="keyword elisp">if</span> (file-exists-p target-file)
              (<span class="keyword elisp">if</span> (or (eq do-overwrite 'ALWAYS)
                      (setq do-overwrite (sr-ask-overwrite target-file)))
                  (apply clone-op clone-args))
            (apply clone-op clone-args)))))))
   file-paths))

(<span class="keyword">defun</span> <span class="function">sr-clone-directory</span> (in-dir d to-dir clone-op progress do-overwrite)
  <span class="string">"Clone directory IN-DIR/D and all its files recursively to TO-DIR.
IN-DIR/D =&gt; TO-DIR/D using CLONE-OP to clone the files."</span>
  (setq d (replace-regexp-in-string <span class="string">"/?$"</span> <span class="string">"/"</span> d))
  (<span class="keyword elisp">if</span> (string= <span class="string">""</span> d)
      (setq to-dir (concat to-dir (sr-directory-name-proper in-dir))))
  (<span class="keyword elisp">let</span>* ((files-in-d (sr-list-of-contents (concat in-dir d)))
         (file-paths-in-d
          (mapcar (<span class="keyword elisp">lambda</span> (f) (concat in-dir d f)) files-in-d)))
    (<span class="keyword cl">unless</span> (file-exists-p (concat to-dir d))
      (make-directory (concat to-dir d)))
    (sr-clone-files file-paths-in-d (concat to-dir d) clone-op progress do-overwrite)))

(<span class="keyword">defsubst</span> <span class="function">sr-move-op</span> (file target-dir progress do-overwrite)
  <span class="string">"Helper function used by `<span class="constant important">sr-move-files</span>' to rename files and directories."</span>
  (<span class="keyword elisp">condition-case</span> nil
      (dired-rename-file file target-dir do-overwrite)
    (<span class="warning">error</span>
     (sr-clone-directory file <span class="string">""</span> target-dir 'copy-file progress do-overwrite)
     (dired-delete-file file 'always))))

(<span class="keyword">defun</span> <span class="function">sr-move-files</span> (file-path-list target-dir progress <span class="type">&amp;optional</span> do-overwrite)
  <span class="string">"Move all files in FILE-PATH-LIST (list of full paths) to TARGET-DIR."</span>
  (mapc
   (function
    (<span class="keyword elisp">lambda</span> (f)
      (<span class="keyword elisp">if</span> (file-directory-p f)
          (<span class="keyword elisp">progn</span>
            (setq f (replace-regexp-in-string <span class="string">"/?$"</span> <span class="string">"/"</span> f))
            (sr-progress-reporter-update progress 1)
            (sr-move-op f target-dir progress do-overwrite))
        (<span class="keyword elisp">let</span>* ((name (file-name-nondirectory f))
               (target-file (concat target-dir name)))
          <span class="comment">;; (message <span class="string">"Renaming: %s =&gt; %s"</span> f target-file)</span>
          (sr-progress-reporter-update progress 1)
          (<span class="keyword elisp">if</span> (file-exists-p target-file)
              (<span class="keyword elisp">if</span> (or (eq do-overwrite 'ALWAYS)
                      (setq do-overwrite (sr-ask-overwrite target-file)))
                  (dired-rename-file f target-file t))
            (dired-rename-file f target-file t)) ))))
   file-path-list))

(<span class="keyword">defun</span> <span class="function">sr-link</span> (creator action marker)
  <span class="string">"Helper function for implementing `<span class="constant important">sr-do-symlink</span>' and `<span class="constant important">sr-do-relsymlink</span>'."</span>
  (<span class="keyword elisp">if</span> (sr-virtual-target)
      (<span class="warning">error</span> <span class="string">"Cannot link files to a VIRTUAL buffer, try (C)opying instead."</span>)
    (dired-create-files creator action (dired-get-marked-files nil)
                        (<span class="keyword elisp">lambda</span> (from)
                          (setq from (sr-chop ?/ from))
                          (<span class="keyword elisp">if</span> (file-directory-p from)
                              (setq from (sr-directory-name-proper from))
                            (setq from (file-name-nondirectory from)))
                          (expand-file-name from sr-other-directory))
                        marker)))

(<span class="keyword">defun</span> <span class="function">sr-inplace</span> ()
  <span class="string">"Allow to select an in-place operation and execute it.
In-place operations are file operations that are executed in the
context of the current pane, totally ignoring the other one."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((mode (read-char <span class="string">"In-place: (C)opy, (R)ename, (H)ardlink, (S)ymlink"</span>)))
    (<span class="keyword elisp">if</span> (and mode (&gt;= mode 97)) (setq mode (- mode 32)))
    (<span class="keyword cl">case</span> mode
      (?C (sr-inplace-do #'copy-file <span class="string">"Copy in place to"</span>))
      (?R (sr-inplace-do #'rename-file <span class="string">"Rename in place to"</span>))
      (?H (sr-inplace-do #'add-name-to-file <span class="string">"Add name in place"</span>))
      (?S (sr-inplace-do #'make-symbolic-link <span class="string">"Link in place to"</span>))
      (t (sr-inplace)))))

(<span class="keyword">defun</span> <span class="function">sr-inplace-do</span> (action prompt)
  <span class="string">"Perform the given ACTION in the context of the current pane.
The given PROMPT will be displayed to the user interactively."</span>
  (<span class="keyword elisp">let</span>* ((marked (dired-get-marked-files))
         (prompt (concat prompt <span class="string">": "</span>))
         (target
          (<span class="keyword elisp">if</span> (cdr marked)
              (read-directory-name prompt)
            (read-file-name
             prompt nil nil nil (file-name-nondirectory (car marked)) #'ignore)))
         (progress (sr-make-progress-reporter <span class="string">"working"</span> (length marked)))
         (inhibit-read-only t))

    (<span class="keyword cl">when</span> (&lt; 1 (length marked))
      (<span class="keyword elisp">if</span> (file-exists-p target)
          (<span class="keyword cl">unless</span> (file-directory-p target)
            (<span class="warning">error</span> <span class="string">"Sunrise: Multiple selection, but target is not a directory"</span>))
        (<span class="keyword elisp">if</span> (y-or-n-p (format <span class="string">"Directory %s does not exit. Create? "</span> target))
            (make-directory target t)
          (<span class="warning">error</span> <span class="string">"Sunrise: Unable to proceed - aborting"</span>))))

    (mapc (<span class="keyword elisp">lambda</span> (x)
            (<span class="keyword elisp">if</span> (and (not (equal (expand-file-name x) (expand-file-name target)))
                     (or (not (file-exists-p target))
                         (file-directory-p target)
                         (y-or-n-p (format <span class="string">"File %s exists. OK to overwrite? "</span>
                                           target))))
                (funcall action x target t)))
          marked)
    (revert-buffer)
    (sr-progress-reporter-done progress)))

(<span class="keyword">defun</span> <span class="function">sr-virtual-source</span> ()
  <span class="string">"if the active pane is in VIRTUAL mode, return its name as a string.
Otherwise return nil."</span>
  (<span class="keyword elisp">if</span> (eq major-mode 'sr-virtual-mode)
      (or (buffer-file-name) <span class="string">"Sunrise VIRTUAL buffer"</span>)
    nil))

(<span class="keyword">defun</span> <span class="function">sr-virtual-target</span> ()
  <span class="string">"If the passive pane is in VIRTUAL mode, return its name as a string.
Otherwise return nil."</span>
  (<span class="keyword elisp">save-window-excursion</span>
    (switch-to-buffer (sr-other 'buffer))
    (sr-virtual-source)))

(<span class="keyword">defun</span> <span class="function">sr-copy-virtual</span> ()
  <span class="string">"Manage copying of files or directories to buffers in VIRTUAL mode."</span>
  (<span class="keyword elisp">let</span> ((fileset (dired-get-marked-files nil))
        (inhibit-read-only t) (beg))
    (sr-change-window)
    (goto-char (point-max))
    (setq beg (point))
    (mapc (<span class="keyword elisp">lambda</span> (file)
            (insert-char 32 2)
            (setq file (dired-make-relative file default-directory)
                  file (sr-chop ?/ file))
            (insert-directory file sr-virtual-listing-switches))
          fileset)
    (sr-display-attributes beg (point-at-eol) sr-show-file-attributes)
    (<span class="keyword elisp">unwind-protect</span>
        (delete-region (point) (line-end-position))
      (<span class="keyword elisp">progn</span>
        (sr-change-window)
        (dired-unmark-all-marks)))))

(<span class="keyword">defun</span> <span class="function">sr-ask</span> (prompt target files function)
  <span class="string">"Use FUNCTION to ask whether to do PROMPT on FILES with TARGET as destination."</span>
  (<span class="keyword elisp">if</span> (and files (listp files))
      (<span class="keyword elisp">let</span>* ((len (length files))
             (msg (<span class="keyword elisp">if</span> (&lt; 1 len)
                      (format <span class="string">"* [%d items]"</span> len)
                    (file-name-nondirectory (car files)))))
        (<span class="keyword elisp">if</span> target
            (setq msg (format <span class="string">"%s to %s"</span> msg target)))
        (funcall function (format <span class="string">"%s %s? "</span> prompt msg)))))

(<span class="keyword">defun</span> <span class="function">sr-ask-overwrite</span> (file-name)
  <span class="string">"Ask whether to overwrite the given FILE-NAME."</span>
  (sr-y-n-or-a-p (format <span class="string">"File %s exists. OK to overwrite? "</span> file-name)))

(<span class="keyword">defun</span> <span class="function">sr-y-n-or-a-p</span> (prompt)
  <span class="string">"Ask the user with PROMPT for an answer y/n/a ('a' stands for 'always').
Returns t if the answer is y/Y, nil if the answer is n/N or the
symbol `<span class="constant important">ALWAYS</span>' if the answer is a/A."</span>
  (setq prompt (concat prompt <span class="string">"([y]es, [n]o or [a]lways)"</span>))
  (<span class="keyword elisp">let</span> ((resp -1))
    (<span class="keyword elisp">while</span> (not (memq resp '(?y ?Y ?n ?N ?a ?A)))
      (setq resp (read-event prompt))
      (setq prompt <span class="string">"Please answer [y]es, [n]o or [a]lways "</span>))
    (<span class="keyword elisp">if</span> (&gt;= resp 97)
        (setq resp (- resp 32)))
    (<span class="keyword cl">case</span> resp
      (?Y t)
      (?A 'ALWAYS)
      (t nil))))

(<span class="keyword">defun</span> <span class="function">sr-overlapping-paths-p</span> (dir1 dir2)
  <span class="string">"Return non-nil if directory DIR2 is located inside directory DIR1."</span>
  (<span class="keyword cl">when</span> (and dir1 dir2)
    (setq dir1 (expand-file-name (file-name-as-directory dir1))
          dir2 (expand-file-name dir2))
    (<span class="keyword elisp">if</span> (&gt;= (length dir2) (length dir1))
        (equal (substring dir2 0 (length dir1)) dir1)
      nil)))

(<span class="keyword">defun</span> <span class="function">sr-list-of-contents</span> (dir)
  <span class="string">"Return the list of all files in DIR as a list of strings."</span>
  (sr-filter (function (<span class="keyword elisp">lambda</span> (x) (not (string-match <span class="string">"\\.\\.?/?$"</span> x))))
             (directory-files dir)))

(<span class="keyword">defun</span> <span class="function">sr-list-of-directories</span> (dir)
 <span class="string">"Return the list of directories in DIR as a list of strings.
The list does not include the current directory and the parent directory."</span>
 (<span class="keyword elisp">let</span> ((result (sr-filter (function (<span class="keyword elisp">lambda</span> (x)
                                      (file-directory-p (concat dir <span class="string">"/"</span> x))))
                          (sr-list-of-contents dir))))
   (mapcar (<span class="keyword elisp">lambda</span> (x) (concat x <span class="string">"/"</span>)) result)))

(<span class="keyword">defun</span> <span class="function">sr-list-of-files</span> (dir)
  <span class="string">"Return the list of regular files in DIR as a list of strings.
Broken links are *not* considered regular files."</span>
  (sr-filter
   (function (<span class="keyword elisp">lambda</span> (x) (file-regular-p (concat dir <span class="string">"/"</span> x))))
   (sr-list-of-contents dir)))

(<span class="keyword">defun</span> <span class="function">sr-filter</span> (p x)
  <span class="string">"Return the elements of the list X that satisfy the predicate P."</span>
  (<span class="keyword elisp">let</span> ((res-list nil))
    (<span class="keyword elisp">while</span> x
      (<span class="keyword elisp">if</span> (apply p (list (car x)))
          (setq res-list (cons (car x) res-list)))
      (setq x (cdr x)))
    (reverse res-list)))

(<span class="keyword">defun</span> <span class="function">sr-directory-name-proper</span> (file-path)
  <span class="string">"Return the proper name of the directory FILE-PATH, without initial path."</span>
  (<span class="keyword elisp">if</span> file-path
      (<span class="keyword elisp">let</span> (
            (file-path-1 (substring file-path 0 (- (length file-path) 1)))
            (lastchar (substring file-path (- (length file-path) 1)))
            )
        (concat (file-name-nondirectory file-path-1) lastchar))))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Directory and file comparison functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-compare-panes</span> ()
  <span class="string">"Compare the contents of Sunrise panes."</span>
  (interactive)
  (<span class="keyword elisp">let</span>* ((file-alist1 (sr-files-attributes))
         (other (sr-other 'buffer))
         (file-alist2 (<span class="keyword elisp">with-current-buffer</span> other (sr-files-attributes)))
         (progress
          (sr-make-progress-reporter
           <span class="string">"comparing"</span> (+ (length file-alist1) (length file-alist2))))
         (predicate `(<span class="keyword elisp">prog1</span> ,(sr-ask-compare-panes-predicate)
                            (sr-progress-reporter-update ',progress 1)))
         (file-list1 (mapcar 'cadr (dired-file-set-difference
                                    file-alist1 file-alist2 predicate)))
         (file-list2 (mapcar 'cadr (dired-file-set-difference
                                    file-alist2 file-alist1 predicate))))
    (sr-md5 nil)
    (dired-mark-if (member (dired-get-filename nil t) file-list1) nil)
    (<span class="keyword elisp">with-current-buffer</span> other
      (dired-mark-if (member (dired-get-filename nil t) file-list2) nil))
    (message <span class="string">"Marked in pane1: %s files, in pane2: %s files"</span>
             (length file-list1)
             (length file-list2))
    (sit-for 0.2)))

(<span class="keyword">defun</span> <span class="function">sr-ask-compare-panes-predicate</span> ()
  <span class="string">"Prompt for the criterion to use for comparing the contents of the panes."</span>
  (<span class="keyword elisp">let</span> ((prompt <span class="string">"Compare by (<span class="keyword cl">d</span>)ate, (s)ize, date_(a)nd_size, (n)ame \
or (c)ontents? "</span>)
        (response -1))
    (<span class="keyword elisp">while</span> (not (memq response '(?d ?D ?s ?S ?a ?A ?n ?N ?c ?C)))
      (setq response (read-event prompt))
      (setq prompt <span class="string">"Please select: Compare by (<span class="keyword cl">d</span>)ate, (s)ize, date_(a)nd_size,\
 (n)ame or (c)ontents? "</span>))
    (<span class="keyword elisp">if</span> (&gt;= response 97)
        (setq response (- response 32)))
    (<span class="keyword cl">case</span> response
      (?D `(not (= mtime1 mtime2)))
      (?S `(not (= size1 size2)))
      (?N nil)
      (?C `(not (string= (sr-md5 file1 t) (sr-md5 file2 t))))
      (t `(or (not (= mtime1 mtime2)) (not (= size1 size2)))))))

(<span class="keyword">defun</span> <span class="function">sr-files-attributes</span> ()
  <span class="string">"Return a list of all file names and attributes in the current pane.
The list has the same form as the one returned by
`<span class="constant important">dired-files-attributes</span>', but contains all the files currently
displayed in VIRTUAL panes."</span>
  (delq
   nil
   (mapcar
    (<span class="keyword elisp">lambda</span> (file-name)
      (<span class="keyword cl">unless</span> (member file-name '(<span class="string">"."</span> <span class="string">".."</span>))
        (<span class="keyword elisp">let</span> ((full-file-name (expand-file-name file-name default-directory)))
          (list file-name full-file-name (file-attributes full-file-name)))))
    (sr-pane-files))))

(<span class="keyword">defun</span> <span class="function">sr-pane-files</span> ()
  <span class="string">"Return the list of files in the current pane.
For VIRTUAL panes, returns the list of all files being currently
displayed."</span>
  (delq
   nil
   (<span class="keyword elisp">if</span> (eq major-mode 'sr-virtual-mode)
       (sr-buffer-files (current-buffer))
     (directory-files default-directory))))

(<span class="keyword">defvar</span> <span class="variable">sr-md</span>5 '(nil) <span class="string">"Memoization cache for the sr-md5 function."</span>)
(<span class="keyword">defun</span> <span class="function">sr-md</span>5 (file-alist <span class="type">&amp;optional</span> memoize)
  <span class="string">"Build and execute a shell command to calculate the MD5 checksum of a file.
Second element of FILE-ALIST is the absolute path of the file. If
MEMOIZE is non-nil, save the result into the `sr-md5' alist so it
can be reused the next time this function is called with the same
path. This cache can be cleared later calling `sr-md5' with nil
as its first argument."</span>
  (<span class="keyword elisp">if</span> (null file-alist)
      (setq sr-md5 '(nil))
    (<span class="keyword elisp">let</span>* ((filename (cadr file-alist))
           (md5-digest (cdr (assoc filename sr-md5)))
           (md5-command))
      (<span class="keyword cl">unless</span> md5-digest
        (setq md5-command
              (replace-regexp-in-string
               <span class="string">"%f"</span> (format <span class="string">"\"%s\""</span> filename) sr-md5-shell-command))
        (setq md5-digest (shell-command-to-string md5-command))
        (<span class="keyword elisp">if</span> memoize
            (push (cons filename md5-digest) sr-md5)))
      md5-digest)))

(<span class="keyword">defun</span> <span class="function">sr-diff</span> ()
  <span class="string">"Run `<span class="constant important">diff</span>' on the top two marked files in both panes."</span>
  (interactive)
  (eval (sr-diff-form 'diff))
  (sr-scrollable-viewer (get-buffer <span class="string">"*Diff*"</span>)))

(<span class="keyword">defun</span> <span class="function">sr-ediff</span> ()
  <span class="string">"Run `<span class="constant important">ediff</span>' on the two top marked files in both panes."</span>
  (interactive)
  (eval (sr-diff-form 'ediff)))

(add-hook 'ediff-before-setup-windows-hook
          (<span class="keyword">defun</span> <span class="function">sr-ediff-before-setup-windows-function</span> ()
            (setq sr-ediff-on t)))

(add-hook 'ediff-quit-hook
          (<span class="keyword">defun</span> <span class="function">sr-ediff-quit-function</span> ()
            (setq sr-ediff-on nil)
            (<span class="keyword cl">when</span> sr-running
              (<span class="keyword elisp">if</span> (buffer-live-p sr-restore-buffer)
                  (switch-to-buffer sr-restore-buffer))
              (delete-other-windows)
              (sr-setup-windows)
              (sr-graphical-highlight))))

(<span class="keyword">defun</span> <span class="function">sr-diff-form</span> (fun)
  <span class="string">"Return the appropriate form to evaluate for comparing files using FUN."</span>
  (<span class="keyword elisp">let</span> ((this (sr-pop-mark)) (other nil))
    (<span class="keyword cl">unless</span> this
      (setq this (car (dired-get-marked-files t))))
    (<span class="keyword elisp">if</span> (sr-equal-dirs default-directory sr-other-directory)
        (setq other (sr-pop-mark))
      (<span class="keyword elisp">progn</span>
        (sr-change-window)
        (setq other (sr-pop-mark))
        (sr-change-window)
        (setq other (or other
                        (<span class="keyword elisp">if</span> (file-exists-p (concat sr-other-directory this))
                            this
                          (file-name-nondirectory this))))))
    (setq this (concat default-directory this)
          other (concat sr-other-directory other))
    (list fun this other)))

(<span class="keyword">defun</span> <span class="function">sr-pop-mark</span> ()
  <span class="string">"Pop the first mark in the current Dired buffer."</span>
  (<span class="keyword elisp">let</span> ((result nil))
    (<span class="keyword elisp">condition-case</span> description
      (<span class="keyword elisp">save-excursion</span>
        (goto-char (point-min))
        (dired-next-marked-file 1)
        (setq result (dired-get-filename t t))
        (dired-unmark 1))
      (<span class="warning">error</span> (message (cadr description))))
    result))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; File search &amp; analysis functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-process-kill</span> ()
  <span class="string">"Kill the process running in the current buffer (<span class="keyword elisp">if</span> any)."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((proc (get-buffer-process (current-buffer))))
    (and proc (eq (process-status proc) 'run)
         (<span class="keyword elisp">condition-case</span> nil
             (delete-process proc)
           (<span class="warning">error</span> nil)))))

(<span class="keyword">defvar</span> <span class="variable">sr-process-map</span> (<span class="keyword elisp">let</span> ((map (make-sparse-keymap)))
                         (set-keymap-parent map sr-virtual-mode-map)
                         (define-key map <span class="string">"\C-c\C-k"</span> 'sr-process-kill)
                         map)
  <span class="string">"Local map used in Sunrise panes during find and locate operations."</span>)

(<span class="keyword">defun</span> <span class="function">sr-find-decorate-buffer</span> (find-items)
  <span class="string">"Provide details on `<span class="constant important">sr-find</span>' execution in the current buffer.
If the current find operation is done only in selected files and directories,
modify the info line of the buffer to reflect this. Additionally, display an
appropriate message in the minibuffer."</span>
  (rename-uniquely)
  (<span class="keyword cl">when</span> find-items
    (<span class="keyword elisp">let</span> ((items-len (length find-items))
          (max-items-len (window-width))
          (inhibit-read-only t))
      (goto-char (point-min))
      (forward-line 1)
      (<span class="keyword cl">when</span> (re-search-forward <span class="string">"find \."</span> nil t)
        (<span class="keyword elisp">if</span> (&gt; items-len max-items-len)
            (setq find-items
                  (concat (substring find-items 0 max-items-len) <span class="string">" ..."</span>)))
        (replace-match (format <span class="string">"find %s"</span> find-items)))))
  (sr-beginning-of-buffer)
  (sr-highlight)
  (hl-line-mode 1)
  (message (propertize <span class="string">"Sunrise find (C-c C-k to kill)"</span>
                       'face 'minibuffer-prompt)))

(<span class="keyword">defun</span> <span class="function">sr-find-apply</span> (fun pattern)
  <span class="string">"Helper function for functions `<span class="constant important">sr-find</span>', `<span class="constant important">sr-find-name</span>' and `<span class="constant important">sr-find-grep</span>'."</span>
  (<span class="keyword elisp">let</span>* ((suffix (<span class="keyword elisp">if</span> (eq 'w32 window-system) <span class="string">" {} <span class="comment">;"</span> <span class="string">" \\{\\} \\;"</span>))</span>
         (find-ls-option
          (cons
           (concat <span class="string">"-exec ls -d "</span> sr-virtual-listing-switches suffix)
           <span class="string">"ls -ld"</span>))
         (sr-find-items (sr-quote-marked)) (dir))
    (<span class="keyword cl">when</span> sr-find-items
      (<span class="keyword elisp">if</span> (not (y-or-n-p <span class="string">"Find in marked items only? "</span>))
          (setq sr-find-items nil)
        (setq dir (directory-file-name (expand-file-name default-directory)))
        (add-to-list 'file-name-handler-alist (cons dir 'sr-multifind-handler))))
    (sr-save-aspect
     (sr-alternate-buffer (apply fun (list default-directory pattern)))
     (sr-virtual-mode)
     (use-local-map sr-process-map)
     (sr-keep-buffer))
    (run-with-idle-timer 0.01 nil 'sr-find-decorate-buffer sr-find-items)))

(<span class="keyword">defun</span> <span class="function">sr-find</span> (pattern)
  <span class="string">"Run `<span class="constant important">find-dired</span>' passing the current directory as first parameter."</span>
  (interactive <span class="string">"sRun find (with args): "</span>)
  (sr-find-apply 'find-dired pattern))

(<span class="keyword">defun</span> <span class="function">sr-find-name</span> (pattern)
  <span class="string">"Run `<span class="constant important">find-name-dired</span>' passing the current directory as first parameter."</span>
  (interactive <span class="string">"sFind name pattern: "</span>)
  (sr-find-apply 'find-name-dired pattern))

(<span class="keyword">defun</span> <span class="function">sr-find-grep</span> (pattern)
  <span class="string">"Run `<span class="constant important">find-grep-dired</span>' passing the current directory as first
parameter. Called with prefix asks for additional grep options."</span>
  (interactive <span class="string">"sFind files containing pattern: "</span>)
  (<span class="keyword elisp">let</span> ((find-grep-options
         (<span class="keyword elisp">if</span> current-prefix-arg
             (concat find-grep-options
                     <span class="string">" "</span>
                     (read-string <span class="string">"Additional Grep Options: "</span>))
         find-grep-options)))
    (sr-find-apply 'find-grep-dired pattern)))

(<span class="keyword">defadvice</span> <span class="function">find-dired-sentinel</span>
  (after sr-advice-find-dired-sentinel (proc state))
  <span class="string">"If the current find operation was launched inside the Sunrise
Commander, create a new backup buffer on operation completion or
abort."</span>
  (<span class="keyword elisp">with-current-buffer</span> (process-buffer proc)
    (<span class="keyword cl">when</span> (eq 'sr-virtual-mode major-mode)
      (sr-backup-buffer))))
(ad-activate 'find-dired-sentinel)

(<span class="keyword">defadvice</span> <span class="function">find-dired-filter</span>
  (around sr-advice-find-dired-filter (proc string))
  <span class="string">"Disable the \"non-foolproof\" padding mechanism in `<span class="constant important">find-dired-filter</span>' that
breaks Dired when using ls options that omit some columns (like g or G). Defined
by the Sunrise Commander."</span>
  (<span class="keyword elisp">if</span> (and (eq 'sr-virtual-mode major-mode)
           (or (string-match <span class="string">"g"</span> sr-virtual-listing-switches)
               (string-match <span class="string">"G"</span> sr-virtual-listing-switches)))
      (<span class="keyword elisp">let</span> ((find-ls-option nil)) ad-do-it)
    ad-do-it))
(ad-activate 'find-dired-filter)

(<span class="keyword">defun</span> <span class="function">sr-multifind-handler</span> (operation <span class="type">&amp;rest</span> args)
  <span class="string">"Magic file name handler for manipulating the command executed by `<span class="constant important">find-dired</span>'
when the user requests to perform the find operation on all currently marked
items (as opposed to the current default directory). Removes itself from the
`<span class="constant important">inhibit-file-name-handlers</span>' every time it's executed."</span>
  (<span class="keyword elisp">let</span> ((inhibit-file-name-handlers
         (cons 'sr-multifind-handler
               (and (eq inhibit-file-name-operation operation)
                    inhibit-file-name-handlers)))
        (inhibit-file-name-operation operation))
    (<span class="keyword cl">when</span> (eq operation 'shell-command)
      (setq file-name-handler-alist
            (rassq-delete-all 'sr-multifind-handler file-name-handler-alist))
      (<span class="keyword cl">when</span> sr-find-items
        (setcar args (replace-regexp-in-string
                      <span class="string">"find \."</span> (format <span class="string">"find %s"</span> sr-find-items) (car args)))))
    (apply operation args)))

(<span class="keyword">defvar</span> <span class="variable">sr-as-pending</span> nil
  <span class="string">"Buffer-local variable used by async search operations to keep
partial process output between consecutive batches of data."</span>)

(<span class="keyword">defun</span> <span class="function">sr-as-filter</span> (as-buffer <span class="type">&amp;optional</span> as-filter)
  <span class="string">"Return a filter function for an async search process."</span>
  `(<span class="keyword elisp">lambda</span> (process output)
     (<span class="keyword elisp">let</span> ((inhibit-read-only t)
           (beg (point-max))
           (as-filter (or (quote ,as-filter) #'identity))
           (entries))

       (setq output (concat sr-as-pending output)
             entries (split-string output <span class="string">"[\r\n]"</span> t))

       (set (make-local-variable 'sr-as-pending) <span class="string">""</span>)
       (<span class="keyword cl">unless</span> (string-match <span class="string">"[\r\n]$"</span> output)
         (setq sr-as-pending (car (last entries))))

       (set-buffer ,as-buffer)
       (<span class="keyword elisp">save-excursion</span>
         (mapc (<span class="keyword elisp">lambda</span> (x)
                 (<span class="keyword cl">when</span> (and (apply as-filter (list x))
                            (not (eq x sr-as-pending)))
                   (setq x (replace-regexp-in-string <span class="string">"\\./"</span> <span class="string">""</span> x))
                   (goto-char (point-max))
                   (insert-char 32 2)
                   (insert-directory x sr-virtual-listing-switches nil nil)))
               entries)
         (sr-display-attributes beg (point-at-eol) sr-show-file-attributes)))))

(<span class="keyword">defun</span> <span class="function">sr-as-sentinel</span> (as-buffer as-command)
  <span class="string">"Return a sentinel function for an async search process.
Used to notify about the termination status of the process."</span>
  `(<span class="keyword elisp">lambda</span> (process status)
     (<span class="keyword elisp">let</span> ((inhibit-read-only t))
       (set-buffer ,as-buffer)
       (goto-char (point-max))
       (insert <span class="string">"\n "</span> ,as-command <span class="string">" "</span> status)
       (forward-char -1)
       (insert <span class="string">" at "</span> (substring (current-time-string) 0 19))
       (forward-char 1))
     (sr-beginning-of-buffer)
     (sr-highlight)
     (hl-line-mode 1)))

(<span class="keyword">defun</span> <span class="function">sr-as-prompt</span> (as-command)
  <span class="string">"Display the message that appears when an async search process is launched."</span>
  (message (propertize (format <span class="string">"Sunrise %s (C-c C-k to kill)"</span> as-command)
                       'face 'minibuffer-prompt)))

(<span class="keyword">defun</span> <span class="function">sr-as-search</span> (as-label as-command as-filter <span class="type">&amp;rest</span> as-args)
  <span class="string">"Launch an asyncronous search operation.

AS-LABEL is a name to use for displaying in messages etc.

AS-COMMAND is the path to the search command to invoke.

AS-FILTER is an optional filter to test every entry returned by
the search process - only those entries for which this filter
returns non-nil will be included in the result.

AS-ARGS are all additional arguments needed to execute the
operation.

Please note that this facility executes its processes directly,
without the intermediation of a shell, so spaces as separators
are not supported in any of the arguments."</span>

  (<span class="keyword elisp">let</span> ((as-buffer (create-file-buffer (format <span class="string">"*Sunrise %s*"</span> as-command)))
        (as-process-args
         (append (list (format <span class="string">"Async %s"</span> as-label) nil as-command) as-args))
        (as-process nil))
    (sr-save-aspect
     (sr-alternate-buffer (switch-to-buffer as-buffer))
     (insert <span class="string">"  "</span> default-directory <span class="string">":"</span>) (newline)
     (insert (format <span class="string">" Results of: %s %s"</span> as-command
                     (substring (format <span class="string">"%s"</span> as-args) 1 -1)))
     (newline)
     (sr-virtual-mode)
     (set-process-filter
      (setq as-process (apply 'start-process as-process-args))
      (sr-as-filter as-buffer as-filter))
     (set-process-sentinel as-process (sr-as-sentinel as-buffer as-command))
     (set-process-buffer as-process as-buffer)
     (use-local-map sr-process-map)
     (run-with-idle-timer 0.01 nil 'sr-as-prompt as-label))))

(<span class="keyword">defun</span> <span class="function">sr-async-grep</span> (as-input)
  <span class="string">"Launch a grep asynchronous search operation. If any entries
have been explicitly selected in the current pane ask the user
whether to run the grep only for these entries, otherwise run it
in the current directory. If called with prefix ask for
additional grep options."</span>
  (interactive <span class="string">"sFind files containing: "</span>)
  (<span class="keyword elisp">let</span>* ((default-grep-options <span class="string">"-rl"</span>)
         (opts (<span class="keyword elisp">if</span> current-prefix-arg
                   (concat default-grep-options <span class="string">" "</span>
                           (read-string <span class="string">"Additional Grep Options: "</span>))
                 default-grep-options))
         (options (split-string opts <span class="string">" "</span> t))
         (marked (sr-get-marked-files))
         (target
          (<span class="keyword elisp">if</span> (and marked (y-or-n-p <span class="string">"Grep in marked items only? "</span>))
              marked
            '(<span class="string">"."</span>))))
    (cl-labels ((fl (<span class="type">&amp;rest</span> args) (sr-flatlist args)))
      (apply 'sr-as-search
             (fl <span class="string">"Grep"</span> sr-grep-command nil options as-input target)))))

(<span class="keyword">defun</span> <span class="function">sr-grep</span> ()
  <span class="string">"Run grep asynchronously and display the results in Sunrise virtual mode."</span>
  (interactive)
  (<span class="keyword elisp">if</span> sr-recursive-grep-supported
      (call-interactively 'sr-async-grep)
    (call-interactively 'sr-find-grep)))

(<span class="keyword">defvar</span> <span class="variable">locate-command</span>)
(autoload 'locate-prompt-for-search-string <span class="string">"locate"</span>)
(<span class="keyword">defun</span> <span class="function">sr-locate</span> (as-input <span class="type">&amp;optional</span> _filter _arg)
  <span class="string">"Run locate asynchronously and display the results in Sunrise virtual mode."</span>
  (interactive
   (list (locate-prompt-for-search-string) nil current-prefix-arg))
  (sr-as-search <span class="string">"Locate"</span> <span class="string">"locate"</span> #'file-exists-p as-input))

(<span class="keyword">defun</span> <span class="function">sr-multi-occur</span> (string)
  <span class="string">"Execute `<span class="constant important">multi-occur</span>' on all marked files. Note this command needs to visit
first all the selected files."</span>
  (interactive <span class="string">"sSearch in selected files for occurrences of: "</span>)
  (<span class="keyword elisp">let</span> ((regular-files (delq nil (mapcar (<span class="keyword elisp">lambda</span> (x)
                                           (and (file-regular-p x) x))
                                         (dired-get-marked-files)))))
    (<span class="keyword elisp">if</span> (not regular-files)
        (<span class="warning">error</span> <span class="string">"Sunrise: no regular files to search"</span>)
      (sr-quit)
      (multi-occur (mapcar 'find-file regular-files) string)
      (other-window 1))))

(<span class="keyword">defun</span> <span class="function">sr-flatten-branch</span> (<span class="type">&amp;optional</span> mode)
  <span class="string">"Display a flat view of the items contained in the current directory and all
its subdirectories, sub-subdirectories and so on (recursively) in the active
pane."</span>
  (interactive <span class="string">"cFlatten branch showing: (E)verything, (D)irectories,\
 (N)on-directories or (F)iles only?"</span>)
  (<span class="keyword elisp">if</span> (and mode (&gt;= mode 97)) (setq mode (- mode 32)))
  (<span class="keyword cl">case</span> mode
    (?E (sr-find-name <span class="string">"*"</span>))
    (?D (sr-find <span class="string">"-type d"</span>))
    (?N (sr-find <span class="string">"-not -type d"</span>))
    (?F (sr-find <span class="string">"-type f"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-prune-paths</span> (regexp)
  <span class="string">"Kill all lines (only the lines) in the current pane matching REGEXP."</span>
  (interactive <span class="string">"sPrune paths matching: "</span>)
  (<span class="keyword elisp">save-excursion</span>
    (sr-beginning-of-buffer)
    (<span class="keyword elisp">while</span> (<span class="keyword elisp">if</span> (string-match regexp (dired-get-filename t))
               (dired-kill-line)
             (dired-next-line 1)))))

(<span class="keyword">defun</span> <span class="function">sr-fuzzy-narrow</span> ()
  <span class="string">"Interactively narrow contents of the current pane using fuzzy matching:
  * press Delete or Backspace to revert the buffer to its previous state
  * press Return, C-n or C-p to exit and accept the current narrowed state
  * press Esc or C-g to abort the operation and revert the buffer
  * use ! to prefix characters that should NOT appear beyond a given position.
  Once narrowed and accepted, you can restore the original contents of the pane
  by pressing g (`<span class="constant important">revert-buffer</span>')."</span>
  (interactive)
  (<span class="keyword cl">when</span> sr-running
    (sr-beginning-of-buffer)
    (dired-change-marks ?* ?\t)
    (<span class="keyword elisp">let</span> ((stack nil) (filter <span class="string">""</span>) (regex <span class="string">""</span>) (next-char nil) (inhibit-quit t))
      (cl-labels ((read-next (f) (read-char (concat <span class="string">"Fuzzy narrow: "</span> f))))
        (setq next-char (read-next filter))
        (sr-backup-buffer)
        (<span class="keyword elisp">while</span> next-char
          (<span class="keyword cl">case</span> next-char
            ((?\e ?\C-g) (setq next-char nil) (sr-revert-buffer))
            (?\C-n (setq next-char nil) (sr-beginning-of-buffer))
            (?\C-p (setq next-char nil) (sr-end-of-buffer))
            ((?\n ?\r) (setq next-char nil))
            ((?\b ?\d)
             (revert-buffer)
             (setq stack (cdr stack) filter (caar stack) regex (cdar stack))
             (<span class="keyword cl">unless</span> stack (setq next-char nil)))
            (t
             (setq filter (concat filter (char-to-string next-char)))
             (<span class="keyword elisp">if</span> (not (eq next-char sr-fuzzy-negation-character))
                 (setq next-char (char-to-string next-char)
                       regex (<span class="keyword elisp">if</span> (string= <span class="string">""</span> regex) <span class="string">".*"</span> regex)
                       regex (concat regex (regexp-quote next-char) <span class="string">".*"</span>))
               (setq next-char (char-to-string (read-next filter))
                     filter (concat filter next-char)
                     regex (replace-regexp-in-string <span class="string">"\\.\\*\\'"</span> <span class="string">""</span> regex)
                     regex (concat regex <span class="string">"[<span class="negation">^</span>"</span>(regexp-quote next-char)<span class="string">"]*"</span>)
                     regex (replace-regexp-in-string <span class="string">"\\]\\*\\[\\^"</span> <span class="string">""</span> regex)))
             (setq stack (cons (cons filter regex) stack))))
          (<span class="keyword cl">when</span> next-char
            (dired-mark-files-regexp (concat <span class="string">"^"</span> regex <span class="string">"$"</span>))
            (dired-toggle-marks)
            (dired-do-kill-lines)
            (setq next-char (read-next filter)))))
      (dired-change-marks ?\t ?*))))

(<span class="keyword">defun</span> <span class="function">sr-recent-files</span> ()
  <span class="string">"Display the history of recent files in Sunrise virtual mode."</span>
  (interactive)
  (<span class="keyword elisp">if</span> (not (<span class="keyword">featurep</span> '<span class="constant">recentf</span>))
      (<span class="warning">error</span> <span class="string">"ERROR: Feature recentf not available!"</span>))

  (sr-save-aspect
   (<span class="keyword elisp">let</span> ((dired-actual-switches dired-listing-switches))
     (sr-switch-to-clean-buffer <span class="string">"*Recent Files*"</span>)
     (insert <span class="string">"Recently Visited Files: \n"</span>)
     (<span class="keyword cl">dolist</span> (file recentf-list)
       (<span class="keyword elisp">condition-case</span> nil
           (insert-directory file sr-virtual-listing-switches nil nil)
         (<span class="warning">error</span> (ignore))))
     (sr-virtual-mode)
     (sr-keep-buffer))))

(<span class="keyword">defun</span> <span class="function">sr-recent-directories</span> ()
  <span class="string">"Display the history of directories recently visited in the current pane."</span>
  (interactive)
  (sr-save-aspect
   (<span class="keyword elisp">let</span> ((hist (cdr (assoc sr-selected-window sr-history-registry)))
         (dired-actual-switches dired-listing-switches)
         (pane-name (capitalize (symbol-name sr-selected-window)))
         (switches))
     (sr-switch-to-clean-buffer (format <span class="string">"*%s Pane History*"</span> pane-name))
     (insert (concat <span class="string">"Recent Directories in "</span> pane-name <span class="string">" Pane: \n"</span>))
     (<span class="keyword cl">dolist</span> (dir hist)
       (<span class="keyword elisp">condition-case</span> nil
           (<span class="keyword cl">case</span> (sr-history-entry-type dir)
             (tramp
              (insert (concat <span class="string">"d......... 0 0000-00-00 "</span> dir))
              (newline))
             (local
              (setq switches (concat sr-virtual-listing-switches <span class="string">" -d"</span>)
                    dir (sr-chop ?/ (expand-file-name dir)))
              (insert-directory dir switches nil nil))
             (t (ignore)))
         (<span class="warning">error</span> (ignore))))
     (sr-virtual-mode))))

(<span class="keyword">defun</span> <span class="function">sr-switch-to-clean-buffer</span> (name)
  (sr-alternate-buffer (switch-to-buffer name))
  (erase-buffer))

(<span class="keyword">defun</span> <span class="function">sr-pure-virtual</span> (<span class="type">&amp;optional</span> passive)
  <span class="string">"Create a new empty buffer in Sunrise VIRTUAL mode.
If the optional argument PASSIVE is non-nil, creates the virtual
buffer in the passive pane."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">if</span> passive
      (<span class="keyword elisp">progn</span>
        (sr-synchronize-panes)
        (sr-in-other (sr-pure-virtual nil)))
    (sr-save-aspect
     (<span class="keyword elisp">let</span>* ((dir (directory-file-name (dired-current-directory)))
            (buff (generate-new-buffer-name (buffer-name (current-buffer)))))
       (sr-alternate-buffer (switch-to-buffer buff))
       (goto-char (point-min))
       (insert <span class="string">"  "</span> dir <span class="string">":"</span>)(newline)
       (insert <span class="string">" Pure VIRTUAL buffer: "</span>)(newline)
       (sr-virtual-mode)
       (sr-keep-buffer)))))

(<span class="keyword">defun</span> <span class="function">sr-dired-do-apply</span> (dired-fun)
  <span class="string">"Helper function for implementing `<span class="constant important">sr-do-query-replace-regexp</span>' and Co."</span>
  (<span class="keyword elisp">let</span> ((buff (current-buffer)) (orig sr-restore-buffer))
    (<span class="keyword elisp">condition-case</span> nil
        (<span class="keyword elisp">progn</span>
          (sr-quit)
          (switch-to-buffer buff)
          (call-interactively dired-fun)
          (replace-buffer-in-windows buff)
          (sr-bury-panes))
      (quit
       (<span class="keyword cl">when</span> orig (switch-to-buffer orig))
       (sunrise)))))

(<span class="keyword">defun</span> <span class="function">sr-do-query-replace-regexp</span> ()
  <span class="string">"Force Sunrise to quit before executing `<span class="constant important">dired-do-query-replace-regexp</span>'."</span>
  (interactive)
  (sr-dired-do-apply 'dired-do-query-replace-regexp))

(<span class="keyword">defun</span> <span class="function">sr-do-search</span> ()
  <span class="string">"Force Sunrise to quit before executing `<span class="constant important">dired-do-search</span>'."</span>
  (interactive)
  (sr-dired-do-apply 'dired-do-search))

(<span class="keyword">defun</span> <span class="function">sr-sticky-isearch-prompt</span> ()
  <span class="string">"Display the message that appears when a sticky search is launched."</span>
  (message (propertize <span class="string">"Sunrise sticky I-search (C-g to exit): "</span>
                       'face 'minibuffer-prompt)))

(<span class="keyword">defvar</span> <span class="variable">sr-sticky-isearch-commands</span>
  '(nil
    (<span class="string">"\C-o"</span> . dired-omit-mode)
    (<span class="string">"\M-a"</span> . sr-beginning-of-buffer)
    (<span class="string">"\M-e"</span> . sr-end-of-buffer)
    (<span class="string">"\C-v"</span> . scroll-up-command)
    (<span class="string">"\M-v"</span> . (<span class="keyword elisp">lambda</span> () (interactive) (scroll-up-command '-)))
    (<span class="string">"\C-g"</span> . (<span class="keyword elisp">lambda</span> () (interactive) (<span class="keyword elisp">save-excursion</span> (isearch-abort))))
  ) <span class="string">"Keybindings installed in `<span class="constant important">isearch-mode</span>' during a sticky search."</span>)

(<span class="keyword">defun</span> <span class="function">sr-sticky-isearch-remap-commands</span> (<span class="type">&amp;optional</span> restore)
  <span class="string">"Remap `<span class="constant important">isearch-mode-map</span>' commands using `<span class="constant important">sr-sticky-isearch-commands</span>'.
Replace the bindings in our table with the previous ones from `<span class="constant important">isearch-mode-map</span>'
so we can restore them when the current sticky search operation finishes."</span>
  (<span class="keyword cl">when</span> (eq restore (car sr-sticky-isearch-commands))
    (setcar sr-sticky-isearch-commands (not restore))
    (mapc (<span class="keyword elisp">lambda</span> (entry)
            (<span class="keyword elisp">let</span>* ((binding (car entry))
                   (old-command (lookup-key isearch-mode-map binding))
                   (new-command (cdr entry)))
              (define-key isearch-mode-map binding new-command)
              (setcdr entry old-command)))
          (cdr sr-sticky-isearch-commands))))

(<span class="keyword">defun</span> <span class="function">sr-sticky-isearch</span> (<span class="type">&amp;optional</span> backward)
  <span class="string">"Concatenate Isearch operations to allow fast file system navigation.
Search continues until C-g is pressed (to abort) or Return is
pressed on a regular file (to end the operation and visit that
file)."</span>
  (set (make-local-variable 'search-nonincremental-instead) nil)
  (add-hook 'isearch-mode-end-hook 'sr-sticky-post-isearch)
  (sr-sticky-isearch-remap-commands)
  (<span class="keyword elisp">if</span> backward
      (isearch-backward nil t)
    (isearch-forward nil t))
  (run-hooks 'sr-refresh-hook)
  (run-with-idle-timer 0.01 nil 'sr-sticky-isearch-prompt))

(<span class="keyword">defun</span> <span class="function">sr-sticky-isearch-forward</span> ()
  <span class="string">"Start a sticky forward search in the current pane."</span>
  (interactive)
  (sr-sticky-isearch))

(<span class="keyword">defun</span> <span class="function">sr-sticky-isearch-backward</span> ()
  <span class="string">"Start a sticky backward search in the current pane."</span>
  (interactive)
  (sr-sticky-isearch t))

(<span class="keyword">defun</span> <span class="function">sr-sticky-post-isearch</span> ()
  <span class="string">"`<span class="constant important">isearch-mode-end-hook</span>' function for Sunrise sticky Isearch operations."</span>
  (and
   (dired-get-filename nil t)
   (<span class="keyword elisp">let</span>* ((filename (expand-file-name (dired-get-filename nil t)))
          (is-dir (or (file-directory-p filename)
                      (sr-avfs-dir filename)
                      (sr-virtual-directory-p filename))))
     (<span class="keyword elisp">cond</span> ((or isearch-mode-end-hook-quit (not is-dir))
            (<span class="keyword elisp">progn</span>
              (remove-hook 'isearch-mode-end-hook 'sr-sticky-post-isearch)
              (kill-local-variable 'search-nonincremental-instead)
              (sr-sticky-isearch-remap-commands t)
              (isearch-done)
              (<span class="keyword elisp">if</span> isearch-mode-end-hook-quit
                  (run-hooks 'sr-refresh-hook)
                (sr-find-file filename))))
           (t
            (<span class="keyword elisp">progn</span>
              (sr-find-file filename)
              (set (make-local-variable 'search-nonincremental-instead) nil)
              (isearch-forward nil t)
              (run-with-idle-timer 0.01 nil 'sr-sticky-isearch-prompt)))))))

(<span class="keyword">defun</span> <span class="function">sr-show-files-info</span> (<span class="type">&amp;optional</span> deref-symlinks)
  <span class="string">"Enhanced version of `<span class="constant important">dired-show-file-type</span>' from dired‐aux.
If at most one item is marked, print the filetype of the current
item according to the \"file\" command, including its size in bytes.
If more than one item is marked, print the total size in
bytes (calculated recursively) of all marked items."</span>
  (interactive <span class="string">"P"</span>)
  (message <span class="string">"Calculating total size of selection... (C-g to abort)"</span>)
  (<span class="keyword elisp">let</span>* ((selection (dired-get-marked-files t))
         (size (sr-size-format (sr-files-size selection)))
         (items (length selection)) (label) (regex))
    (<span class="keyword elisp">if</span> (&gt;= 1 items)
        (<span class="keyword elisp">progn</span>
          (setq selection (car selection)
                label (file-name-nondirectory selection)
                regex (concat <span class="string">"^.*"</span> label <span class="string">"[:<span class="comment">;]"</span>)</span>
                label (concat label <span class="string">":"</span>))
          (dired-show-file-type selection deref-symlinks)
          (message
           <span class="string">"%s (%s bytes)"</span>
           (replace-regexp-in-string regex label (current-message)) size))
      (message <span class="string">"%s bytes in %d selected items"</span> size items))
    (sit-for 0.5)))

(<span class="keyword elisp">eval-when-compile</span>
  (<span class="keyword">defsubst</span> <span class="function">sr-size-attr</span> (file)
    <span class="string">"Helper function for `<span class="constant important">sr-files-size</span>'."</span>
    (float (or (nth 7 (file-attributes file)) 0))))

(<span class="keyword">defun</span> <span class="function">sr-files-size</span> (files)
  <span class="string">"Recursively calculate the total size of all FILES.
FILES should be a list of paths."</span>
  (<span class="keyword elisp">let</span> ((result 0))
    (mapc
     (<span class="keyword elisp">lambda</span> (x) (setq result (+ x result)))
     (mapcar (<span class="keyword elisp">lambda</span> (f) (<span class="keyword elisp">cond</span> ((string-match <span class="string">"\\.\\./?$"</span> f) 0)
                               ((string-match <span class="string">"\\./?$"</span> f) (sr-size-attr f))
                               ((file-symlink-p f) (sr-size-attr f))
                               ((file-directory-p f) (sr-directory-size f))
                               (t (float (sr-size-attr f)))))
             files))
    result))

(<span class="keyword">defun</span> <span class="function">sr-directory-size</span> (directory)
  <span class="string">"Recursively calculate the total size of the given DIRECTORY."</span>
  (sr-files-size (directory-files directory t nil t)))

(<span class="keyword">defun</span> <span class="function">sr-size-format</span> (size)
  <span class="string">"Return integer representation of SIZE (a float) as a string.
Uses comma as the thousands separator."</span>
  (<span class="keyword elisp">let</span>* ((num (replace-regexp-in-string <span class="string">"\\..*$"</span> <span class="string">""</span> (number-to-string size)))
         (digits (reverse (split-string num <span class="string">""</span> t)))
         result)
    (<span class="keyword cl">dotimes</span> (n (length digits))
      (<span class="keyword cl">when</span> (and (&lt; 0 n) (zerop (% n 3)))
        (setq result (concat <span class="string">","</span> result)))
      (setq result (concat (pop digits) result)))
    result))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; TI (Terminal Integration) and CLEX (Command Line EXpansion) functions:</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sr-term</span> (<span class="type">&amp;optional</span> cd newterm program)
  <span class="string">"Run terminal in a new buffer or switch to an existing one.
If the optional argument CD is non-nil, directory is changed to
the current one in the active pane. A non-nil NEWTERM argument
forces the creation of a new terminal. If PROGRAM is provided
and exists in `<span class="constant important">exec-path</span>', then it will be used instead of the
default `<span class="constant important">sr-terminal-program</span>'."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((aterm (car sr-ti-openterms)))
    (<span class="keyword elisp">if</span> (and (null program)
             (or (eq major-mode 'eshell-mode)
                 (and (buffer-live-p aterm)
                      (<span class="keyword elisp">with-current-buffer</span> aterm
                        (eq major-mode 'eshell-mode)))))
        (setq program <span class="string">"eshell"</span>)
      (setq program (or program sr-terminal-program))))
  (<span class="keyword elisp">if</span> (memq major-mode '(sr-mode sr-virtual-mode sr-tree-mode))
      (hl-line-mode 1))
  (<span class="keyword elisp">if</span> (string= program <span class="string">"eshell"</span>)
      (sr-term-eshell cd newterm)
    (sr-term-extern cd newterm program)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sr-term-cd</span> ()
  <span class="string">"Run terminal in a new buffer or switch to an existing one.
cd's to the current directory of the active pane."</span>
  (interactive)
  (sr-term t))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sr-term-cd-newterm</span> ()
  <span class="string">"Open a NEW terminal (don't switch to an existing one).
cd's to the current directory of the active pane."</span>
  (interactive)
  (sr-term t t))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">sr-term-cd-program</span> (<span class="type">&amp;optional</span> program)
  <span class="string">"Open a NEW terminal using PROGRAM as the shell."</span>
  (interactive <span class="string">"sShell program to use: "</span>)
  (sr-term t t program))

(<span class="keyword">defmacro</span> <span class="function">sr-term-excursion</span> (cd newterm form <span class="type">&amp;optional</span> is-external)
  <span class="string">"Take care of the common mechanics of launching or switching to a terminal.
Helper macro."</span>
  `(<span class="keyword elisp">let</span>* ((start-buffer (current-buffer))
          (new-term (or (null sr-ti-openterms) ,newterm))
          (next-buffer (or (cadr (memq start-buffer sr-ti-openterms))
                           (car sr-ti-openterms)))
          (new-name) (is-line-mode))
     (sr-select-viewer-window t)
     (<span class="keyword elisp">if</span> (not new-term)
         <span class="comment">;;don't switch anywhere else if we're in a term and we want only to cd:</span>
         (<span class="keyword cl">unless</span> (and ,cd (memq (current-buffer) sr-ti-openterms))
           (switch-to-buffer next-buffer))
       (<span class="keyword cl">when</span> next-buffer
         (<span class="keyword elisp">with-current-buffer</span> next-buffer
           (setq is-line-mode (and (boundp 'sr-term-line-minor-mode)
                                   (symbol-value 'sr-term-line-minor-mode)))))
       ,form
       (<span class="keyword elisp">if</span> ,is-external (sr-term-char-mode))
       (<span class="keyword elisp">if</span> is-line-mode (sr-term-line-mode))
       (<span class="keyword cl">when</span> (memq (current-buffer) sr-ti-openterms)
         (rename-uniquely)
         (setq new-name (buffer-name))
         ,form)
       (<span class="keyword cl">when</span> new-name
         (message <span class="string">"Sunrise: previous terminal renamed to %s"</span> new-name))
       (push (current-buffer) sr-ti-openterms))))

(<span class="keyword">defun</span> <span class="function">sr-term-line-mode</span> ()
  <span class="string">"Switch the current terminal to line mode.
Apply additional Sunrise keybindings for terminal integration."</span>
  (interactive)
  (term-line-mode)
  (sr-term-line-minor-mode 1))

(<span class="keyword">defun</span> <span class="function">sr-term-char-mode</span> ()
  <span class="string">"Switch the current terminal to character mode.
Bind C-j and C-k to Sunrise terminal integration commands."</span>
  (interactive)
  (term-char-mode)
  (sr-term-line-minor-mode 0)
  (sr-term-char-minor-mode 1))

(<span class="keyword">defun</span> <span class="function">sr-term-extern</span> (<span class="type">&amp;optional</span> cd newterm program)
  <span class="string">"Implementation of `<span class="constant important">sr-term</span>' for external terminal programs.
See `<span class="constant important">sr-term</span>' for a description of the arguments."</span>
  (<span class="keyword elisp">let</span>* ((program (<span class="keyword elisp">if</span> program (executable-find program)))
         (program (or program sr-terminal-program))
         (dir (expand-file-name (sr-choose-cd-target)))
        (aterm (car sr-ti-openterms))
        (cd (or cd (null sr-ti-openterms)))
        (line-mode (<span class="keyword elisp">if</span> (buffer-live-p aterm)
                       (<span class="keyword elisp">with-current-buffer</span> aterm (term-in-line-mode)))))
    (sr-term-excursion cd newterm (term program) t)
    (sr-term-char-mode)
    (<span class="keyword cl">when</span> (or line-mode (term-in-line-mode))
      (sr-term-line-mode))
    (<span class="keyword cl">when</span> cd
      (term-send-raw-string
       (concat <span class="string">"cd "</span> (shell-quote-wildcard-pattern dir) <span class="string">"
"</span>)))))

(<span class="keyword">defun</span> <span class="function">sr-term-eshell</span> (<span class="type">&amp;optional</span> cd newterm)
  <span class="string">"Implementation of `<span class="constant important">sr-term</span>' when using `<span class="constant important">eshell</span>'."</span>
  (<span class="keyword elisp">let</span> ((dir (expand-file-name (sr-choose-cd-target)))
        (cd (or cd (null sr-ti-openterms))))
    (sr-term-excursion cd newterm (eshell))
    (<span class="keyword cl">when</span> cd
      (insert (concat <span class="string">"cd "</span> (shell-quote-wildcard-pattern dir)))
      (eshell-send-input))
    (sr-term-line-mode)))

(<span class="keyword">defmacro</span> <span class="function">sr-ti</span> (form)
  <span class="string">"Evaluate FORM in the context of the selected pane.
Helper macro for implementing terminal integration in Sunrise."</span>
  `(<span class="keyword cl">when</span> sr-running
     (sr-select-window sr-selected-window)
     (hl-line-unhighlight)
     (<span class="keyword elisp">unwind-protect</span>
         ,form
       (<span class="keyword cl">when</span> sr-running
         (sr-select-viewer-window)))))

(<span class="keyword">defun</span> <span class="function">sr-ti-previous-line</span> ()
  <span class="string">"Move one line backward on active pane from the terminal window."</span>
  (interactive)
  (sr-ti (forward-line -1)))

(<span class="keyword">defun</span> <span class="function">sr-ti-next-line</span> ()
  <span class="string">"Move one line forward on active pane from the terminal window."</span>
  (interactive)
  (sr-ti (forward-line 1)))

(<span class="keyword">defun</span> <span class="function">sr-ti-select</span> ()
  <span class="string">"Run `<span class="constant important">dired-advertised-find-file</span>' on active pane from the terminal window."</span>
  (interactive)
  (sr-ti (sr-advertised-find-file)))

(<span class="keyword">defun</span> <span class="function">sr-ti-mark</span> ()
  <span class="string">"Run `<span class="constant important">dired-mark</span>' on active pane from the terminal window."</span>
  (interactive)
  (sr-ti (dired-mark 1)))

(<span class="keyword">defun</span> <span class="function">sr-ti-unmark</span> ()
  <span class="string">"Run `<span class="constant important">dired-unmark-backward</span>' on active pane from the terminal window."</span>
  (interactive)
  (sr-ti (dired-unmark-backward 1)))

(<span class="keyword">defun</span> <span class="function">sr-ti-prev-subdir</span> (<span class="type">&amp;optional</span> count)
  <span class="string">"Run `<span class="constant important">dired-prev-subdir</span>' on active pane from the terminal window."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">let</span> ((count (or count 1)))
    (sr-ti (sr-dired-prev-subdir count))))

(<span class="keyword">defun</span> <span class="function">sr-ti-unmark-all-marks</span> ()
  <span class="string">"Remove all marks on active pane from the terminal window."</span>
  (interactive)
  (sr-ti (dired-unmark-all-marks)))

(<span class="keyword">defun</span> <span class="function">sr-ti-change-window</span> ()
  <span class="string">"Switch focus to the currently active pane."</span>
  (interactive)
  (sr-select-window sr-selected-window))

(<span class="keyword">defun</span> <span class="function">sr-ti-change-pane</span> ()
  <span class="string">"Change selection of active pane to passive one."</span>
  (interactive)
  (sr-ti (sr-change-window)))

(add-hook
 'kill-buffer-hook
 (<span class="keyword">defun</span> <span class="function">sr-ti-cleanup-openterms</span> ()
   <span class="string">"Remove the current buffer from the list of open terminals."</span>
   (setq sr-ti-openterms (delete (current-buffer) sr-ti-openterms))))

(<span class="keyword">defun</span> <span class="function">sr-ti-revert-buffer</span> ()
  <span class="string">"Refresh the currently active pane."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((dir default-directory))
    (<span class="keyword elisp">if</span> (not (sr-equal-dirs dir sr-this-directory))
        (sr-ti (sr-goto-dir dir))
      (sr-ti (sr-revert-buffer)))))

(<span class="keyword">defun</span> <span class="function">sr-ti-lock-panes</span> ()
  <span class="string">"Resize and lock the panes at standard position from the command line."</span>
  (interactive)
  (sr-ti (sr-lock-panes)))

(<span class="keyword">defun</span> <span class="function">sr-ti-min-lock-panes</span> ()
  <span class="string">"Minimize the panes from the command line."</span>
  (interactive)
  (sr-ti (sr-min-lock-panes)))

(<span class="keyword">defun</span> <span class="function">sr-ti-max-lock-panes</span> ()
  <span class="string">"Maximize the panes from the command line."</span>
  (interactive)
  (sr-ti (sr-max-lock-panes)))

(<span class="keyword">defmacro</span> <span class="function">sr-clex</span> (pane form)
  <span class="string">"Evaluate FORM in the context of PANE.
Helper macro for implementing command line expansion in Sunrise."</span>
  `(<span class="keyword elisp">progn</span>
     (setq pane (<span class="keyword elisp">if</span> (atom pane) pane (eval pane)))
     (<span class="keyword elisp">with-current-buffer</span> (symbol-value (sr-symbol ,pane 'buffer))
       ,form)))

(<span class="keyword">defun</span> <span class="function">sr-clex-marked</span> (pane)
  <span class="string">"Return a string containing the list of marked files in PANE."</span>
  (sr-clex
   pane
   (mapconcat 'shell-quote-wildcard-pattern (dired-get-marked-files) <span class="string">" "</span>)))

(<span class="keyword">defun</span> <span class="function">sr-clex-file</span> (pane)
  <span class="string">"Return the file currently selected in PANE."</span>
  (sr-clex
   pane
   (concat (shell-quote-wildcard-pattern (dired-get-filename)) <span class="string">" "</span>)))

(<span class="keyword">defun</span> <span class="function">sr-clex-marked-nodir</span> (pane)
  <span class="string">"Return a list of basenames of all the files currently marked in PANE."</span>
  (sr-clex
   pane
   (mapconcat 'shell-quote-wildcard-pattern
              (dired-get-marked-files 'no-dir) <span class="string">" "</span>)))

(<span class="keyword">defun</span> <span class="function">sr-clex-dir</span> (pane)
  <span class="string">"Return the current directory of the given pane."</span>
  (sr-clex
   pane
   (concat (shell-quote-wildcard-pattern default-directory) <span class="string">" "</span>)))

(<span class="keyword">defun</span> <span class="function">sr-clex-start</span> ()
  <span class="string">"Start a new CLEX operation.
Puts `<span class="constant important">sr-clex-commit</span>' into local `<span class="constant important">after-change-functions</span>'."</span>
  (interactive)
  (<span class="keyword elisp">if</span> sr-clex-on
      (<span class="keyword elisp">progn</span>
        (setq sr-clex-on nil)
        (delete-overlay sr-clex-hotchar-overlay))
    (insert-char ?% 1)
    (<span class="keyword cl">when</span> sr-running
      (add-hook 'after-change-functions 'sr-clex-commit nil t)
      (setq sr-clex-on t)
      (setq sr-clex-hotchar-overlay (make-overlay (point) (1- (point))))
      (overlay-put sr-clex-hotchar-overlay 'face 'sr-clex-hotchar-face)
      (message
       <span class="string">"Sunrise: CLEX is now ON for keys: m f n d a p M F N D A P %%"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-clex-commit</span> (<span class="type">&amp;optional</span> _beg _end _range)
  <span class="string">"Commit the current CLEX operation (<span class="keyword elisp">if</span> any).
This function is added to the local `<span class="constant important">after-change-functions</span>' list
by `<span class="constant important">sr-clex-start</span>'."</span>
  (interactive)
  (<span class="keyword cl">when</span> sr-clex-on
    (setq sr-clex-on nil)
    (delete-overlay sr-clex-hotchar-overlay)
    (<span class="keyword elisp">let</span>* ((xchar (char-before))
           (expansion (<span class="keyword cl">case</span> xchar
                        (?m (sr-clex-marked       'left))
                        (?f (sr-clex-file         'left))
                        (?n (sr-clex-marked-nodir 'left))
                        (?d (sr-clex-dir          'left))
                        (?M (sr-clex-marked       'right))
                        (?F (sr-clex-file         'right))
                        (?N (sr-clex-marked-nodir 'right))
                        (?D (sr-clex-dir          'right))
                        (?a (sr-clex-marked       '(sr-this)))
                        (?A (sr-clex-dir          '(sr-this)))
                        (?p (sr-clex-marked       '(sr-other)))
                        (?P (sr-clex-dir          '(sr-other)))
                        (t nil))))
      (<span class="keyword cl">when</span> expansion
        (delete-char -2)
        (insert expansion)))))

(<span class="keyword">define-minor-mode</span> <span class="function">sr-term-char-minor-mode</span>
  <span class="string">"Sunrise Commander terminal add-on for character (raw) mode."</span>
  nil nil
  '((<span class="string">"\C-c\C-j"</span> . sr-term-line-mode)
    (<span class="string">"\C-c\C-k"</span> . sr-term-char-mode)
    (<span class="string">"\C-c\t"</span>   . sr-ti-change-window)
    (<span class="string">"\C-ct"</span>    . sr-term)
    (<span class="string">"\C-cT"</span>    . sr-term-cd)
    (<span class="string">"\C-c\C-t"</span> . sr-term-cd-newterm)
    (<span class="string">"\C-c\M-t"</span> . sr-term-cd-program)
    (<span class="string">"\C-c<span class="comment">;"</span>    . sr-follow-viewer)</span>
    (<span class="string">"\C-c\\"   . sr-ti-lock-panes)
    ("</span>\C-c{<span class="string">"    . sr-ti-min-lock-panes)
    ("</span>\C-c}<span class="string">"    . sr-ti-max-lock-panes)))

(<span class="keyword">define-minor-mode</span> <span class="function">sr-term-line-minor-mode</span>
  "</span>Sunrise Commander terminal add-on for line (cooked) mode.<span class="string">"
  nil nil
  '(([M-up]        . sr-ti-previous-line)
    ([A-up]        . sr-ti-previous-line)
    ("</span>\M-P<span class="string">"        . sr-ti-previous-line)
    ([M-down]      . sr-ti-next-line)
    ([A-down]      . sr-ti-next-line)
    ("</span>\M-N<span class="string">"        . sr-ti-next-line)
    ("</span>\M-\C-m<span class="string">"     . sr-ti-select)
    ("</span>\C-\M-j<span class="string">"     . sr-ti-select)
    ([M-return]    . sr-ti-select)
    ([S-M-return]  . sr-ti-select)
    ("</span>\M-M<span class="string">"        . sr-ti-mark)
    ([M-backspace] . sr-ti-unmark)
    ("</span>\M-\d<span class="string">"       . sr-ti-unmark)
    ("</span>\M-J<span class="string">"        . sr-ti-prev-subdir)
    ("</span>\M-U<span class="string">"        . sr-ti-unmark-all-marks)
    ([C-tab]       . sr-ti-change-window)
    ([M-tab]       . sr-ti-change-pane)
    ("</span>\C-c\t<span class="string">"      . sr-ti-change-window)
    ("</span>\C-ct<span class="string">"       . sr-term)
    ("</span>\C-cT<span class="string">"       . sr-term-cd)
    ("</span>\C-c\C-t<span class="string">"    . sr-term-cd-newterm)
    ("</span>\C-c\M-t<span class="string">"    . sr-term-cd-program)
    ("</span>\C-c<span class="comment">;<span class="string">"       . sr-follow-viewer)</span>
    ("</span>\M-\S-g<span class="string">"     . sr-ti-revert-buffer)
    ("</span>%<span class="string">"           . sr-clex-start)
    ("</span>\t<span class="string">"          . term-dynamic-complete)
    ("</span>\C-c\\"      . sr-ti-lock-panes)
    (<span class="string">"\C-c{"</span>       . sr-ti-min-lock-panes)
    (<span class="string">"\C-c}"</span>       . sr-ti-max-lock-panes))
  <span class="builtin">:group</span> 'sunrise)

(<span class="keyword">defadvice</span> <span class="function">term-sentinel</span> (around sr-advice-term-sentinel (proc msg) activate)
  <span class="string">"Take care of killing Sunrise Commander terminal buffers on exit."</span>
  (<span class="keyword elisp">if</span> (and (or sr-term-char-minor-mode sr-term-line-minor-mode)
           sr-terminal-kill-buffer-on-exit
           (memq (process-status proc) '(<span class="warning">signal</span> exit)))
      (<span class="keyword elisp">let</span> ((buffer (process-buffer proc)))
        ad-do-it
        (bury-buffer buffer)
        (kill-buffer buffer))
    ad-do-it))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Desktop support:</span>

(<span class="keyword">defun</span> <span class="function">sr-pure-virtual-p</span> (<span class="type">&amp;optional</span> buffer)
  <span class="string">"Return t if BUFFER (or the current buffer if nil) is purely virtual.
Purely virtual means it is not attached to any directory or any
file in the file system."</span>
  (<span class="keyword elisp">with-current-buffer</span> (<span class="keyword elisp">if</span> (bufferp buffer) buffer (current-buffer))
    (not (or (eq 'sr-mode major-mode)
             (and (eq 'sr-virtual-mode major-mode)
                  buffer-file-truename
                  (file-exists-p buffer-file-truename))))))

(<span class="keyword">defun</span> <span class="function">sr-desktop-save-buffer</span> (desktop-dir)
  <span class="string">"Return the additional data for saving a Sunrise buffer to a desktop file."</span>
  (<span class="keyword cl">unless</span> (sr-pure-virtual-p)
    (<span class="keyword elisp">let</span>* ((side (<span class="keyword elisp">if</span> (eq (current-buffer) sr-left-buffer) 'left 'right))
           (sorting-order (or (get side 'sorting-order) <span class="string">"NAME"</span>))
           (sorting-reverse (get side 'sorting-reverse)))
      (apply
       'append
       (delq nil
             (list
              (<span class="keyword elisp">if</span> (eq major-mode 'sr-virtual-mode)
                  (list 'dirs buffer-file-truename)
                (cons 'dirs (dired-desktop-buffer-misc-data desktop-dir)))
              (cons side t)
              (<span class="keyword elisp">if</span> sorting-order (cons 'sorting-order sorting-order))
              (<span class="keyword elisp">if</span> sorting-reverse (cons 'sorting-reverse sorting-reverse))
              (<span class="keyword elisp">if</span> (eq major-mode 'sr-virtual-mode) (cons 'virtual t))))
       (mapcar (<span class="keyword elisp">lambda</span> (fun)
                 (funcall fun desktop-dir))
               sr-desktop-save-handlers)))))

(<span class="keyword">defun</span> <span class="function">sr-desktop-restore-buffer</span> (desktop-buffer-file-name
                                  desktop-buffer-name
                                  desktop-buffer-misc)
  <span class="string">"Restore a Sunrise (normal or VIRTUAL) buffer from its desktop file data."</span>
  (<span class="keyword elisp">let</span>* ((sr-running t)
         (misc-data (cdr (assoc 'dirs desktop-buffer-misc)))
         (is-virtual (assoc 'virtual desktop-buffer-misc))
         (buffer
          (<span class="keyword elisp">if</span> (not is-virtual)
              (<span class="keyword elisp">with-current-buffer</span>
                  (dired-restore-desktop-buffer desktop-buffer-file-name
                                                desktop-buffer-name
                                                misc-data)
                (sr-mode)
                (current-buffer))
            (desktop-restore-file-buffer (car misc-data)
                                         desktop-buffer-name
                                         misc-data))))
    (<span class="keyword elisp">with-current-buffer</span> buffer
      (<span class="keyword cl">when</span> is-virtual (set-visited-file-name nil t))
      (mapc (<span class="keyword elisp">lambda</span> (side)
              (<span class="keyword cl">when</span> (cdr (assq side desktop-buffer-misc))
                (set (sr-symbol side 'buffer) buffer)
                (set (sr-symbol side 'directory) default-directory)
                (sr-desktop-sort buffer side desktop-buffer-misc)))
            '(left right))
      (mapc (<span class="keyword elisp">lambda</span> (fun)
              (funcall fun
                       desktop-buffer-file-name
                       desktop-buffer-name
                       desktop-buffer-misc))
            sr-desktop-restore-handlers))
    buffer))

(<span class="keyword">defun</span> <span class="function">sr-desktop-sort</span> (buffer side desktop-buffer-misc)
  <span class="string">"Restore the sorting order in BUFFER to be displayed in SIDE.
Use the data in DESKTOP-BUFFER-MISC to obtain all pertinent
details."</span>
  (<span class="keyword elisp">with-current-buffer</span> buffer
    (<span class="keyword elisp">let</span> ((sr-selected-window side)
          (sorting-order (cdr (assoc 'sorting-order desktop-buffer-misc)))
          (sorting-reverse (cdr (assoc 'sorting-reverse desktop-buffer-misc))))
      (<span class="keyword cl">when</span> sorting-order
        (<span class="keyword elisp">condition-case</span> nil
            (funcall (intern (format <span class="string">"sr-sort-by-%s"</span> (downcase sorting-order))))
          (<span class="warning">error</span> (ignore))))
      (<span class="keyword cl">when</span> sorting-reverse (sr-reverse-pane)))))

(<span class="keyword">defun</span> <span class="function">sr-reset-state</span> ()
  <span class="string">"Reset some environment variables that control the Sunrise behavior.
Used for desktop support."</span>
  (setq sr-left-directory <span class="string">"~/"</span> sr-right-directory <span class="string">"~/"</span>
        sr-this-directory <span class="string">"~/"</span> sr-other-directory <span class="string">"~/"</span>)
  (<span class="keyword elisp">if</span> sr-running (sr-quit))
  nil)

<span class="comment">;; This registers the previous functions in the desktop framework:</span>
(add-to-list 'desktop-buffer-mode-handlers
             '(sr-mode . sr-desktop-restore-buffer))

<span class="comment">;; This initializes (and sometimes starts) Sunrise after desktop restoration:</span>
(add-hook 'desktop-after-read-hook
          (<span class="keyword">defun</span> <span class="function">sr-desktop-after-read-function</span> ()
            (<span class="keyword cl">unless</span> (assoc 'sr-running desktop-globals-to-clear)
              (add-to-list 'desktop-globals-to-clear
                           '(sr-running . (sr-reset-state))))
            (<span class="keyword cl">when</span> (and (buffer-live-p sr-left-buffer)
                       (get-buffer-window sr-left-buffer))
              (sr-setup-windows)
              (sr-highlight)
              (setq sr-current-frame (window-frame (selected-window))
                    sr-running t))))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Miscellaneous functions:</span>

(<span class="keyword">defun</span> <span class="function">sr-buffer-files</span> (buffer-or-name)
  <span class="string">"Return the list of all file names currently displayed in the given buffer."</span>
  (<span class="keyword elisp">with-current-buffer</span> buffer-or-name
    (<span class="keyword elisp">save-excursion</span>
      (<span class="keyword elisp">let</span> ((result nil))
        (sr-beginning-of-buffer)
        (<span class="keyword elisp">while</span> (not (eobp))
          (setq result (cons (dired-get-filename t t) result))
          (forward-line 1))
        (reverse result)))))

(<span class="keyword">defun</span> <span class="function">sr-keep-buffer</span> (<span class="type">&amp;optional</span> side)
  <span class="string">"Keep the currently displayed buffer in SIDE (left or right) window.
Keeps it there even if it does not belong to the panel's history
ring. If SIDE is nil, use the value of `<span class="constant important">sr-selected-window</span>'
instead. Useful for maintaining the contents of the pane during
layout switching."</span>
  (<span class="keyword elisp">let</span>* ((side (or side sr-selected-window))
         (window (symbol-value (sr-symbol side 'window))))
    (set (sr-symbol side 'buffer) (window-buffer window))))

(<span class="keyword">defun</span> <span class="function">sr-scrollable-viewer</span> (buffer)
  <span class="string">"Set the `<span class="constant important">other-window-scroll-buffer</span>' variable to BUFFER.
Doing so allows to scroll the given buffer directly from the active pane."</span>
  (setq other-window-scroll-buffer buffer)
  (<span class="keyword elisp">if</span> buffer
      (message <span class="string">"QUICK VIEW: Press C-e/C-y to scroll, Space/M-Space to page, and C-u v (or C-u o) to dismiss"</span>)))

(<span class="keyword">defun</span> <span class="function">sr-describe-mode</span> ()
  <span class="string">"Call `<span class="constant important">describe-mode</span>' and make the resulting buffer C-M-v scrollable."</span>
  (interactive)
  (describe-mode)
  (sr-scrollable-viewer (get-buffer <span class="string">"*Help*"</span>))
  (sr-select-window sr-selected-window))

(<span class="keyword">defun</span> <span class="function">sr-equal-dirs</span> (dir1 dir2)
  <span class="string">"Return non-nil if the two paths DIR1 and DIR2 represent the same directory."</span>
  (string= (expand-file-name (concat (directory-file-name dir1) <span class="string">"/"</span>))
           (expand-file-name (concat (directory-file-name dir2) <span class="string">"/"</span>))))

(<span class="keyword">defun</span> <span class="function">sr-summary</span> ()
  <span class="string">"Summarize basic Sunrise commands and show recent Dired errors."</span>
  (interactive)
  (dired-why)
  (message <span class="string">"C-opy, R-ename, K-lone, D-elete, v-iew, e-X-ecute, Ff-ollow, \
Jj-ump, q-uit, m-ark, u-nmark, h-elp"</span>))

(<span class="keyword">defun</span> <span class="function">sr-restore-point-if-same-buffer</span> ()
  <span class="string">"Synchronize point position if the same buffer is displayed in both panes."</span>
  (<span class="keyword elisp">let</span> ((this-win)(other-win)(point))
    (<span class="keyword cl">when</span> (and (eq sr-left-buffer sr-right-buffer)
               (window-live-p (setq other-win (sr-other 'window))))
      (setq this-win (selected-window))
      (setq point (point))
      (select-window other-win)
      (goto-char point)
      (select-window this-win))))

(<span class="keyword">defun</span> <span class="function">sr-mark-toggle</span> ()
  <span class="string">"Toggle the mark on the current file or directory."</span>
  (interactive)
  (<span class="keyword cl">when</span> (dired-get-filename t t)
    (<span class="keyword elisp">if</span> (eq ?  (char-after (line-beginning-position)))
        (dired-mark 1)
      (dired-unmark 1))))

(<span class="keyword">defun</span> <span class="function">sr-assoc-key</span> (name alist test)
  <span class="string">"Return the key in ALIST matched by NAME according to TEST."</span>
  (<span class="keyword elisp">let</span> (head (tail alist) found)
    (<span class="keyword elisp">while</span> (and tail (not found))
      (setq head (caar tail)
            found (and (apply test (list head name)) head)
            tail (cdr tail)))
    found))

(<span class="keyword">defun</span> <span class="function">sr-get-marked-files</span> ()
  <span class="string">"Return current pane's *explicitly* selected entries, or nil if
no entries have been explicitly selected."</span>
  (<span class="keyword elisp">let</span> ((marked))
    (<span class="keyword elisp">condition-case</span> err
        (setq marked (dired-get-marked-files t nil nil t))
      (<span class="warning">error</span> (<span class="keyword cl">unless</span> (string= <span class="string">"No file on this line"</span> (cadr err))
               (<span class="warning">signal</span> (car err) (cdr err)))))
    (<span class="keyword cl">unless</span> (&lt; (length marked) 2)
      (<span class="keyword elisp">if</span> (eq t (car marked)) (setq marked (cdr marked)))
      marked)))

(<span class="keyword">defun</span> <span class="function">sr-quote-marked</span> ()
  <span class="string">"Return current pane's explicitly selected entries quoted and
space-separated as a string, or nil if no entries have been
explicitly selected."</span>
  (<span class="keyword elisp">let</span> ((marked (sr-get-marked-files)))
    (<span class="keyword cl">when</span> marked
      (format <span class="string">"\"%s\""</span> (mapconcat 'identity marked <span class="string">"\" \""</span>)))))

(<span class="keyword">defun</span> <span class="function">sr-fix-listing-switches</span>()
  <span class="string">"Work around a bug in Dired that makes `<span class="constant important">dired-move-to-filename</span>' misbehave
when any of the options -p or -F is used with ls."</span>
  (mapc (<span class="keyword elisp">lambda</span> (sym)
          (<span class="keyword elisp">let</span> ((val (replace-regexp-in-string <span class="string">"\\(?:^\\| \\)-[pF]*\\(?: \\|$\\)"</span> <span class="string">" "</span> (symbol-value sym))))
            (<span class="keyword elisp">while</span> (string-match <span class="string">"\\(?:^\\| \\)-[<span class="negation">^</span>- ]*[pF]"</span> val)
              (setq val (replace-regexp-in-string <span class="string">"\\(\\(?:^\\| \\)-[<span class="negation">^</span>- ]*\\)[pF]\\([<span class="negation">^</span> ]*\\)"</span> <span class="string">"\\1\\2"</span> val)))
            (set sym val)))
        '(sr-listing-switches sr-virtual-listing-switches))
  (remove-hook 'sr-init-hook 'sr-fix-listing-switches))
(add-hook 'sr-init-hook 'sr-fix-listing-switches)

(<span class="keyword">defun</span> <span class="function">sr-chop</span> (char path)
  <span class="string">"Remove all trailing instances of character CHAR from the string PATH."</span>
  (<span class="keyword elisp">while</span> (and (&lt; 1 (length path))
              (eq (string-to-char (substring path -1)) char))
    (setq path (substring path 0 -1)))
  path)

(<span class="keyword">defun</span> <span class="function">sr-flatlist</span> (in <span class="type">&amp;optional</span> out rev)
  <span class="string">"Flatten the nesting in an arbitrary list of values."</span>
  (<span class="keyword elisp">cond</span>
   ((and (null in) rev) out)
   ((null in) (nreverse out))
   (t
    (<span class="keyword elisp">let</span> ((head (car in)) (tail (cdr in)))
      (<span class="keyword elisp">if</span> (atom head)
          (sr-flatlist tail (cons head out) rev)
        (sr-flatlist tail (append (sr-flatlist head nil t) out) rev))))))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Advice</span>

(<span class="keyword">defun</span> <span class="function">sr-ad-enable</span> (regexp <span class="type">&amp;optional</span> function)
  <span class="string">"Put all or FUNCTION-specific advice matching REGEXP into effect.
If provided, only update FUNCTION itself, otherwise all functions
with advice matching REGEXP."</span>
  (<span class="keyword elisp">if</span> function
      (<span class="keyword elisp">progn</span> (ad-enable-advice function 'any regexp)
             (ad-activate function))
    (ad-enable-regexp regexp)
    (ad-activate-regexp regexp)))

(<span class="keyword">defun</span> <span class="function">sr-ad-disable</span> (regexp <span class="type">&amp;optional</span> function)
  <span class="string">"Stop all FUNCTION-specific advice matching REGEXP from taking effect.
If provided, only update FUNCTION itself, otherwise all functions
with advice matching REGEXP."</span>
  (<span class="keyword elisp">if</span> function
      (<span class="keyword elisp">progn</span> (ad-disable-advice function 'any regexp)
             (ad-update function))
    (ad-disable-regexp regexp)
    (ad-update-regexp regexp)))

(<span class="keyword">defun</span> <span class="function">sunrise-commander-unload-function</span> ()
  (sr-ad-disable <span class="string">"^sr-advice-"</span>))

<span class="comment">;;; ============================================================================</span>
<span class="comment">;;; Font-Lock colors &amp; styles:</span>

(<span class="keyword">defmacro</span> <span class="function">sr-rainbow</span> (symbol spec regexp)
  `(<span class="keyword elisp">progn</span>
     (<span class="keyword">defface</span> <span class="variable"></span>,symbol '((t ,spec)) <span class="string">"Sunrise rainbow face"</span> <span class="builtin">:group</span> 'sunrise)
     ,@(mapcar (<span class="keyword elisp">lambda</span> (m)
                 `(font-lock-add-keywords ',m '((,regexp 1 ',symbol))))
               '(sr-mode sr-virtual-mode))))

(sr-rainbow sr-html-face              (<span class="builtin">:foreground</span> <span class="string">"DarkOliveGreen"</span>)        <span class="string">"\\(^[<span class="negation">^</span>!].[<span class="negation">^</span>d].*\\.x?html?$\\)"</span>)
(sr-rainbow sr-xml-face               (<span class="builtin">:foreground</span> <span class="string">"DarkGreen"</span>)             <span class="string">"\\(^[<span class="negation">^</span>!].[<span class="negation">^</span>d].*\\.\\(xml\\|xsd\\|xslt?\\|wsdl\\)$\\)"</span>)
(sr-rainbow sr-log-face               (<span class="builtin">:foreground</span> <span class="string">"brown"</span>)                 <span class="string">"\\(^[<span class="negation">^</span>!].[<span class="negation">^</span>d].*\\.log$\\)"</span>)
(sr-rainbow sr-compressed-face        (<span class="builtin">:foreground</span> <span class="string">"magenta"</span>)               <span class="string">"\\(^[<span class="negation">^</span>!].[<span class="negation">^</span>d].*\\.\\(zip\\|bz2\\|t?[gx]z\\|[zZ]\\|[jwers]?ar\\|xpi\\|apk\\|xz\\)$\\)"</span>)
(sr-rainbow sr-packaged-face          (<span class="builtin">:foreground</span> <span class="string">"DarkMagenta"</span>)           <span class="string">"\\(^[<span class="negation">^</span>!].[<span class="negation">^</span>d].*\\.\\(deb\\|rpm\\)$\\)"</span>)
(sr-rainbow sr-encrypted-face         (<span class="builtin">:foreground</span> <span class="string">"DarkOrange1"</span>)           <span class="string">"\\(^[<span class="negation">^</span>!].[<span class="negation">^</span>d].*\\.\\(gpg\\|pgp\\)$\\)"</span>)

(sr-rainbow sr-directory-face         (<span class="builtin">:inherit</span> dired-directory <span class="builtin">:bold</span> t)    <span class="string">"\\(^[<span class="negation">^</span>!].d.*\\)"</span>)
(sr-rainbow sr-symlink-face           (<span class="builtin">:inherit</span> dired-symlink <span class="builtin">:italic</span> t)    <span class="string">"\\(^[<span class="negation">^</span>!].l.*[<span class="negation">^</span>/]$\\)"</span>)
(sr-rainbow sr-symlink-directory-face (<span class="builtin">:inherit</span> dired-directory <span class="builtin">:italic</span> t)  <span class="string">"\\(^[<span class="negation">^</span>!].l.*/$\\)"</span>)
(sr-rainbow sr-alt-marked-dir-face    (<span class="builtin">:foreground</span> <span class="string">"DeepPink"</span> <span class="builtin">:bold</span> t)      <span class="string">"\\(^[<span class="negation">^</span> *!D].d.*$\\)"</span>)
(sr-rainbow sr-alt-marked-file-face   (<span class="builtin">:foreground</span> <span class="string">"DeepPink"</span>)              <span class="string">"\\(^[<span class="negation">^</span> *!D].[<span class="negation">^</span>d].*$\\)"</span>)
(sr-rainbow sr-marked-dir-face        (<span class="builtin">:inherit</span> dired-marked)               <span class="string">"\\(^[*!D].d.*$\\)"</span>)
(sr-rainbow sr-marked-file-face       (<span class="builtin">:inherit</span> dired-marked <span class="builtin">:bold</span> nil)     <span class="string">"\\(^[*!D].[<span class="negation">^</span>d].*$\\)"</span>)
(sr-rainbow sr-broken-link-face       (<span class="builtin">:inherit</span> dired-warning <span class="builtin">:italic</span> t)    <span class="string">"\\(^[!].l.*$\\)"</span>)

(<span class="keyword">provide</span> '<span class="constant">sunrise-commander</span>)

<span class="comment">;;; sunrise-commander.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br />  <a rel="nofollow" class="translation new" href="http://www.emacswiki.org/emacs?action=translate;id=sunrise-commander.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh">Add Translation</a></span><div class="edit bar"><a href="http://www.emacswiki.org/emacs/Comments_on_sunrise-commander.el" accesskey="c" class="comment local edit">Talk</a> <a title="Click to edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=sunrise-commander.el" accesskey="e" rel="nofollow" class="edit">Edit this page</a> <a href="http://www.emacswiki.org/emacs?action=history;id=sunrise-commander.el" rel="nofollow" class="history">View other revisions</a> <a href="http://www.emacswiki.org/emacs?action=admin;id=sunrise-commander.el" class="admin" rel="nofollow">Administration</a></div><div class="time">Last edited 2015-06-22 20:36 UTC by <a title="89.68.157.234" href="http://www.emacswiki.org/emacs/Jos%c3%a9_A._Romero_L." class="author">José A. Romero L.</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=sunrise-commander.el">(diff)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
