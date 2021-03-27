library("shiny")

ui <- fluidPage(
  textInput("lastname", "Nom", value = "Nom"),
  textInput("firstname", "Prénom", value = "Prénom"),
  textOutput("greetings"),
  numericInput("age", "Age", value = 0),
  radioButtons("sex", "Sexe", 
    choices = c("Femme", "Homme", "Ne sait pas"), 
    selected = "Ne sait pas"
  ),
  checkboxGroupInput("hobbies", "Loisirs", 
    choices = c(
      "Vélo", "Rando", "Natation", 
      "Badminton", "Autres"
    )
  )
)

server <- function(input, output, session) { 
  output$greetings <- renderText({ 
    sample(c(
    "Bonjour !", "Bienvenue !", "Hello !", 
    "Salutations !", "Comment allez-vous ?",
    "Heu, vous êtes qui ?"
    ), 1)
  })
}

shinyApp(ui, server)
