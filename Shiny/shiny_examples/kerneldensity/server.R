#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
  
    price    <- diamonds$price

    
    # make kernel density
    plot(density(diamonds$price, kernel=input$kernel, adjust=input$adjust), 
         ylim=c(0, 0.0004), 
         xlim=c(0, 20000),
         main="Kernel density of prices from diamonds data")
    
  })
  
})
