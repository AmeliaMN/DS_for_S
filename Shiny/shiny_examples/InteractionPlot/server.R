library(shiny)
d1 <- read.csv("2013apidata.csv")
d1 <- d1[d1$RTYPE=="S",]
d1$cut1 <- rep(NA, times=length(d1$AVG_ED))

shinyServer(function(input, output) {
  cutInput <- reactive ({
    d1$cut1[d1[,input$variable]>=input$cutpoint] <- "Above"
    d1$cut1[d1[,input$variable]<input$cutpoint] <- "Below"
    d1$cut1 <- factor(d1$cut1)
    return(d1)
  })
  
  output$underlyingdist <- renderPlot({
    hist(d1[,input$variable], main= "",xlab="", ylab="")
    abline(v = input$cutpoint, col="red")
  })
  
  output$percens <- renderText({
    paste0(round(sum(cutInput()$cut1=="Below", na.rm=TRUE)/length(cutInput()$cut1)*100), "% of the data falls below and ",
    round(sum(cutInput()$cut1=="Above", na.rm=TRUE)/length(cutInput()$cut1)*100), "% above the cut point.")
  })
  
  modelInput <- reactive ({
    m1 <- lm(API13 ~ cut1+SD_SIG+cut1*SD_SIG, data=cutInput(), na.action='na.omit')
  })
  
  compare1 <- reactive ({
    ifelse(coef(modelInput())[[2]]>0,  "more", "less")
  })
  compare2 <- reactive ({
    ifelse(coef(modelInput())[[3]]>0,  "more", "less")
  })
  compare3 <- reactive ({
    ifelse(coef(modelInput())[[4]]>0,  "increased", "reduced")
  })
  compare4 <- reactive ({
    ifelse((coef(modelInput())[[3]]+coef(modelInput())[[4]])>0, "increase", "decrease")
  })
  
  output$rangeslider <- renderUI ({
   sliderInput("cutpoint", 
               "Cut point selection",
               min = range(d1[,input$variable], na.rm=TRUE)[1],
               max = range(d1[,input$variable], na.rm=TRUE)[2],
               value = mean(d1[,input$variable], na.rm=TRUE))
  })

  output$modelsummary <- renderTable({
    summary(modelInput())
  })
  output$interactionplot <- renderPlot({
    interaction.plot(cutInput()$cut1, cutInput()$SD_SIG, cutInput()$API13, xlab=paste(input$variable, "above and below cutpoint of", input$cutpoint), ylab="Mean of API score", trace.label="Significant number of \n disadvantaged students", ylim=c(600, 950))
  })
  
  
  output$interpretation <- renderText({
    paste0("Everything else held equal, schools whose ", input$variable, " is below ", input$cutpoint, " score on average ", round(abs(coef(modelInput())[[2]])), " points ", compare1(),  " on API, compared to schools
    where ", input$variable, " is above ", input$cutpoint, ". Everything else held equal, schools that have a significant number of socioeconomically disadvatanged students have API scores on average ",  round(abs(coef(modelInput())[[3]])), " points ", compare2(), " compared to 
    schools without a signficant number of socioeconomically disadvanted students. \n However, the effect of ", input$variable, " on API score is not the same for schools that have a significant number of disadvantaged students and those who do not. 
    For schools that have a significant number of scoioeconimically disadvantaged students, the effect of ", input$variable ," is ", compare3(), " by ", round(abs(coef(modelInput())[[4]])), " points. 
    In other words, for schools classified as having a significant number of disadvantaged students, API score for schools with below ",
    input$cutpoint, " ", input$variable, " would ", compare4(), " on average ", round(abs(coef(modelInput())[[3]]+coef(modelInput())[[4]])) , " points.")
  })


  
})
