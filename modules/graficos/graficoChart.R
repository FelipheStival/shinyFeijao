#==================================================================
# Grafico boxplot
#
# @param dados objeto data.frame com dados das estacoes
# @param coluna coluna ser plotada no grafico
# @param nome do eixo y
# @return objeto do tipo ggplot com grafico
#==================================================================
grafico.boxplot = function(dados, coluna, lab) {
  chart = ggplot(data = dados, aes_string(x = "EMD", y = coluna, fill = "Cultivar")) +
    ylab(lab) + xlab("Datas de Semeadura") +
    ggtitle("Produtividade Simulada") +
    geom_boxplot() +
    theme_ipsum(axis_text_size = 10, axis_title_size = 15)
  
  return(chart)
  
}

#==================================================================
# Grafico heatmap
#
# @param dados objeto data.frame com dados das estacoes
# @param coluna coluna a ser plotada no grafico
# @param lab nome do eixo x
# @return objeto do tipo ggplot com grafico
#==================================================================
grafico.heatmap = function(dados, coluna, lab) {
  chart = ggplot(data = dados, aes_string(x = "EMD", y = "anoInicio", fill = coluna)) +
    geom_tile() + xlab(lab) +
    scale_fill_gradient(low = "white", high = "red") +
    theme(axis.text.x = element_text(angle = 90)) +
    facet_grid(~ Cultivar)
  
  return(chart)
}

#==================================================================
# Grafico ecdf
#
# @param dados objeto data.frame com dados das estacoes
# @param coluna coluna a ser plotada no grafico
# @return objeto do tipo ggplot com grafico
#==================================================================
grafico.ecdf = function(dados, coluna) {
  chart = ggplot(data = dados, aes_string(coluna, color = "Cultivar")) + stat_ecdf(geom = "point") +
    theme_ipsum()
  
  return(chart)
}