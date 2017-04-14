library(shiny)

fluidPage(
  
  #  Application title
  titlePanel("Diamonds analysis"),
  
  sidebarLayout(
    sidebarPanel(
      # Diamonds characteristics
      
      sliderInput("carat", "Select weight of the diamond (carat):",
                  min=0.2, max=2.5, value=c(0.5,2)),
      
      selectInput("cut", label = h5("Select quality of the cut:"),
                  choices = list("Ideal" = "Ideal", "Premium" = "Premium", "Very Good" = "Very Good",
                                 "Good" = "Good", "Fair" = "Fair"),
                  selected = "Ideal"),
      
      selectInput("color", label = h5("Select diamond color:"),
                  choices = list("D (best)" = "D", "E", "F", "G", "H", "I", "J (worst)" = "J"),
                  selected = "D"),
      
      selectInput("clarity", label = h5("Select diamond clarity:"), 
                  choices = list("IF (best)" = "IF", "VVS2", "VVS1", "VS2", 
                                 "VS1", "SI2", "SI1", "I1 (worst)" = "I1"), 
                  selected = "IF"),
      
      wellPanel(p('Summary of options selected: '), tableOutput('values'))
      
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
      wellPanel(plotOutput("diamondsPlot")),
      wellPanel(p('The average cost of diamonds with the selected characteristics is: '), textOutput('totalTxt')),
      wellPanel(h4('README'),p('This app do a simple analysis on the diamonds dataset. 
                                Change the parameters on the left panel and see how the plot changes. 
                                On the panel above you\'ll see the average cost of diamonds with same characteristics'))
      
    )
  )
)