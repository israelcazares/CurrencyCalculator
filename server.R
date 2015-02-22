#Load necessary libraries
library(shiny)
library(rjson)
library(Quandl)

# Function that converts between currencies (USD TO MXN)
myConverter <- function(valueToConvert){

	# Load latest exchange value in JSON
	url <- "http://rate-exchange.appspot.com/currency?from=USD&to=MXN"
	result <- fromJSON(file=url, method='C')

	# Do the convertion
	myResult <- result$rate * valueToConvert

	#Return the result
	return(myResult)

}


# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Process the Shiny App output  
  output$inputValue <- renderPrint({input$xrate})
  output$conversion <- renderPrint({myConverter(input$xrate)})

  # Fill in the spot we created for a plot
  output$exchangePlot <- renderPlot({

  	data <- Quandl("CURRFX/USDMXN", start_date=input$date1, end_date=input$date2, authcode="YOUR-API-KEY")
	Exchange1 <- data[order(-1:-413), ]
    
    # Render plot
    plot(Exchange1$Rate, type="l", 
    	main="1 USD = MXN, Exchange Rate", 
    	xlab="Days", 
    	ylab="MXN")
  })


})


