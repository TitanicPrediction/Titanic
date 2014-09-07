smpl<-read.csv("C:/App-Titanic/data/smpl.csv")

library(shiny)

Survival <- function(Gender, Sub, Age, Sib, Class)
  {
  Terms <- 3.57698 + Gender + Sub + (-0.03184*Age) + (-0.29287*Sib) + Class
  exp(Terms) / (1 + exp(Terms))
}
shinyServer(
  function(input, output, session) {
    
    
    output$myplot<-renderPlot({        
      plot(smpl[c(input$cname1)])
      #, input$cname2)])
    })
    
   
    output$Sib <- renderPrint({Height(input$Sib)})
    output$Age <- renderPrint({input$Age})
    output$SurvivalRisk <- renderPrint({round(Survival(Gender=as.numeric(input$Gender), 
                                                       Sub=as.numeric(input$Sub),
                                                       Class=as.numeric(input$Class),
                                                       Age=input$Age, 

                                                       Sib=input$Sib
                                                       
                                                       ),2)})
  }
)
