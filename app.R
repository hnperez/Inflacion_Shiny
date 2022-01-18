#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

setwd("C:/Users/JOvissnoel/Documents/Rproyectos/Rgit/PLot_inflacion")
datainflacion<-read.csv("inflacionvzla.csv", header= TRUE, dec=",", sep=";")
inflacion$fecha=as.Date(inflacion$fechafinal)

# Define UI for application that draws a histogram
ui <- fluidPage(dateRangeInput(inputId="rangofecha", label="seleccione fechas", min = "2008-12-01",
                               max    = "2021-12-31", format= "mm"),
                              plotOutput(outputId="graficomes"))

# Define server logic required to draw a histogram
server <- function(input, output) {
  subinflacion<-inflacion[inflacion$fecha>=input$rangofecha[1] & inflacion$fecha<=input$rangofecha[2] ,]
    output$graficomes <- renderPlot({ggplot(subinflacion, aes(fecha,infmensual)) + geom_line()})
}

# Run the application 
shinyApp(ui = ui, server = server)



