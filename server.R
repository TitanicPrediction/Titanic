smpl<-read.csv("data/smpl - Copy.csv")

library(shiny)
library(ggplot2)

Survival <- function(Gender, Sub, Age, Sib, Class)
  
#Weights for the variables from Logistic Regression
  {Terms <- 16.595963 + Gender + Sub + (-0.039330*Age) + (-0.327496*Sib) + Class
  100.00*(exp(Terms) / (1 + exp(Terms)))
  }

#Space to plot the charts
shinyServer(function(input, output, session) 
  {
  
  output$myplot<-renderPlot({ 
    
    c <- ggplot(smpl, aes_string(x=input$cname1)) + geom_bar(fill="grey50",width=.8) 
    print(c)
  })
   
   
#ggplot for the percent of total
  output$myggplot<-renderPlot({ 
      p <- ggplot(smpl,aes_string(x=input$cname1,fill=input$cname2)) + geom_bar(colour="grey50",position="fill",width=.8)+xlab(input$cname1)+ylab(input$cname2)
      print(p)
      })
    
#Survival prediction for the calculator
output$Sib <- renderPrint({Height(input$Sib)})
output$Age <- renderPrint({input$Age})
output$SurvivalRisk <- renderPrint({round(Survival(Gender=as.numeric(input$Gender), 
                                                       Sub=as.numeric(input$Sub),
                                                       Class=as.numeric(input$Class),
                                                       Age=input$Age, 

                                                       Sib=input$Sib
                                                       
                                                       ),2)})
})
