library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Children Height Prediction"),
    sidebarPanel(
        h2("Input"),
        sliderInput("father", "Father height (in inch)", value = 69, min = 60, max = 80, step = 0.1),
        sliderInput("mother", "Mother height (in inch)", value = 64, min = 60, max = 80, step = 0.1),
        selectInput("gender", "Child gender", c("Male" = "M", "Female" = "F"))
    ),
    mainPanel(
        h2("Introduction"),
        p("This app predicts children height based on their parent by using linear model. The data for building model is from Galton's data set"),
        h2("How to use"),
        p("1. Move the slider to choose parent height"),
        p("2. Choose children gender"),
        h2("User input"),
        tableOutput("table"),
        h2("Child height"),
        textOutput("child_height")
    )
))