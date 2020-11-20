

 ui = dashboardPage(
   #========================header=========================
   
   dashboardHeader( title =  APP_NAME),
   
   #=======================================================
   
   
   #=======================SiderBar========================
   
   dashboardSidebar(
      sidebarMenu(
         createGraficosItemFiltro(),
         createMenuItemFiltro()
      )),
   
   #========================================================
   
   
   #=======================body=============================
   
   dashboardBody(
      includeCSS("www//css//style.css"),
      tabItems(
         crateGraficosUI()
      )
   )
   
   #========================================================
 )
