#==================================================================
# Metodo para prepara os dados para gerar o grafico
#
# @param dados objeto do tipo data.frame com dados
# @param inputSelectColuna vetor com input do usuario
# @param inputSemeadura vetor com input semeadura usuario
# @return objeto data.frame com dados filtrados para gerar o grafico
#==================================================================
climaProvider.prepararDados = function(dados,inputSelectColuna,inputSemeadura,inputCidade,inputEstado) {
  
  #Filtrando dados
  index = which(dados$NM_MUN   %in% inputCidade &
                dados$SIGLA_UF %in% inputEstado)
  
  filtrado = dados[index, ]
  
  #Filtrando data de plantio
  filtrado = filtrado[filtrado$DataSemeadura %in% inputSemeadura,] 
  
  #Selecionando colunas
  filtrado = filtrado[,c("DVS_1","DataSemeadura","Cultivar",inputSelectColuna)]  
  
  return(filtrado)
  
}
