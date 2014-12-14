library(shiny)
library(ggplot2)
library(datasets)

# Define server logic required to plot various insect sprays against
# count
shinyServer(function(input, output) {       
        
        # Return the formula text for printing as a caption
        output$caption <- renderText({
                paste("Spray",input$Spray1, "versus", "Spray",input$Spray2)
        })
        
        # Generate a plot of the requested insect sprays against count
        output$sprayPlot <- renderPlot({
                ISdata <- InsectSprays[which(InsectSprays$spray==input$Spray1 | InsectSprays$spray==input$Spray2),]
                qplot(spray,count,data=ISdata,geom=c("boxplot","jitter"))
        })
        
        # Calculate the mean count for the requested sprays
        output$mean_count1 <- renderPrint({
                paste("The mean count of spray",input$Spray1,"is",round(mean(InsectSprays[which(InsectSprays$spray==input$Spray1),]$count),digits=2))
        })
        output$mean_count2 <- renderPrint({
                paste("The mean count of spray",input$Spray2,"is",round(mean(InsectSprays[which(InsectSprays$spray==input$Spray2),]$count),digits=2))
        })
})