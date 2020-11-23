#==================================================================
# grafico server
#
# @input objeto do tipo reactive com os inputs do usuario
# @output objeto do tipo reactive com os outputs do usuario
# @session dados relacionacdos a sessao
# @data objeto do tipo data.frame com dados das estacoes
#==================================================================
graficoServer =  function(input, output, session, data) {
  #Filtrando dados
  dadosGrafico = reactive({
    dados = NULL
    if (input$estadoSelect != "" & input$cidadeSelect != "") {
      dados = graficoProvider.filtrarDados(data,
                                           input$cidadeSelect,
                                           input$estadoSelect)
    }
    return(dados)
  })
  
  #Grafico boxplot
  output$boxplot = renderPlot({
    #Validacao
    validate(need(nrow(dadosGrafico()) > 0, MENSAGEM_DADOS_VAZIOS))
    #Convertendo input para nome da coluna
    colunaSelect = graficoProvider.nomeColuna(input$variavelSelect)
    #Plotando grafico
    grafico.boxplot(
      dados = dadosGrafico(),
      coluna = colunaSelect,
      lab = input$variavelSelect
    )
  })
  
  #Grafico heatmap
  output$heatmap = renderPlot({
    #Validacao
    validate(need(nrow(dadosGrafico()) > 0, MENSAGEM_DADOS_VAZIOS))
    #Convertendo input para coluna
    colunaSelect = graficoProvider.nomeColuna(input$variavelSelect)
    #Plotando grafico
    grafico.heatmap(
      dados = dadosGrafico(),
      coluna = colunaSelect,
      lab = input$variavelSelect
    )
  })
  
  #Grafico ecdf
  output$ECDF = renderPlot({
    #Validacao
    validate(need(nrow(dadosGrafico()) > 0, MENSAGEM_DADOS_VAZIOS))
    #Convetendo input para coluna
    colunaSelect = graficoProvider.nomeColuna(input$variavelSelect)
    #Plotando grafico
    grafico.ecdf(dados = dadosGrafico(),
                 coluna = colunaSelect)
  })
  
}