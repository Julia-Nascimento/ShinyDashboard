library(shiny)
library(shinydashboard)

library(shinyjs)

# 
# dashboardPage(
#     dashboardHeader(),
#     dashboardSidebar(),
#     dashboardBody()
# )

dashboardPage(
    dashboardHeader(title = "Meu Dash"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Aba 1", tabName = "aba1", icon = icon("star")),
            menuItem("Aba 2", tabName = "aba2", icon = icon("tag")),
            menuItem("Aba 3", tabName = "aba3"),
            menuItem("Aba 4", tabName = "aba4"),
            menuItem("Covid19", tabName = "covid")
            )
        ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "aba1", 
                    fluidRow(
                        box(title = "Opções"),
                        box(title = "Resultado", status = "primary")
                    )
            ),
            tabItem(tabName = "aba2", 
                    fluidRow(
                        box(title = "Opções", solidHeader = TRUE,
                            textInput("texto", label = "Texto: "),
                            numericInput("numero", label = "Número: ", value = 0, min = 0)
                        ),
                        box(title = "Resultado", status = "primary",
                            textOutput("saida")
                        )
                    )
            ),
            tabItem( tabName= "aba3",
                     fluidRow(
                         tabBox(
                             title = "Primeiro tabBox",
                             # The id lets us use input$tabset1 on the server to find the current tab
                             id = "tabset1", height = "250px",
                             tabPanel("Tab1", "Primeiro conteudo "),
                             tabPanel("Tab2", "Segundo conteudo")
                         ),
                         tabBox(
                             side = "right", height = "250px",
                             selected = "Tab3",
                             tabPanel("Tab1", "Primeiro conteudo- tabbox2"),
                             tabPanel("Tab2", "Segundo conteudo- tabbox2"),
                             tabPanel("Tab3", "Diferença no side=right, a ordem foi invertida")
                         )
                     )
                     
                     ),
            tabItem(tabName="aba4",
                    fluidRow(
                        column(width = 4,
                               box(
                                   title = "Titulo1", width = NULL, solidHeader = TRUE, status = "primary",
                                   "Conteudo no box"
                               ),
                               box(
                                   width = NULL, background = "black",
                                   "A cor, ps: Sem titulo"
                               )
                        ),
                        
                        column(width = 4,
                               box(
                                   title = "Titulo3", width = NULL, solidHeader = TRUE, status = "warning",
                                   "Conteudo"
                               ),
                               box(
                                   title = "Titulo5", width = NULL, background = "light-blue",
                                   "A cor..."
                               )
                        ),
                        
                        column(width = 4,
                               box(
                                   title = "Titulo2", width = NULL, solidHeader = TRUE,
                                   "conteudo"
                               ),
                               box(
                                   title = "Titulo6", width = NULL, background = "maroon",
                                   "A cor..."
                               )
                        )
                    )
                    ),
            tabItem(tabName="covid",
                    fluidRow(
                        tabsetPanel(
                            type = "tabs",
                            tabPanel("Resumos", value = "tab1",
                                     
                                     fluidPage(
                                         
                                         selectInput("SelectRegião", "Filtre aqui:",
                                                     c(
                                                       unique(informacoesUltimoDia$regiao)
                                                     )),
                                         
                                         div(id='clickfinalizadosdesert',
                                             valueBoxOutput("vbox1", width = 3)),
                                         valueBoxOutput("vbox2", width = 3),
                                         valueBoxOutput("vbox3", width = 3),
                                         valueBoxOutput("vbox4", width = 3),
                                         valueBoxOutput("vbox5", width = 2),
                                         valueBoxOutput("vbox6", width = 2),
                                         valueBoxOutput("vbox7", width = 2),
                                         valueBoxOutput("vbox8", width = 2),
                                         valueBoxOutput("vbox9", width = 2),
                                         valueBoxOutput("vbox10", width = 2),
                                         
                                         box(
                                             plotlyOutput("graficoCasos")),
                                         box(
                                         plotlyOutput("graficoObtos"))
                                         
                                         
                                         
                                         
                                     )
                            
                                     ),
                            
                            tabPanel("Tabelas interativas", value = "tab2",
                            
                                     selectInput("Select1", "NomeSelect1:",
                                                 c("Todos" = "todos",
                                           
                                           "Result Brasil"="Brasil",
                                           "Centro-Oeste"="Centro-Oeste",
                                           "Nordeste"="Nordeste",
                                           "Norte","Norte",
                                           "Sudeste","Sudeste" ,
                                           "Sul"="Sul")),
                             
                             dataTableOutput("TabelaCovid")
                    ),
                    tabPanel("Tabelas interativas", value = "tab2",
                             
                             
                             #,
                             
                             # DTOutput("DT5")
                    ))
                        
                        
                        
                        
                    )
                )
                
            )
        )
    
    )