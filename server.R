library(shiny)
library(ggplot2)
library(scales)

shinyServer(
	function(input,output){
	   #datos<- reactive({load("datos.RData")})
    
		output$newHist <- renderPlot({
		 # datos <- read.table("FUNVISIS_SD.txt",header=T)
         #datos$prof=-datos$prof
		 #datos$time <- as.Date(paste(datos$YYYY,datos$mm,datos$dd,sep="-"))
		  load("datos.RData",.GlobalEnv)
		  datos1 <- subset(datos, Year>= 2000 & Year<=input$mu & lat>=input$latmin & lat <=input$latmax &lon>=input$lonmin & lon<=input$lonmax &datos$prof<300)
		  xrang <- c(seq(floor(min(datos1$Magnitude)),ceiling(max(datos1$Magnitude)),by=1))

		  gg <- ggplot(datos1, aes_string(x=input$x)) + geom_histogram(binwidth=1,colour="black",fill="blue") + 
	  	  ylab("Counts") +ggtitle("Histograms") + theme(axis.text.x = element_text(angle = 0, hjust = 1,size=14,colour="black"),
        	axis.title=element_text(size=16,face="bold"), axis.text.y = element_text(hjust = 1,size=14,colour="black")) 
			#+ scale_x_continuous(limit=(0,1))
	  
		  print(gg)
      
			})
    
		output$myImage <- renderImage({
		  # When input$n is 3, filename is ./images/image3.jpeg
		  filename <- normalizePath('venezuela2.png')
		  list(src = filename)
		},deleteFile=FALSE)
				
		}
	)