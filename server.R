library(shiny)
library(shinyjs)
library(DT)


shinyServer(function(input, output) {
  
  onclick('primeiroClick',showModal(modalDialog(
    title = "Ola mundo!! Tudo bem?",
    easyClose = TRUE,
    size = "l"
  )))
  
  
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
    
    
    output$TabelaCovid <- DT::renderDataTable({
      
      if(input$Select1=="todos"){
        informacoesUltimoDiaEstados2<-informacoesUltimoDiaEstados
      }else{
        informacoesUltimoDiaEstados2<- informacoesUltimoDiaEstados %>%  filter(regiao == input$Select1)

      }
      
      datatable(data = informacoesUltimoDiaEstados2,
                filter = "top",
      rownames = FALSE,
      extensions = c('Responsive', 'Buttons'),
      options = list(
        pageLength = 12,
        orientation ='landscape',
        lengthMenu = list(
          c(6, 12, 18, -1),
          c('6', '12', '18', 'All')),
        dom = 'Bfrtip',
        buttons =
          list('pageLength', 'colvis', list(
            extend = 'pdf',
            pageSize = 'A4',
            orientation = 'landscape',
            filename = 'tt'),list(
              extend = 'excel')

          )))
      
      
      
      
    }
    
    )
    
    
    
    
    
    
    
    
    
    
    output$TabelaInterativaCovid <- DT::renderDataTable({
      datatable(informacoesUltimoDiaEstados,extensions = c('Responsive'),
                options = list(responsive=TRUE)
                )
    })
    
    tbl_reactive_TabelaInterativaCovid <- reactive({
      
      linhaSelecionada<-input$TabelaInterativaCovid_rows_selected[1]
      estadoSelecioando<- informacoesUltimoDiaEstados$estado[linhaSelecionada]
      
      baseComOEstadoSelecionado<-informacoesUltimoDia %>%  filter( estado == estadoSelecioando)
      baseComOEstadoSelecionado <- baseComOEstadoSelecionado %>% select(estado, municipio,populacaoTCU2019,casosAcumulado )
      datatable(baseComOEstadoSelecionado)
      
    })
    
    output$modal_table_TabelaInterativaCovid <- DT::renderDataTable({
      tbl_reactive_TabelaInterativaCovid()
    })
    
    myModal_TabelaInterativaCovid <- function(failed=FALSE){
      modalDialog(
        DT::dataTableOutput('modal_table_TabelaInterativaCovid'),
        easyClose = TRUE,
        size = "l"
      )
    }
    
    observeEvent(input$TabelaInterativaCovid_rows_selected,{
      showModal(myModal_TabelaInterativaCovid())
    })
    
    
    
    
    
    
    
    
    
})
