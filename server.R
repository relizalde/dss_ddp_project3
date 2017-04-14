library(shiny)
library(datasets)
library(ggplot2)
library(scales)

# Define server logic for slider examples
function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("carat", 
               "cut",
               "color",
               "clarity"),
      Value = as.character(c(paste(input$carat, collapse=' - '), 
                             input$cut,
                             input$color,
                             input$clarity)), 
      stringsAsFactors=FALSE)
  }) 
  
  output$values <- renderTable({
    sliderValues()
  })
  
  output$totalTxt <- renderText({
    dselected <- diamonds[ (diamonds$carat >= input$carat[1] & diamonds$carat <= input$carat[2])
                           & diamonds$cut == input$cut 
                           & diamonds$color == input$color 
                           & diamonds$clarity == input$clarity,]
    
    x <- paste("$", format(comma(mean(dselected$price)), nsmall=2))
    x
  })
  
  output$diamondsPlot <- renderPlot({ 
    dselected <- diamonds[ (diamonds$carat >= input$carat[1] & diamonds$carat <= input$carat[2])
                           & diamonds$cut == input$cut 
                           & diamonds$color == input$color 
                           & diamonds$clarity == input$clarity,]
    
    qplot(carat, price, data = dselected, geom = c("point", "smooth"), size = x*y*z, 
          color = x*y*z, xlab="carat", ylab="price")
  })
}