library("shiny")

ui <- fluidPage(
  textInput("name", "Tell me your Nom", value = "Default"),
  radioButtons("sex", "Sexe", 
    choices = c("Femme", "Homme", "Ne se prononce pas"), 
    selected = "Ne se prononce pas"
  ),
  checkboxGroupInput("loisir", "Vos loisirs", 
    choices = c("Vélo", "Rando", "Natation", "Badminton", "Karaté", "Autres")
  )
)

server <- function(input, output, session) { }

shinyApp(ui, server)
