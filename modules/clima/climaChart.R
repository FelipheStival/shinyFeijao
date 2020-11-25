#==================================================================
# Metodo para prepara os dados para gerar o grafico
#
# @param dados objeto do tipo data.frame com dados
# @return objeto ggplot com grafico 
#==================================================================
grafico.clima = function(dados) {
  
  Grafico = dados %>%
    ggplot(aes(
      fill = Cultivar,
      linetype = Cultivar,
      shape = DataSemeadura
    )) +
    ylab("") + xlab(LEGENDA_CLIMA_X)
  
  if (!is.null(dados$Tmax)) {
    Grafico = Grafico + geom_line(aes(x = DVS_1, y = Tmax), color = "red") +
      geom_point(aes(x = DVS_1, y = Tmax), color = "red", size = 3)
  }
  if (!is.null(dados$Tmin)) {
    Grafico = Grafico + geom_line(aes(x = DVS_1, y = Tmin), color = "blue") +
      geom_point(aes(x = DVS_1, y = Tmin), color = "blue", size = 3)
  }
  if (!is.null(dados$Radiacao)) {
    Grafico = Grafico + geom_line(aes(x = DVS_1, y = Radiacao), color = "violet") +
      geom_point(aes(x = DVS_1, y = Radiacao),
                 color = "violet",
                 size = 3)
  }
  if (!is.null(dados$Prec)) {
    Grafico = Grafico + geom_line(aes(x = DVS_1, y = Prec), color = "green") +
      geom_point(aes(x = DVS_1, y = Prec), color = "green", size = 2)
  }
  
  Grafico = Grafico + scale_colour_manual(values = c("black", "red")) +
    scale_shape_manual(name = "Data de Plantio", values = c(1, 2)) +
    scale_linetype_manual(name = "Cultivar", values = c(1, 2)) +
    theme_ipsum() +
    theme(
      axis.text.x = element_text(size = 20),
      axis.text.y = element_text(size = 20),
      axis.title.x = element_text(size = 20)
    ) +
    theme(legend.position = "bottom")
  
  return(Grafico)
  
}