library("shiny")

ui <- fluidPage(
  actionButton("update", "Actualiser"),
  textInput("name", "Prénom : ", value = "Mickaël"),
  p("Résultat `reactive` : ", textOutput("hello", inline = TRUE)),
  p("Résultat `eventReactive` : ", textOutput("hello_event", inline = TRUE))
)

server <- function(input, output, session) {
  ###<b>
  text <- reactive({ paste("Bonjour", input$name, "!") })
  ###</b>
  output$hello <- renderText(text())
  
  ###<b>
  text_event <- eventReactive(input$update, { paste("Bonjour", input$name, "!") })
  ###</b>
  output$hello_event <- renderText(text_event())
  
  ###<b>
  observeEvent(input$update, { message("Mise à jour effectuée !") })
  ###</b>
}

shinyApp(ui, server)
