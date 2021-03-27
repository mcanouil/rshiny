library("shiny")

ui <- fluidPage(
  plotOutput("plot", height = "300px")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    ###<b>
    withProgress(
      message = "importation des données ...", {
        for (i in seq_len(10)) {
          Sys.sleep(0.2)
          setProgress(i / 10, message = NULL)
        }
      }
    )
    ###</b>
    plot(1:10)
  })
}

shinyApp(ui, server)
