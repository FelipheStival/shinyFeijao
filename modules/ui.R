

 ui = dashboardPage(
   #========================header=========================
   
   dashboardHeader( title =  APP_NAME),
   
   #=======================================================
   
   
   #=======================SiderBar========================
   
   dashboardSidebar(
      sidebarMenu(
         createAnaliseItemFiltro(),
         createClimaItemFiltro(),
         createMenuItemFiltro()
      )),
   
   #========================================================
   
   
   #=======================body=============================
   
   dashboardBody(
      includeCSS("www//css//style.css"),
      tabItems(
         crateAnaliseUI(),
         crateClimaUI()
      )
   )
   
   #========================================================
 )
