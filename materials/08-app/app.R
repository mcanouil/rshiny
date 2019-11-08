library("shiny")

ui <- fluidPage(
  fileInput("upload", NULL),
  actionButton("click", "Cliquez ici !", icon = icon("mouse-pointer")),
  p( actionLink("click", "Cliquez ici !", icon = icon("home")) )
)

server <- function(input, output, session) { }

shinyApp(ui, server)
