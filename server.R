library(shiny)

# Define server logic for generting historgram of dice rolls
shinyServer(function(input, output) {
    
    # Expression that generates a histogram. The expression is
    # wrapped in a call to renderPlot to indicate that:
    #
    #  1) It is "reactive" and therefore should re-execute automatically
    #     when inputs change
    #  2) Its output type is a plot
    
    output$inputValue <- renderPrint(input$num_rolls)
 
    res <- reactive({ sample(1:6, size = input$num_rolls, replace = TRUE) + sample(1:6, size = input$num_rolls, replace = TRUE) })
    
    output$meanValue <- renderPrint(mean(res()))
    
    output$sdValue <- renderPrint(sd(res()))
    
    output$distPlot <- renderPlot({   
        # draw the histogram with the specified number of dice rolls
        hist(res(), breaks=12, col = 'skyblue', border = 'white', xlab="Roll Result",
             ylab="Frequency", main="Histogram of Dice Rolls")
    })
})