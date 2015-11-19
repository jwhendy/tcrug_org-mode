---
title       : Org-mode + R = awesome!
subtitle    : 
author      : John Henderson
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

# 

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

---

# the life of a product developer

Stuff I do in the course of my work (probably not that different from you!):

## direct

-   write up experimental plans
-   do experiments
-   collect and analyze data
-   writeup reports and presentations
-   collaborate with colleagues

---

# the life of a product developer

## indirect

-   record all sorts info
-   meeting notes
-   todos
-   store contact info/notes
-   what to work on and when

---

# but what the hell does emacs have to do with it?

Believe it or not, I *learned Emacs* for `org-mode`. To date, it's the *only* solution I'm
aware of that allows for all of the following in one place:

-   notes
-   todos/time stamping/deadlines
-   tags
-   embedded code + execution
-   export to multiple formats, with images, links, table of contents, automatically
    generated code blocks and/or results&#x2026;

*Pretty cool!*

---

# some competition

I've always been a note taker as I like to refer to the past&#x2026; you never know what
might be useful in the future! I tried all sorts of programs:

## recording work

-   Word/Writer
-   [zim](http://zim-wiki.org/) (personal wiki)
-   [Evernote](https://evernote.com/)
-   [TiddlyWiki](http://tiddlywiki.com/)
-   [RStudio](https://www.rstudio.com/)?

---

# some competition

## todo s

-   [`todo.txt`](http://todotxt.com/)
-   [Chandler](https://en.wikipedia.org/wiki/Chandler_(software))
-   [iGTD](https://itunes.apple.com/us/app/igtd/id488595283?mt=8)
-   [TiddlyWiki](http://tiddlywiki.com/)

---

# ok, so what is it?

`Org-mode` is a major mode for the Emacs text editor.

-   it uses markup to allow for structuring

    * ok, so what is it?                          # heading
    
    =Org-mode= is a major mode for the Emacs text editor.
    - it uses markup to allow for structuring     # unordered list