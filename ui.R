#datos <- read.table("FUNVISIS_SD.txt",header=T)
shinyUI(pageWithSidebar(
	headerPanel("Histograms Magnitud / Year"),
	sidebarPanel(
		sliderInput('mu','Year',value=2010,min=2000,max=2010,step=1),
		numericInput('latmin','Lat min', 5.0),
		numericInput('latmax','Lat max', 14.0),
		numericInput('lonmin','Lon min', -74.0),
		numericInput('lonmax','Lon max', -58.0),
        selectInput('x','X',c("Year"="YYYY","Magnitud"="mag"))
		),
	mainPanel(
		plotOutput('newHist'),
		imageOutput("myImage")
		)
	  )
	)