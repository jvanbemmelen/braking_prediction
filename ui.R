#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Braking Distance Prediction"),
  p("This page allows you to predict a car's braking distance by its speed, using a regression model build on the cars dataset."),
  p("Fill in the car's speed to get the predicted braking distance."),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("speed",
                   "Speed (mph)",
                   15,
                   min = 0),
      submitButton("Predict braking distance!")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       verbatimTextOutput("text")
    )
  )
))
