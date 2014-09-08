
smpl<-read.csv("data/smpl - Copy.csv")



library(shiny)


shinyUI(navbarPage("Navbar",
                   tabPanel("Summary",
                            sidebarLayout(

                              sidebarPanel(
                                h4('Select a Variable'),
                                selectInput(inputId="cname1",choices=names(smpl),label="X Axis"),
                                selectInput(inputId="cname2",choices=names(smpl),label="Y Axis")
                                ),
                              mainPanel(
                                h2('Titanic Disaster of 1912'),
p("The sinking of the RMS Titanic is one of the most infamous shipwrecks in history.  
On April 15, 1912, during her maiden voyage, the Titanic sank after colliding with an iceberg, killing thousands of 
passengers and crew. This sensational tragedy shocked the international community and led to better safety 
regulations for ships."),
br(),
p('One of the reasons that the shipwreck led to such loss of life was that there were not enough lifeboats for the 
passengers and crew. Although there was some element of luck involved in surviving the sinking, some groups of 
people were more likely to survive than others.'),
br(),
p('The purpose of this web app is to explore variables that had an impact on surviving.'),
br(),
strong('On this summary tab', style = "color:blue"),
p('   - Basic counts can be analyzed using a drop-down of variables.'),
br(),
strong('On the survival calculator tab', style = "color:blue"),
p('   - Variables can be changed to see how that impacts the probability of surviving.'),
br(),
br(),

h4('Count of Passengers'),
plotOutput("myplot", width=410, height=300),

h4('Percent of Passengers'),
plotOutput("myggplot", width=500, height=300)
))),              
                   tabPanel("Survival Calculator",
                            sidebarLayout(
                              sidebarPanel(
                                h4('Please enter the following information:'),
                                numericInput('Age', 'Age', 30, min = 0, step = 1),
                                radioButtons('Gender', 'Gender', c('Male'=-2.63245,'Female'=0)),
                                radioButtons('Class', 'Class', c('3rd Class'=-2.295901,'2nd Class'=-1.035944, '1st Class' = 0)),
                                numericInput('Sib', 'Siblings onboard', 1, min=0, step=1),
                                radioButtons('Sub', 'Where did you Embark from?', c('Q'=-12.39,'S'=-12.93, 'C'=-12.35 ))
                               
                              
                                ),
                              mainPanel(                          
                                h4('Chance of Surviving (as a Percentage):', style = "color:red"),
                                verbatimTextOutput('SurvivalRisk')
                                )
                              )
                            )
                   )
        )

