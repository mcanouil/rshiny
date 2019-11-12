library("shiny")
library("shinydashboard")

###<b>
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)
###</b>

server <- function(input, output) { }

shinyApp(ui, server)
