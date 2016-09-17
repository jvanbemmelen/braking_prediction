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
data(cars)

fit <- lm(dist~speed,cars)
intercept <- fit$coefficients[1]
slope <- fit$coefficients[2]
g <- ggplot(data=cars, aes(speed,dist))+geom_point() + geom_abline(intercept = intercept, slope = slope)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  predicted_distance <- reactive({
    new_data <- data.frame(speed = c(input$speed))
    braking_distance <- predict(fit, newdata = new_data)
  })
  
  output$distPlot <- renderPlot({
    braking_distance <- predicted_distance()
    new_point <- data.frame(speed = input$speed, dist = braking_distance)
    g+geom_point(data=new_point, colour="red", size=5)
  })
  
  output$text <- renderText({
    braking_distance <- predicted_distance()
    paste("Your predicted braking distance is:", braking_distance,"ft")
  })
  
})