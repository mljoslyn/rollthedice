library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Roll the Dice!"),
    
    # Sidebar with a slider input for the number of dice to roll
    sidebarLayout(
        sidebarPanel(
            p("Select the number of rolls of a pair of dice in the slider below.  The mean, standard deviation, and histogram of the resulting simulated dice rolls will be calculated and displayed on the right."),
            sliderInput("num_rolls",
                        "Number of dice rolls:",
                        min = 1,
                        max = 10000,
                        value = 100)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h3("Results of Dice Roll"),
            h4("Dice rolls requested:"),
            verbatimTextOutput("inputValue"),
            h4("Mean:"),
            verbatimTextOutput("meanValue"),
            h4("Standard Deviation:"),
            verbatimTextOutput("sdValue"),
            h4("Roll Distribution:"),
            plotOutput("distPlot")
        )
    )
))