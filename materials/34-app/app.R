library("shiny")

ui <- fluidPage(
  plotOutput("plot", height = "300px")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    ###<b>
    id <- showNotification(
      ui = "Importation des données ...", 
      duration = NULL, closeButton = FALSE
    )
    on.exit(removeNotification(id), add = TRUE)
    ###</b>
    Sys.sleep(5)
    plot(1:10)
  })
}

shinyApp(ui, server)
