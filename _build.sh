#!/bin/sh

Rscript -e "rmarkdown::render('rshiny.Rmd',  encoding = 'UTF-8')" \
  && head -n -6 rshiny.md | tail -n +30 > README.md \
  && rm rshiny.md
