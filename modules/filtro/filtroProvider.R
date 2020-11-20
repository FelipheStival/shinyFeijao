#==================================================================
# Metodo para obter a lista de cidades
#
# @param dados objeto do tipo data.frame com dados
# @return objeto string com nome da coluna
#==================================================================
filtroProvider.listaEstados = function(dados) {
  
  #extraindo estados
  estados = unique(dados$SIGLA_UF)
  
  return(estados)
}

#==================================================================
# Metodo para listar a cidade por estado
#
# @param dados objeto do tipo data.frame com dados
# @param EstadoSelect input com estado selecionado
# @return objeto string com nome da coluna
#==================================================================
filtroProvider.listaCidades = function(dados, EstadoSelect) {
  
  #filtrando por estados
  estadoData = dados[dados$SIGLA_UF %in% EstadoSelect, ]
  
  #obtendo nome municipios
  municipios = unique(estadoData$NM_MUN)
  
  return(municipios)
  
}