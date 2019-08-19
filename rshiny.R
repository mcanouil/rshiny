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
#'     toc_depth: 3
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

#' ## Load Shiny
#+ shiny-load
library(shiny)

#' ## Built-in examples {.tabset .tabset-pills}
#' 
#' A Shiny app is built with two pieces:
#' 
#' + a `ui` (*i.e.*, user interface), how and where output have to be displayed.
#' + a `server`, where computations happen.
#' 
#+ app, eval = FALSE
shinyApp(ui = ui, server = server)

#'
#' Let's test `shiny` and look at some examples (eleven built-in examples available):
#'  
#+ example-list, results = "asis", echo = FALSE
cat(paste("+", list.files(system.file("examples", package = "shiny"))), sep = "\n")

#'
#' ### "hello" {- .tabset}
#' 
#+ example-01, eval = FALSE
runExample("01_hello")

#+ example-01-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "01_hello", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/01_hello.png", 
)

#' ![](images/01_hello.png)
#' 
#' #### ui {-}
#' 
#+ example-01-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "01_hello", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# *", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-01-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "timer" {- .tabset}
#' 
#+ example-11, eval = FALSE
runExample("11_timer")

#+ example-11-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "11_timer", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 110 * 1.5,
  vheight = 4.7 * 110 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/11_timer.png", 
)

#' ![](images/11_timer.png)
#' 
#' #### ui {-}
#' 
#+ example-11-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "11_timer", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-11-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "text" {- .tabset}
#' 
#+ example-02, eval = FALSE
runExample("02_text")

#+ example-02-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "02_text", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/02_text.png", 
)

#' ![](images/02_text.png)
#' 
#' #### ui {-}
#' 
#+ example-02-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "02_text", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-02-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "reactivity" {- .tabset}
#' 
#+ example-03, eval = FALSE
runExample("03_reactivity")

#+ example-03-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "03_reactivity", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/03_reactivity.png", 
)

#' ![](images/03_reactivity.png)
#' 
#' #### ui {-}
#' 
#+ example-03-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "03_reactivity", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-03-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "mpg" {- .tabset}
#' 
#+ example-04, eval = FALSE
runExample("04_mpg")

#+ example-04-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "04_mpg", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/04_mpg.png", 
)

#' ![](images/04_mpg.png)
#' 
#' #### ui {-}
#' 
#+ example-04-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "04_mpg", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-04-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "sliders" {- .tabset}
#' 
#+ example-05, eval = FALSE
runExample("05_sliders")

#+ example-05-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "05_sliders", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/05_sliders.png", 
)

#' ![](images/05_sliders.png)
#' 
#' #### ui {-}
#' 
#+ example-05-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "05_sliders", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-05-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "tabsets" {- .tabset}
#' 
#+ example-06, eval = FALSE
runExample("06_tabsets")

#+ example-06-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "06_tabsets", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/06_tabsets.png", 
)

#' ![](images/06_tabsets.png)
#' 
#' #### ui {-}
#' 
#+ example-06-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "06_tabsets", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-06-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "widgets" {- .tabset}
#' 
#+ example-07, eval = FALSE
runExample("07_widgets")

#+ example-07-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "07_widgets", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/07_widgets.png", 
)

#' ![](images/07_widgets.png)
#' 
#' #### ui {-}
#' 
#+ example-07-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "07_widgets", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-07-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

# #'
# #' ### "html" {- .tabset}
# #' 
# #+ example-08, eval = FALSE
# runExample("08_html")
# 
# #+ example-08-webshot, echo = FALSE
# webshot::appshot(
#   app = system.file("examples", "08_html", package = "shiny"), 
#   delay = 1,
#   vwidth = 6.3 * 100 * 1.5,
#   vheight = 4.7 * 100 * 1.5,
#   envvars = c(display.mode = "normal"),
#   file = "images/08_html.png", 
# )
# 
# #' ![](images/08_html.png)
# #' 
# #' #### ui {-}
# #' 
# #+ example-08-ui, echo = FALSE, comment = ""
# ex_app <- readLines(system.file("examples", "08_html", "app.R", package = "shiny"))
# ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
# cat(ex_app[grep("ui = ", ex_app)], sep = "\n")

#' #### server {-}
#' 
#+ example-08-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "upload" {- .tabset}
#' 
#+ example-09, eval = FALSE
runExample("09_upload")

#+ example-09-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "09_upload", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/09_upload.png", 
)

#' ![](images/09_upload.png)
#' 
#' #### ui {-}
#' 
#+ example-09-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "09_upload", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-09-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")

#'
#' ### "download" {- .tabset}
#' 
#+ example-10, eval = FALSE
runExample("10_download")

#+ example-10-webshot, echo = FALSE
webshot::appshot(
  app = system.file("examples", "10_download", package = "shiny"), 
  delay = 1,
  vwidth = 6.3 * 100 * 1.5,
  vheight = 4.7 * 100 * 1.5,
  selector = ".container-fluid",
  envvars = c(display.mode = "normal"),
  file = "images/10_download.png", 
)

#' ![](images/10_download.png)
#' 
#' #### ui {-}
#' 
#+ example-10-ui, echo = FALSE, comment = ""
ex_app <- readLines(system.file("examples", "10_download", "app.R", package = "shiny"))
ex_app <- ex_app[-c(grep("# ", ex_app), which(nchar(ex_app) == 0))]
cat(ex_app[grep("^ui <- ", ex_app):grep("^)$", ex_app)[1]], sep = "\n")

#' #### server {-}
#' 
#+ example-10-server, echo = FALSE, comment = ""
cat(ex_app[grep("^server <- ", ex_app):grep("^}$", ex_app)[1]], sep = "\n")
