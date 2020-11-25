#==================================================================
# grafico server
#
# @input objeto do tipo reactive com os inputs do usuario
# @output objeto do tipo reactive com os outputs do usuario
# @session dados relacionacdos a sessao
# @data objeto do tipo data.frame com dados das estacoes
#==================================================================
climaServer =  function(input, output, session, data) {
  #Filtrando dados grafico
  dadosChart = reactive({
    dados = climaProvider.prepararDados(
      data,
      input$variaveisSelect,
      input$dataPlantioSelect,
      input$cidadeSelect,
      input$estadoSelect
    )
    return(dados)
  })
  
  
  #Atualizando input semeadura com dados da tabela
  observe({
    updateSelectInput(
      session = session,
      inputId = "dataPlantioSelect",
      choices = unique(data$DataSemeadura),
      selected = unique(data$DataSemeadura[1])
    )
    
  })
  
  #Observando e atualizando caso input esteja vazio
  observe({
    if (is.null(input$variaveisSelect)) {
      updateSelectInput(
        session = session,
        inputId = "variaveisSelect",
        selected = c("temperatura maxima (C)" = "Tmax")
      )
    }
    if (is.null(input$dataPlantioSelect)) {
      updateSelectInput(
        session = session,
        inputId = "dataPlantioSelect",
        selected = unique(data$DataSemeadura[1])
      )
    }
  })
  
  #Plotando grafico
  output$climaChart = renderPlot({
    validate(need(
      nrow(dadosChart()) > 0,
      "Nao ha dados suficientes para exibicao do grafico."
    ))
    grafico.clima(dadosChart())
  })
  
}