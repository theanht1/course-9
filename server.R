# Preprocess and build model
library(caret)
set.seed(7395)
data <- read.csv("Galton.csv")
data$Gender <- as.factor(data$Gender)
in_train <- createDataPartition(data$Height, p = 0.8, list = FALSE)
train <- data[in_train, ]
test <- data[-in_train, ]

mod_lm <- train(Height ~ Father + Mother + Gender, data = train, method = "lm")
pred <- predict(mod_lm, newdata = test)
rms <- sqrt(mean((pred - test$Height) ^ 2))

# Shiny server
library(shiny)
shinyServer(
    function(input, output) {
        user_input <- reactive(data.frame("Father" = input$father, "Mother" = input$mother, "Gender" = input$gender))
        output$table <- renderTable({user_input()})
        child_height <- reactive(predict(mod_lm, newdata = user_input()))
    
        output$child_height <- renderText(paste("The height of child is :", round(child_height(),2),"inch"))
    }
)