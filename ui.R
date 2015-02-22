shinyUI(pageWithSidebar( 

 	headerPanel("USD to Mexican Peso Conversion"),
	sidebarPanel(

		h3("Usage:"),
        p("This app helps you to see the changes in USD to MXN currency exchange, to check
        	the current exchange value enter a number on the numeric input box,
        	and to see the historical data set the desired date range."),

		numericInput('xrate', 'USD to MXN', 1, min = 1, max = 1000, step = 1),

		dateInput('date1',
      		label = 'Start Date: yyyy-mm-dd',
      		value = Sys.Date() - 5
    	),

    	dateInput('date2',
      		label = 'End Date: yyyy-mm-dd',
      		value = Sys.Date()
    	),
		
		submitButton('Submit')
	),

	
	mainPanel(
		h3('Results of currency calculation '),
		h4('You entered'),
		verbatimTextOutput("inputValue"),
		h4('Which is equivalent in Mexican pesos to '),
		verbatimTextOutput("conversion"),
		br(),
		h4('Historical USD/MXN Data '),
		plotOutput("exchangePlot")
	)
))