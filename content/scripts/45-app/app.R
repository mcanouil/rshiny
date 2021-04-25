library("shiny")

ui <- fluidPage(
  fluidRow(
    column(6, textInput("lastname", "Nom :"), uiOutput("firstname")),
    column(6, uiOutput("input_age"), uiOutput("age"))
  )
)

server <- function(input, output, session) {
  output$firstname <- renderUI({
    req(input$lastname)
    textInput("firstname", "Prénom :")
  })
  output$input_age <- renderUI({
    req(input$firstname)
    selectInput("type", "type", c("slider", "numeric"))
  })
  output$age <- renderUI({
    req(input$type, input$firstname)
    if (input$type == "slider") {
      sliderInput("age", "Age :", 
        value = isolate(input$age), min = 0, max = 99
      )
    } else {
      numericInput("age", "Age :", value = isolate(input$age))  
    }
  })
}

shinyApp(ui, server)
