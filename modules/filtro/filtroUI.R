#==================================================================
# Filtro menu item
#==================================================================
createMenuItemFiltro = function() {
  menuItem(
    text = NAME_FILTRO,
    tabName = "Filtro",
    icon = icon("cog"),
    selectInput(
      inputId = "estadoSelect",
      label = ESTADO_SELECT,
      choices = "CE",
      selected = "CE"
    ),
    selectInput(
      inputId = "cidadeSelect",
      label = MUNICIPIO_SELECT,
      choices = "Morada Nova",
      selected = "Morada Nova"
    )
  )
  
}