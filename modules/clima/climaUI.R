#==================================================================
# Clima menu item
#==================================================================
createClimaItemFiltro = function() {
  menuItem(text = NAME_CLIMA,
           tabName = "Clima",
           icon = icon("line-chart"))
  
}

#==================================================================
# Clima UI
#==================================================================
crateClimaUI = function() {
  tabItem(
    tabName = "Clima",
    box(
      width = 3,
      selectInput(
        inputId = "variaveisSelect",
        label = VARS_SELECT,
        multiple = T,
        choices = c(
          "temperatura maxima (C)" = "Tmax",
          "temperatura minima (C)" = "Tmin",
          "radiacao solar  (MJ/m2.dia)" = "Radiacao",
          "Precipitacao (mm)" = "Prec"
        ),
        selected = ("temperatura maxima (C)" = "Tmax")
      ),
      selectizeInput(
        inputId = "dataPlantioSelect",
        label = DATE_SELECT,
        multiple = T,
        choices = "2Mar",
        selected = "2Mar",
        options = list(maxItems = 2L)
      ),
      selectizeInput(
        inputId = "cultivarSelect",
        label = CULTIVAR_SELECT,
        multiple = T,
        choices = "2Mar",
        selected = "2Mar"
      )
    ),
    box(width = 9,
        withSpinner(
          plotOutput(
            outputId = "climaChart",
            width = "100%",
            height = "85vh"
            
          )
        ))
  )
}