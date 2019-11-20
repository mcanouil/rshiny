library("shiny")

ui <- fluidPage(
  textInput("lastname", "Nom :"),
  ###<b>
  uiOutput("firstname"),
  ###</b>
  uiOutput("age")
)

server <- function(input, output, session) {
  ###<b>
  output$firstname <- renderUI({
    textInput("firstname", "Prénom :")
  })
  ###</b>
  output$age <- renderUI({
    numericInput("age", "Age :", value = 0)
  })
}

shinyApp(ui, server)
