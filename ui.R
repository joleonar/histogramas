#datos <- read.table("FUNVISIS_SD.txt",header=T)
shinyUI(pageWithSidebar(
	headerPanel("Histograms: Magnitud - Year"),
	sidebarPanel(
		sliderInput('mu','Plot event from Year',value=2010,min=2000,max=2010,step=1),
		h4('Region'),
		numericInput('latmin','Latitude min', 5.0),
		numericInput('latmax','Latitude max', 14.0),
		numericInput('lonmin','Longitude min', -74.0),
		numericInput('lonmax','Longitude max', -58.0),
		h4('Type of histogram'),
        selectInput('x','Histogram',c("Year"="Year","Magnitud"="Magnitude"))
		),
	mainPanel(
		tabsetPanel(
			tabPanel("Documentation",includeHTML("Documento.html")),
			tabPanel("Histograms",
		plotOutput('newHist'),
		imageOutput("myImage"))
		
		
		))
	  )
	)