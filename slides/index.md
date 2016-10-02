---
title       : Children Height Prediction
subtitle    : 
author      : Anh Mai
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

* The data for prediction is Galton's data set
* It includes 898 cases of 6 variables
* In this app, I focus on parents height (`Father` and ` Mother`) and children gender (`Gender`) in order to predict children height (`Height`)

--- .class #id 

## Building model

* I use simple linear regression method to build a model for prediction

* Firstly, I split data to training and test set for validation,


```r
library(caret)
data <- read.csv("Galton.csv")
set.seed(7395)
in_train <- createDataPartition(data$Height, p = 0.8, list = FALSE)
train <- data[in_train, ]
test <- data[-in_train, ]
```

* Build model

```r
mod_lm <- train(Height ~ Father + Mother + Gender, data = train, method = "lm")
```

---

## Evaluation

* Prection for test set

```r
pred <- predict(mod_lm, newdata = test)
```

* Evaluate result by root-mean-squared error

```r
rms <- sqrt(mean((pred - test$Height) ^ 2))
rms
```

```
## [1] 2.145169
```

---

## Shiny app

* I've created and deployed an app for this prediction in this [URL] (https://theanht1.shinyapps.io/Children_Height_Prediction/)

* This app requires users giving the height of parents and gender of child then it indicates the predicted height for this child.