library("shiny")

ui <- fluidPage(
  checkboxInput(
    "bin1", 'Question binaire ("oui" par défaut)', value = TRUE
  ),
  checkboxInput("bin2", 'Question binaire ("non" par défaut)'),
  checkboxGroupInput("letters3", "Plusieurs Lettres", LETTERS[5:1])
)

server <- function(input, output, session) { }

shinyApp(ui, server)
