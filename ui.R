
library(shiny)
library(shinythemes)

shinyUI(fluidPage(
        column(6, offset = 4, titlePanel(" ")),
        theme = shinytheme("cerulean"),
 
    mainPanel(offset=4,align="center",
            h1("Next Word Prediction"),
            h1(""),
            textAreaInput("text","Enter text here:"),
            h2(textOutput("predicted"),
            hr(),
            h4("Enter any text and we will suggest 3 possible next words for you."),
            h6("Developed by: 
               ML Valencia, 2019")
               ),width=12
    )
)
)