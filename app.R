#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#Libraries
library(shiny)
library(tidyverse)
library(readr)
data <- read_csv("vgsales-12-4-2019-v3.csv")
data <- na.omit(data)
#UI set up
ui <- fluidPage(
    #Title
    titlePanel("Vidya Games"),
    #Sidebar set up
    sidebarLayout(
        sidebarPanel(
            #Variable choices
            selectInput("p","p",choices = colnames(data[3:5])),
            #Color choices
            selectInput("select", h3("Select box"),
                        choices = c("red","green","purple"),
                        selected = "green"
            )
        ),
        #Outputs the graph on the main panel
        mainPanel(
            plotOutput("myplot")),
    )
)
#Server set up
server <- function(input, output, session) {
    #Outputs boxplot
    output$myplot <- renderPlot({
        boxplot(Critic_Score ~ get(input$p), data = data, col = input$select)
    })
}

shinyApp(ui, server)




