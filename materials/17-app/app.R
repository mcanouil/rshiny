library("shiny")

ui <- fluidPage(
  textInput("lastname", "Nom", value = "Nom"),
  textInput("firstname", "Prénom", value = "Prénom"),
  ###<b>
  textOutput("greetings"),
  ###</b>
  numericInput("age", "Age", value = 0),
  radioButtons("sex", "Sexe", 
    choices = c("Femme", "Homme", "Ne sait pas"), 
    selected = "Ne se prononce pas"
  ),
  checkboxGroupInput("hobbies", "Loisirs", 
    choices = c("Vélo", "Rando", "Natation", "Badminton", "Autres")
  )
)

server <- function(input, output, session) { 
  ###<b>
  output$greetings <- renderText({ 
    sample(c(
    "Bonjour !", "Bienvenue !", "Hello !", 
    "Salutations !", "Comment allez-vous ?",
    "Heu, vous êtes qui ?"
    ), 1)
  })
  ###</b>
}

shinyApp(ui, server)
