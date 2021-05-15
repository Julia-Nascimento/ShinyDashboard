library(shiny)
library(shinyjs)


shinyServer(function(input, output) {
  
  output$vbox1 <- renderValueBox({
    Regiao=input$SelectRegião
    informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
    
    valueBox(
        width = 3,
        Regiao,
        paste(dataMinimo," a ",dataMaxima)
      )
    })
    
    
  output$vbox2 <- renderValueBox({
    informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == "Brasil")
    valueBox(
        width = 3,
        sum(informacoesUltimoDia2$populacaoTCU2019),
        "População"
      )
    })
    
    output$vbox3 <- renderValueBox({
      
      
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == "Brasil")
      valueBox(
        width = 3,
        informacoesUltimoDia2$Recuperadosnovos,
        paste("Recuperados (Brasil)")
      )
    })
    
    output$vbox4 <- renderValueBox({
      
     
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == "Brasil")
        
        valueBox(
          width = 3,
          informacoesUltimoDia2$emAcompanhamentoNovos,
          "Em acompanamento (Brasil)"
        )
    })
    
    output$vbox5 <- renderValueBox({
      
      
      
      Regiao=input$SelectRegião
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      
      valueBox(
        width = 3,
        max(informacoesUltimoDia2$casosNovos),
        "Casos Novos",
        color = "blue"
      )
    })
    
    
    
    output$vbox6 <- renderValueBox({
      
      
      
      Regiao=input$SelectRegião
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      
      valueBox(
        width = 3,
        max(informacoesUltimoDia2$casosAcumulado),
        "Casos Acumulados",
        color = "blue"
      )
      
      
    })
    
    
    
    output$vbox7 <- renderValueBox({
      
      
      
      Regiao=input$SelectRegião
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      
      valueBox(
        width = 3,
        
        format(round(
        max(informacoesUltimoDia2$casosAcumulado)/max(na.omit(informacoesUltimoDia2$populacaoTCU2019))*100000, 0), nsmall = 0),
        "Casos Acumulados 100mil",
        color = "blue"
      )
      
      
    })
    
    
    output$vbox8 <- renderValueBox({
      
      
      Regiao=input$SelectRegião
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      
      valueBox(
        width = 3,
        max(informacoesUltimoDia2$obitosNovos),
        "óbtos Novos",
        color = "blue"
      )
      
      
    })
    
    
   
    
    output$graficoCasos<- renderPlotly({
      
      fig <- plot_ly(covidBrasil, x = ~data, y = ~casosNovos, mode = 'lines')
      
      fig
    })
    
    output$graficoObtos<- renderPlotly({
      
      fig <- plot_ly(covidBrasil, x = ~data, y = ~obitosNovos, mode = 'lines')
      
      fig
    })
    
    
    output$vbox9 <- renderValueBox({
      
      
      Regiao=input$SelectRegião
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      
      valueBox(
        width = 3,
        max(informacoesUltimoDia2$obitosAcumulado),
        "óbtos Acumulados",
        color = "blue"
      )
      
      
    })
    
    
    output$vbox10 <- renderValueBox({
      
      
      Regiao=input$SelectRegião
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      informacoesUltimoDia2<- informacoesUltimoDia %>%  filter(regiao == input$SelectRegião)
      
      valueBox(
        width = 3,
        format(round(
          max(informacoesUltimoDia2$obitosAcumulado)/max(na.omit(informacoesUltimoDia2$populacaoTCU2019))*100000, 0), nsmall = 0),
        "Óbitos Acumulados 100mil",
        color = "blue"
      )
      
      
    })
    
    
    output$TabelaCovid <- renderDataTable({
      
      if(input$Select1=="todos"){
        informacoesUltimoDiaEstados2<-informacoesUltimoDiaEstados
      }else{
        informacoesUltimoDiaEstados2<- informacoesUltimoDiaEstados %>%  filter(regiao == input$Select1)

      }

      informacoesUltimoDiaEstados2
      # datatable(data = covidBrasil,
      #           filter = "top",
                # rownames = FALSE,
                # extensions = c('Responsive', 'Buttons'),
                # options = list(
                #   pageLength = 12,
                #   orientation ='landscape',
                #   lengthMenu = list(
                #     c(6, 12, 18, -1),
                #     c('6', '12', '18', 'All')),
                #   dom = 'Bfrtip',
                #   buttons = 
                #     list('pageLength', 'colvis', list(
                #       extend = 'pdf',
                #       pageSize = 'A4',
                #       orientation = 'landscape',
                #       filename = 'tt'),list(
                #         extend = 'excel')
                #       
                #     )))
      
      
      
      
    }
    
    )
    
    
    
    
    
    
    
    
    
    
    
    
})
