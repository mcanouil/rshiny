library("shiny")

ui <- fluidPage(
  selectInput("letters", "Lettres minuscules", head(letters)),
  radioButtons("letters2", "Lettres majuscules", LETTERS[1:5])
)

server <- function(input, output, session) { }

shinyApp(ui, server)
