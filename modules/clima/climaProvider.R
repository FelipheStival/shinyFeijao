#==================================================================
# Metodo para prepara os dados para gerar o grafico
#
# @param dados objeto do tipo data.frame com dados
# @param inputSelectColuna vetor com input do usuario
# @param inputSemeadura vetor com input semeadura usuario
# @return objeto data.frame com dados filtrados para gerar o grafico
#==================================================================
climaProvider.prepararDados = function(dados,
                                       inputSelectColuna,
                                       inputSemeadura,
                                       inputCidade,
                                       inputEstado,
                                       inputCultivar) {
  #Verificando index todos
  cultivarIndex = which(inputCultivar %in% "Todos")
  
  #Filtrando dados
  index = which(dados$NM_MUN   %in% inputCidade &
                dados$SIGLA_UF %in% inputEstado)
  
  filtrado = dados[index,]
  
  #Filtrando data
  filtrado = filtrado[filtrado$DataSemeadura %in% inputSemeadura, ]
  
  #Filtrando cultivar
  if (length(cultivarIndex) == 0) {
    filtrado = filtrado[filtrado$Cultivar %in% inputCultivar, ]
  }
  
  #Selecionando colunas
  filtrado = filtrado[, c("DVS_1", "DataSemeadura", "Cultivar", inputSelectColuna)]
  
  return(filtrado)
  
}
