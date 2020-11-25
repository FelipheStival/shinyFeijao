#==================================================================
# Global Server
#
# @input objeto do tipo reactive com os inputs do usuario
# @output objeto do tipo reactive com os outputs do usuario
# @session dados relacionacdos a sessao
#==================================================================

server = shinyServer(function(input, output, session) {
  #dados analise exploratoria
  dadosAnalise = reactive({
    data = read.csv(
      ENTRADA_DADOS_ANALISE,
      sep = ";",
      encoding = "UTF-8",
      stringsAsFactors = F
    )
    return(data)
  })
  
  #dados clima
  dadosClima = reactive({
    data = read.csv(
      ENTRADA_DADOS_CLIMA,
      sep = ";",
      encoding = "UTF-8",
      stringsAsFactors = F,
      dec = ","
    )
    return(data)
  })
  
  #Filtro service
  filtroServer(input, output, session, dadosAnalise())
  
  #Grafico server
  analiseServer(input, output, session, dadosAnalise())
  
  #Clima server
  climaServer(input, output, session, dadosClima())
  
})
