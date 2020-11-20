#==================================================================
# Grafico boxplot
#
# @param dados objeto data.frame com dados das estacoes
# @return objeto do tipo ggplot com grafico
#==================================================================
grafico.boxplot = function(dados) {
  
  chart = ggplot(data = dados, aes(x = (EMD), y = WRR14, fill = Cultivar)) +
    ylab("Produtividade [kg/ha]") + xlab("Datas de Semeadura") +
    ggtitle("Produtividade Simulada") +
    geom_boxplot() +
    theme_ipsum(axis_text_size = 10, axis_title_size = 15)
  
  return(chart)
  
}

#==================================================================
# Grafico heatmap
#
# @param dados objeto data.frame com dados das estacoes
# @return objeto do tipo ggplot com grafico
#==================================================================
grafico.heatmap = function(dados) {
  
  chart = ggplot(data = dados, aes(x = (EMD), y = anoInicio, fill = WRR14)) +
    geom_tile() + xlab("Produtividade Simulada") +
    scale_fill_gradient(low = "white", high = "red") +
    theme(axis.text.x = element_text(angle = 90)) +
    facet_grid( ~ Cultivar)
  
  return(chart)
}

#==================================================================
# Grafico ecdf
#
# @param dados objeto data.frame com dados das estacoes
# @return objeto do tipo ggplot com grafico
#==================================================================
grafico.ecdf = function(dados) {
  
  chart = ggplot(data = dados, aes(WRR14, color = Cultivar)) + stat_ecdf(geom = "point") +
    theme_ipsum()
  
  return(chart)
}