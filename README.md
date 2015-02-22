# CurrencyCalculator
USD to Mexican Peso Conversion ShinyApp.

## Introduction

This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.


## Loading & Processing the data

### Tracking USD/MXN Price

To track the USD/MXN exchange rate we connect to a Exchange Rate Web Service, then we created a function to do the automatic conversion with real time data from the Web Service.

```r
library(rjson)

myConverter <- function(valueToConvert){
	url <- "http://rate-exchange.appspot.com/currency?from=USD&to=MXN"
	result <- fromJSON(file=url, method='C')
	myResult <- result$rate * valueToConvert
	return(myResult)
}
```


### Tracking USD/MXN Historical Data

In order to track historical data we used the Quandl Web Service. [More Info](www.quandl.com/help/r).

```r
library(Quandl)
data <- Quandl("CURRFX/USDMXN", trim_date="2014-02-20", end_date="2015-02-20", authcode="API-KEY")
Exchange1 <- data[order(-1:-413), ]
plot(Exchange1$Rate, type="l", main="1 USD = MXN, Exchange Rate", xlab="Days", ylab="MXN")
```