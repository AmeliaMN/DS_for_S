#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond price data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("adjust",
                   "Adjustment of the bandwidth",
                   min = 0.1,
                   max = 5,
                   step = 0.1,
                   value = 1, 
                   post = " times"),
       selectInput("kernel", 
                   "Smoothing kernel",
                   c("gaussian", "epanechnikov", "rectangular",
                     "triangular", "biweight",
                     "cosine", "optcosine"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
