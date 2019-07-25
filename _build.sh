#!/bin/sh

Rscript -e "rmarkdown::render('rshiny.R',  encoding = 'UTF-8')" \
  && head -n -6 rshiny.md | tail -n +30 > README.md \
  && rm rshiny.md
