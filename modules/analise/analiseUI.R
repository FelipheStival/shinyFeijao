#==================================================================
# Graficos menu item
#==================================================================
createAnaliseItemFiltro = function() {
  menuItem(text = NAME_CHART,
           tabName = "Analise",
           icon = icon("line-chart"))
  
}

#==================================================================
# Graficos UI
#==================================================================
crateAnaliseUI = function() {
  tabItem(tabName = "Analise",
          fluidRow(
            box(
              width = 2,
              selectInput(
                inputId = "variavelSelect",
                label = VAR_SELECT,
                choices = c(VARIAVEL_PROD,
                            VARIAVEL_CICLO,
                            VARIAVEL_FLOR)
              )
            ),
            tabBox(
              title = NULL,
              width = 10,
              tabPanel(title = TAB_PANEl_BOXPLOT,
                       withSpinner(
                         plotOutput("boxplot",
                                    width = "100%",
                                    height = "80vh")
                       )),
              tabPanel(title = TAB_PANEL_HEATMAP,
                       withSpinner(
                         plotOutput("heatmap",
                                    width = "100%",
                                    height = "80vh")
                       )),
              tabPanel(title = TAB_PANEL_ECDF,
                       withSpinner(
                         plotOutput("ECDF",
                                    width = "100%",
                                    height = "80vh")
                       ))
            )
          ))
  
  
}