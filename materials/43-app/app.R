library("shiny")
library("dplyr")

ui <- fluidPage(theme = "bootstrap.min.css",
  fluidRow(
    column(4, offset = 5,
      selectInput("dataset", label = h3("Datasets"), 
        choices = ls("package:datasets"), 
        selected = "iris"
      )
    )
  ),
  fluidRow(
    column(6,
      h3("Summary"), 
      verbatimTextOutput("summary"),
      h3("Structure"), 
      verbatimTextOutput("structure")
    ),
    column(6,
      h3("Plot"), 
      numericInput("x", label = h4("X-axis column index"), value = 1),
      numericInput("y", label = h4("Y-axis column index"), value = 2),
      plotOutput("plot")
    )
  )
)

need_numeric <- function(data, input) {
  need(
    expr = is.numeric(data[, input]), 
    message = paste("Column", input, "is not a numeric!")
  )
}

need_in <- function(data, input) {
  need(
    expr = input %in% 1:ncol(data), 
    message = paste("Column", input, "is not available!")
  )
}

server <- function(input, output, session) { 
  dataset <- reactive({ get(input$dataset, "package:datasets") })
  output$summary <- renderPrint({ summary(dataset()) })
  output$structure <- renderPrint({ str(dataset()) })
  output$plot <- renderPlot({
    ###<b>
    validate(
      need_in(dataset(), input$x),
      need_in(dataset(), input$y)
    )
    validate(
      need_numeric(dataset(), input$x),
      need_numeric(dataset(), input$y)
    )
    ###</b>
    plot(dataset()[, input$x], dataset()[, input$y]) 
  })
}

shinyApp(ui, server)
