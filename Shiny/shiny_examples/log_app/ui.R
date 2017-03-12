library(shiny)



# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("Playing with logistic regression coefficients"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("const",
                  "Intercept:",
                  min = -15,
                  max = 15,
                  value = 7.4),
      sliderInput("slope",
                  "Slope:",
                  min=-0.3,
                  max=0.3,
                  value=-0.1218)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(fluidRow(
      splitLayout(cellWidths = c("50%", "50%"), plotOutput("distPlot"), plotOutput("logPlot"))
    )
    )
  )
))