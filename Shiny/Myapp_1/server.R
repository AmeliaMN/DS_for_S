counties <- readRDS("data/counties.rds")
source("helpers.R")
library(maps)
library(mapproj)

shinyServer(
  function(input, output){
    
    output$map <- renderPlot({
      
      data <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian)
      
      percent_map(data, "darkgreen", "% White")
    })
})
      