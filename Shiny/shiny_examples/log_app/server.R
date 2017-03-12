library(mosaic)
data(Whickham)
Whickham <- Whickham %>%
  mutate(isAlive = 2 - as.numeric(outcome)) %>%
  mutate(ageGroup = cut(age, breaks=10))
binned.y <- mean(~isAlive | ageGroup, data=Whickham)
binned.x <- mean(~age | ageGroup, data=Whickham)


# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
   output$distPlot <- renderPlot({
     plot(Whickham$age, Whickham$isAlive, xlab="age", ylab="probability")
     curve(plogis(input$const + input$slope*x), from=18, to=84, add=TRUE, lwd=2, col="red")
   })
   output$logPlot <- renderPlot({
     plot(Whickham$age, input$const + input$slope*Whickham$age,ylab="log-odds", xlab="age", ylim=c(-10, 10),xlim=c(15,85), type="l", col="red")
     points(binned.x, logit(binned.y), type="p")
     })
})

