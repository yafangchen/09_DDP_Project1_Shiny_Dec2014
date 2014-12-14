library(shiny)

# Define UI for insect sprays application
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Insect Sprays"),
        
        # Sidebar with controls to select two types of insect sprays to
        # plot against count
        sidebarLayout(
                sidebarPanel(
                        selectInput("Spray1", "Spray1:",
                                    c("","A","B","C","D","E")),
                        selectInput("Spray2", "Spray2:",
                                    c("","A","B","C","D","E")),
                        submitButton('Submit')
                ),
                
                # Show the caption and plot of the requested sprays
                # against count
                mainPanel(
                        h3(textOutput("caption")),
                        plotOutput("sprayPlot"),
                        verbatimTextOutput("mean_count1"),
                        verbatimTextOutput("mean_count2")
                )
        )
))