#Rohan Gupta
#April 17, 2018
#Homework

#1.
#Made a UI that does nothing
library(shiny)
library(EBMAforecast)
data("presidentialForecast")
ui <- fluidPage(
  titlePanel("Presidential Forecasts"),
  sidebarLayout(
    sidebarPanel(
      helpText("Here are the results from presidential forecasts from 1952-2008")
    ),
    mainPanel(
      tableOutput("view")
    )
  )
)
server <- function(input, output) {
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  #2.
  #Showed last X elections selected by user
  output$view <- renderTable({
    presidentialForecast
  })
  
  #3.
  #Plotted election results
  output$plot <- renderPlot({
    plot(as.numeric(row.names(presidentialForecast)), presidentialForecast$Campbell)
  })
}
shinyApp(ui, server)