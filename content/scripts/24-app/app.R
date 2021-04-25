library("shiny")

code_for_plot <- "plot(1:10)"

ui <- fluidPage(titlePanel("Bienvenue"),
  sidebarLayout(
    sidebarPanel(
      textInput("lastname", "Nom", value = ""),
      textInput("firstname", "Prénom", value = ""),
      numericInput("age", "Age", value = 0),
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot")), 
        tabPanel("Code", verbatimTextOutput("code"))
      )
    )
  )
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
