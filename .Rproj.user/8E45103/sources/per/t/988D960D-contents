#' ---
#' title: "A Web Application"
#' subtitle: "The Shiny Package"
#' author:
#'  - name: "Mickaël Canouil, *Ph.D.*"
#'    affiliation: "Université de Lille, CNRS, Institut Pasteur de Lille, UMR 8199 - EGID, F-59000, Lille, France."
#'    email: "mickael.canouil@cnrs.fr"
#' monofont: "Source Code Pro"
#' monofontoptions: "Scale=0.7"
#' output:
#'   bookdown::html_document2:
#'     theme: simplex
#'     toc: true
#'     toc_depth: 2
#'     toc_float: 
#'       collapsed: false
#'     fig_width: 6.3
#'     fig_height: 4.7
#'     number_sections: true
#'     self_contained: true
#'     mathjax: default
#'     df_print: kable
#'     keep_md: true
#' ---
#' 
#+ setup, include = FALSE
dir.create("images", showWarnings = FALSE)
knitr::opts_chunk$set(
  comment = "#>",
  fig.align = "center",
  fig.path = "images/"
)
#' 
#' # Introduction
#' 
#' Shiny is an R package that makes it easy to build interactive 
#' web apps straight from R. You can host standalone apps on a 
#' webpage or embed them in R Markdown documents or build dashboards. 
#' You can also extend your Shiny apps with CSS themes, 
#' htmlwidgets, and JavaScript actions. 
#' 
#' 
#' ## Installation
#' 
#' To install the stable version from CRAN, simply run the following from an R console:
#' 
#+ cran-install, eval = FALSE
install.packages("shiny")

#' To install the latest development builds directly from GitHub, run this instead:
#' 
#+ github-install, eval = FALSE 
if (!require("remotes")) install.packages("remotes")
remotes::install_github("rstudio/shiny")

#' Let's test `shiny` and look at an example (eleven built-in examples available).
#' 
#+ example-01, eval = FALSE
library(shiny)
runExample("01_hello")

#+ example-01-webshot, echo = FALSE, eval = FALSE
webshot::appshot(
  app = system.file("examples", "01_hello", package = "shiny"), 
  file = "images/01_hello.png"
)

#+ example-01-ui, echo = FALSE
cat(readLines(system.file("examples", "01_hello", "app.R", package = "shiny")), sep = "\n")
  
    
