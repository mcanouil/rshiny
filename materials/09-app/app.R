library("shiny")

ui <- fluidPage(
  textInput("lastname", "Nom", value = ""),
  textInput("firstname", "Prénom", value = ""),
  numericInput("age", "Age", value = 0),
  radioButtons("sex", "Sexe", 
    choices = c("Femme", "Homme", "Ne sait pas"), 
    selected = "Ne sait pas"
  ),
  checkboxGroupInput("hobbies", "Loisirs", 
    choices = c("Vélo", "Rando", "Natation", "Badminton", "Autres")
  )
)

server <- function(input, output, session) { }

shinyApp(ui, server)
