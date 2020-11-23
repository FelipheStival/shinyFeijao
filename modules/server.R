#==================================================================
# Global Server
#
# @input objeto do tipo reactive com os inputs do usuario
# @output objeto do tipo reactive com os outputs do usuario
# @session dados relacionacdos a sessao
#==================================================================

server = shinyServer(function(input, output,session) {
  
  #dados aplicacao
  dados = reactive({
    
     data = read.csv(ENTRADA_DADOS,sep = ";",encoding = "UTF-8",stringsAsFactors = F)
     return(data)
     
  })
  
  #Filtro service
  filtroServer(input,output,session,dados())
  
  #Grafico server
  graficoServer(input,output,session,dados())
  
})
