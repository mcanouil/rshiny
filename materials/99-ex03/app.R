library("shiny")

code_for_plot <- "plot(1:10)"

ui <- fluidPage(
  verbatimTextOutput("code"),
  plotOutput("plot")
)

server <- function(input, output, session) { 
  output$code <- renderText({ 
    code_for_plot
  })
  output$plot <- renderPlot({ 
    eval(parse(text = code_for_plot))
  })
}

shinyApp(ui, server)
