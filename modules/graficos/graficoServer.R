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
    validate(need(nrow(dadosGrafico()) > 0, MENSAGEM_DADOS_VAZIOS))
    grafico.boxplot(dadosGrafico())
  })
  
  #Grafico heatmap
  output$heatmap = renderPlot({
    validate(need(nrow(dadosGrafico()) > 0, MENSAGEM_DADOS_VAZIOS))
    grafico.heatmap(dadosGrafico())
  })
  
  #Grafico ecdf
  output$ECDF = renderPlot({
    validate(need(nrow(dadosGrafico()) > 0, MENSAGEM_DADOS_VAZIOS))
    grafico.ecdf(dadosGrafico())
  })
  
}