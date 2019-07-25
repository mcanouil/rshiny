# Introduction

Shiny is an R package that makes it easy to build interactive 
web apps straight from R. You can host standalone apps on a 
webpage or embed them in R Markdown documents or build dashboards. 
You can also extend your Shiny apps with CSS themes, 
htmlwidgets, and JavaScript actions. 


## Installation

To install the stable version from CRAN, simply run the following from an R console:



```r
install.packages("shiny")
```

To install the latest development builds directly from GitHub, run this instead:



```r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("rstudio/shiny")
```

Let's test `shiny` and look at an example (eleven built-in examples available).



```r
library(shiny)
runExample("01_hello")
```


```
#> library(shiny)
#> 
#> # Define UI for app that draws a histogram ----
#> ui <- fluidPage(
#> 
#>   # App title ----
#>   titlePanel("Hello Shiny!"),
#> 
#>   # Sidebar layout with input and output definitions ----
#>   sidebarLayout(
#> 
#>     # Sidebar panel for inputs ----
#>     sidebarPanel(
#> 
#>       # Input: Slider for the number of bins ----
#>       sliderInput(inputId = "bins",
#>                   label = "Number of bins:",
#>                   min = 1,
#>                   max = 50,
#>                   value = 30)
#> 
#>     ),
#> 
#>     # Main panel for displaying outputs ----
#>     mainPanel(
#> 
#>       # Output: Histogram ----
#>       plotOutput(outputId = "distPlot")
#> 
#>     )
#>   )
#> )
#> 
#> # Define server logic required to draw a histogram ----
#> server <- function(input, output) {
#> 
#>   # Histogram of the Old Faithful Geyser Data ----
#>   # with requested number of bins
#>   # This expression that generates a histogram is wrapped in a call
#>   # to renderPlot to indicate that:
#>   #
#>   # 1. It is "reactive" and therefore should be automatically
#>   #    re-executed when inputs (input$bins) change
#>   # 2. Its output type is a plot
#>   output$distPlot <- renderPlot({
#> 
#>     x    <- faithful$waiting
#>     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#> 
#>     hist(x, breaks = bins, col = "#75AADB", border = "white",
#>          xlab = "Waiting time to next eruption (in mins)",
#>          main = "Histogram of waiting times")
#> 
#>     })
#> 
#> }
#> 
#> # Create Shiny app ----
#> shinyApp(ui = ui, server = server)
```

