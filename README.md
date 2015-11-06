This repository accompanies a presentation for the [Twin Cities R User Group](http://www.meetup.com/twincitiesrug/) (TCRUG) on using Emacs [Org-mode](http://orgmode.org/) with R for task/notes management, data analysis, reproducible research, and document (presentation/report) generation.

This repository is reproducible with the following steps:
- clone it
- [install emacs](https://www.gnu.org/software/emacs/)
- install Org-mode [via git](http://orgmode.org/) or [ELPA](http://orgmode.org/elpa.html)
- edit the file =.emacs-config=:

 ```
;; lines beginning with ";;" are comments

;; if you used git to clone the Org-mode repo, uncomment/change the
;; following line to point to the org-mode/lisp directory
;; if you used ELPA, you're good to go (leave these commented)
;; (add-to-list 'load-path "~/.elisp/org-mode/lisp/")
;; (add-to-list 'load-path "~/.elisp/org-mode/contrib/lisp")
```

Now you're good to go. Start emacs and load the config file:

```
$ =emacs -Q
$ M-x load-file /path/to/tcrug_org-mode/.emacs-config
```



