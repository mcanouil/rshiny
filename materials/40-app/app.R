library("shiny")

ui <- fluidPage(
  plotOutput("plot", height = "400px")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    id <- showNotification(
      ui = "Importation des données ...", 
      duration = NULL, closeButton = FALSE
    )
    on.exit(removeNotification(id), add = TRUE)
    Sys.sleep(10)
    plot(1:10)
  })
}

shinyApp(ui, server)
