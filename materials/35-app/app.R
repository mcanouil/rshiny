library("shiny")

ui <- fluidPage(
  actionButton("update", "Actualiser"),
  textInput("name", "Prénom : ", value = "Mickaël"),
  p(
    "Résultat `reactive` : ", 
    textOutput("hello", inline = TRUE)
  ),
  p(
    "Résultat `eventReactive` : ", 
    textOutput("hello_event", inline = TRUE)
  )
)

server <- function(input, output, session) {
  text <- reactive({ paste("Bonjour", input$name, "!") })
  output$hello <- renderText({ text() })
  
  text_event <- eventReactive(input$update, { 
    paste("Bonjour", input$name, "!") 
  })
  output$hello_event <- renderText({ text_event() })
  
  observeEvent(input$update, { 
    message("Mise à jour effectuée !") 
  })
}

shinyApp(ui, server)
