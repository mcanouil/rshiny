library("shiny")

code_for_plot <- c("plot(1:10)", "plot(1:100)")

ui <- fluidPage(
  titlePanel("Bienvenue"),
  navlistPanel(
    "Partie A",
    tabPanel("Plot 1", plotOutput("plot1")),
    tabPanel("Code 1", verbatimTextOutput("code1")),
    "Partie B",
    tabPanel("Plot 2", plotOutput("plot2")),
    tabPanel("Code 2", verbatimTextOutput("code2"))
  )
)

server <- function(input, output, session) { 
  output$code1 <- renderText({ code_for_plot[1] })
  output$plot1 <- renderPlot({ eval(parse(text = code_for_plot[1])) })
  output$code2 <- renderText({ code_for_plot[2] })
  output$plot2 <- renderPlot({ eval(parse(text = code_for_plot[2])) })
}

shinyApp(ui, server)
