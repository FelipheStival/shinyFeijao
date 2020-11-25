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
      input$estadoSelect,
      input$cultivarSelect
    )
    return(dados)
  })
  
  
  #Atualizando input semeadura e cultivar
  observe({
    
    updateSelectizeInput(
      session = session,
      inputId = "dataPlantioSelect",
      choices = unique(data$DataSemeadura),
      selected = "2Mar"
    )
    updateSelectizeInput(
      session = session,
      inputId = "cultivarSelect",
      choices = c("Todos", unique(data$Cultivar)),
      selected = "Todos"
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
    if(is.null(input$cultivarSelect)){
      updateSelectInput(
        session = session,
        inputId = "cultivarSelect",
        selected = "Todos"
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