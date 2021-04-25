library("shiny")

ui <- fluidPage(
  textInput("name", "Nom"),
  passwordInput("password", "Mot de passe"),
  textAreaInput("description", "Description", rows = 3)
)

server <- function(input, output, session) { }

shinyApp(ui, server)
