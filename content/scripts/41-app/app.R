library("shiny")

ui <- fluidPage(
  plotOutput("plot", height = "400px")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    withProgress(
      message = "Importation des données ...", {
        for (i in seq_len(10)) {
          Sys.sleep(0.5)
          setProgress(i / 10)
        }
      }
    )
    plot(1:10)
  })
}

shinyApp(ui, server)
