library("shiny")

ui <- fluidPage(
  textInput("lastname", "Nom :"),
  uiOutput("firstname"),
  uiOutput("age")
)

server <- function(input, output, session) {
  output$firstname <- renderUI({
    textInput("firstname", "Prénom :")
  })

  output$age <- renderUI({
    numericInput("age", "Age :", value = 0)
  })
}

shinyApp(ui, server)
