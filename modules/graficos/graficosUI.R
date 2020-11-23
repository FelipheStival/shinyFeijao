#==================================================================
# Graficos menu item
#==================================================================
createGraficosItemFiltro = function() {
  menuItem(text = NAME_CHART,
           tabName = "Graficos",
           icon = icon("line-chart"))
  
}

#==================================================================
# Graficos UI
#==================================================================
crateGraficosUI = function() {
  tabItem(tabName = "Graficos",
          tabBox(
            title = NULL,
            width = 12,
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
          ))
  
}