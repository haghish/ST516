#Make Sure This is the Current Working Directory to import the Markdown File

library(markdown)
library(shiny)

ui <- fluidPage(
    numericInput('num', 'Sample size', 100, min = 1),
    checkboxInput("checkbox", label = "Plot the simulation", value = TRUE),
    numericInput('spl', 'Split by every Nth observation', 1, min = 1),
    numericInput('starting', 'Starting data point in the plot', 1, min = 1),
    textOutput("num"),
    code(paste("Actual π: ", pi)),
    includeMarkdown("./Pi_Simulation.md"), #Load Markdown Document
    plotOutput("Plot")
)


server <- function(input, output) {
    
    piR <- function(N) {
        x <- runif(N)
        y <- runif(N)
        d <- sqrt(x^2 + y^2)
        return(4 * sum(d < 1.0) / N)
    }
    
    output$num <- renderText({
        set.seed(1)
        paste("Estimated π: ", piR(input$num))
    })
    
    # Fill in the spot we created for a plot
    
    output$Plot <- renderPlot({
        
        if (input$checkbox == TRUE) {
            # Render the plot
            #x <- input$num
            x <- seq(input$starting, input$num, by=input$spl)
            y <- lapply(x,piR)
            plot(x, y, ylab = "Estimated value of π", xlab = "Number of draws")
            abline(h = pi, col = 2, lty = 2)
            text(10, pi, labels = "3.141593", col=4)
        }
    })
    
    
    
}


shinyApp(ui = ui, server = server)


