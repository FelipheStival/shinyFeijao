#==================================================================
# filtro server
#
# @input objeto do tipo reactive com os inputs do usuario
# @output objeto do tipo reactive com os outputs do usuario
# @session dados relacionacdos a sessao
# @data objeto do tipo data.frame com dados das estacoes
#==================================================================
filtroServer = function(input, output, session, data) {
  
  #Atualizando selects menu
  observe({
    #Atualizando input estados
    estados = filtroProvider.listaEstados(data)
    
    #atualizando input estado
    updateSelectInput(session = session,
                      inputId = "estadoSelect",
                      choices = estados)
    
  })
  
  observeEvent(input$estadoSelect, {
    #listando municipios por estados
    municipios = filtroProvider.listaCidades(data, input$estadoSelect)
    
    #atualizando input cidade
    updateSelectInput(session = session,
                      inputId = "cidadeSelect",
                      choices = municipios)
    
  })
  
}