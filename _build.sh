#!/bin/sh

Rscript -e "rmarkdown::render('rshiny.Rmd', output_file = 'page.html', output_format = 'html_document',  encoding = 'UTF-8')"

Rscript -e "rmarkdown::render('rshiny.Rmd', output_format = 'html_document',  encoding = 'UTF-8')"
