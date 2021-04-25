library("shiny")

ui <- fluidPage(
  dateInput("uniq_date", "Date unique"),
  dateRangeInput("period", "Période")
)

server <- function(input, output, session) { }

shinyApp(ui, server)
