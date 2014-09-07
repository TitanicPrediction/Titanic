smpl<-read.csv("C:/App-Titanic/data/smpl.csv")

library(shiny)


shinyUI(navbarPage("Navbar",
                   tabPanel("Summary",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput(inputId="cname1",choices=names(smpl),label="Y Axis")
                                ),
                              mainPanel(
                                plotOutput("myplot")
                              )
                            )
                            ),              
                   tabPanel("Survival Calculator",
                            sidebarLayout(
                              sidebarPanel(
                                h4('Please enter the following information:'),
                                numericInput('Age', 'Age', 30, min = 0, step = 1),
                                radioButtons('Gender', 'Gender', c('Male'=-2.63245,'Female'=0)),
                                radioButtons('Class', 'Class', c('3rd'=-1.76134,'2nd, 1st'=0)),
                                numericInput('Sib', 'Siblings onboard', 1, min=0, step=100),
                                radioButtons('Sub', 'Did you embark from Subhampton?', c('No'=0,'Yes'=-0.64679))
                               
                              
                                ),
                              mainPanel(                          
                                h4('The Voluntary Attrition Risk Factor (as a percentage) is:', style = "color:red"),
                                verbatimTextOutput('SurvivalRisk')
                                )
                              )
                            )
                   )
        )

