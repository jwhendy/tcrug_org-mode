This repository accompanies a presentation for the [Twin Cities R User Group](http://www.meetup.com/twincitiesrug/) (TCRUG) on using Emacs [Org-mode](http://orgmode.org/) with R for task/notes management, data analysis, reproducible research, and document (presentation/report) generation.

This repository attempts to be reproducible with the following steps:
- clone it
- [install emacs](https://www.gnu.org/software/emacs/)
- install Org-mode [via git](http://orgmode.org/) or [ELPA](http://orgmode.org/elpa.html)

Now you're good to go. Start emacs and load the config file:

```
$ cd /path/to/tcrug_org-mode
$ emacs -l setup/example-config
```

Please take a look at the file `demo/org-demo_article.org`, as it contains a lot of configuration information, including additional libraries that are required if you desire to use feature such as `R`, `slidify`, `reveal.js`, etc.
