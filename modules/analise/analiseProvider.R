#==================================================================
# Metodo para filtrar os dados para gerar os graficos
#
# @param dados objeto do tipo data.frame com dados
# @param municipioSelect input com municipio selecionado
# @param estadoSelect input com estado selecionado
# @return objeto string com nome da coluna
#==================================================================
analiseProvider.filtrarDados = function(dados, municipioSelect, estadoSelect) {
  #Filtrando dados
  index = which(dados$NM_MUN   %in% municipioSelect &
                dados$SIGLA_UF %in% estadoSelect)
  
  filtrado = dados[index, ]
  
  #Escolhendo datas de semeadura
  filtrado = analiseProvider.prepararSemeadura(filtrado, estadoSelect)
  
  #Removendo NA
  filtrado = filtrado[!is.na(filtrado$EMD), ]
  
  return(filtrado)
}

#==================================================================
# Metodo para obter o nome da coluna pelo input var
#
# @param variavelSelect input com coluna selecionada
# @return string com nome da coluna do data.frame
#==================================================================
analiseProvider.nomeColuna = function(variavelSelect) {
  coluna = NULL
  if (variavelSelect == VARIAVEL_PROD) {
    coluna = "WRR14"
  } else if (variavelSelect == VARIAVEL_CICLO) {
    coluna = "DAE"
  } else if (variavelSelect == VARIAVEL_FLOR) {
    coluna = "DAYSFL"
  }
  return(coluna)
}

#==================================================================
# Metodo para seleconar as datas de semeaduras
#
# @param dados objeto do tipo data.frame com dados
# @param objeto do tipo reactive com estado selecionado
# @return data.frame com datas de semeaduras selecionadas
#==================================================================
analiseProvider.prepararSemeadura = function(dados, estadoSelect) {
  switch(
    estadoSelect,
    "AL" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(
          61,
          71,
          81,
          91,
          101,
          111,
          121,
          131,
          141,
          151,
          251,
          261,
          271,
          281,
          291,
          301
        ),
        labels = c(
          "2Mar",
          "12Mar",
          "22Mar",
          "1Abr",
          "11Abr",
          "21Abr",
          "1Mai",
          "11Mai",
          "21Mai",
          "31Mai",
          "8Set",
          "18Set",
          "28Set",
          "8Out",
          "18Out",
          "28Out"
        )
      )
    },
    "CE" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(
          1,
          11,
          21,
          31,
          41,
          51,
          61,
          71,
          81,
          161,
          171,
          181,
          191,
          201,
          211,
          221,
          231,
          241
        ),
        labels = c(
          "01Jan",
          "11Jan",
          "21Jan",
          "31Jan",
          "10Feb",
          "20Feb",
          "2mar",
          "12Mar",
          "22Mar",
          "10Jun",
          "20Jun",
          "30Jun",
          "10Jul",
          "20Jul",
          "30Jul",
          "9Ago",
          "19Ago",
          "29Ago"
        )
      )
    },
    "GO" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(281,	291,	301,
                   311,	321,	331,
                   341,	351,	361, 1, 11, 21, 32),
        labels = c(
          "8Out",
          "18Out",
          "28Out",
          "7Nov",
          "17Nov",
          "27Nov",
          "7Dez",
          "17Dez",
          "27Dez",
          "1Jan",
          "11Jan",
          "21Jan",
          "1Fev"
        )
      )
    },
    "MA" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(
          161,
          171,
          181,
          191,
          201,
          211,
          221,
          231,
          241,
          251,
          261,
          271,
          281,
          291,
          301,
          311,
          321,
          331,
          341,
          351,
          361,
          1,
          11,
          21,
          31,
          41,
          51
        ),
        labels = c(
          "10Jun",
          "20Jun",
          "30Jun",
          "10Jul",
          "20Jul",
          "30Jul",
          "9Ago",
          "19Ago",
          "29Ago",
          "8Set",
          "18Set",
          "28Set",
          "8Out",
          "18Out",
          "28Out",
          "7Nov",
          "	17Nov",
          "27Nov",
          "7Dez",
          "17Dez",
          "27Dez",
          "1Jan",
          "11Jan",
          "21Jan",
          "31Jan",
          "10Fev",
          "20Fev"
        )
      )
    },
    "MS" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(191,	201,	211,
                   221,	231,	241,
                   251,	261,	271,
                   281,	291,	301),
        labels = c(
          "10Jul",
          "20Jul",
          "30Jul",
          "9Ago",
          "19Ago",
          "29Ago",
          "8Set",
          "18Set",
          "28Set",
          "8Out",
          "18Out",
          "28Out"
        )
      )
    },
    "PB" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(
          1,
          11,
          21,
          31,
          41,
          51,
          61,
          71,
          81,
          161,
          171,
          181,
          191,
          201,
          211,
          221,
          231,
          241
        ),
        labels = c(
          "01Jan",
          "11Jan",
          "21Jan",
          "31Jan",
          "10Feb",
          "20Feb",
          "2mar",
          "12Mar",
          "22Mar",
          "10Jun",
          "20Jun",
          "30Jun",
          "10Jul",
          "20Jul",
          "30Jul",
          "9Ago",
          "19Ago",
          "29Ago"
        )
      )
    },
    "PE" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(
          1,
          11,
          21,
          31,
          41,
          51,
          61,
          71,
          81,
          161,
          171,
          181,
          191,
          201,
          211,
          221,
          231,
          241
        ),
        labels = c(
          "01Jan",
          "11Jan",
          "21Jan",
          "31Jan",
          "10Feb",
          "20Feb",
          "2mar",
          "12Mar",
          "22Mar",
          "10Jun",
          "20Jun",
          "30Jun",
          "10Jul",
          "20Jul",
          "30Jul",
          "9Ago",
          "19Ago",
          "29Ago"
        )
      )
    },
    "PI" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(161,	171,	181,
                   191,	201,	211,
                   221,	231,	241),
        labels = c(
          "10Jun",
          "20Jun",
          "30Jun",
          "10Jul",
          "20Jul",
          "30Jul",
          "9Ago",
          "19Ago",
          "29Ago"
        )
      )
    },
    "RN" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(1,	11,	21,	31,
                   41,	51,	61,	71,	81,
                   161,	171,	181,
                   191,	201,	211),
        labels = c(
          "1Jan",
          "11Jan",
          "21Jan",
          "31jan",
          "11Fev",
          "21Fev",
          "2Mar",
          "12Mar",
          "22Mar",
          "10Jun",
          "20Jun",
          "30Jun",
          "10Jul",
          "20Jul",
          "30Jul"
        )
      )
    },
    "RR" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(251,
                   261,
                   271,
                   281,
                   291,
                   301,
                   311,
                   321,
                   331),
        labels = c(
          "8Set",
          "18Set",
          "28Set",
          "8Out",
          "18Out",
          "28Out",
          "7Nov",
          "17Nov",
          "27Nov"
        )
      )
    },
    "SE" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(
          61,
          71,
          81,
          91,
          101,
          111,
          121,
          131,
          141,
          151,
          251,
          261,
          271,
          281,
          291,
          301
        ),
        labels = c(
          "2Mar",
          "12Mar",
          "22Mar",
          "1Abr",
          "11Abr",
          "21Abr",
          "1Mai",
          "11Mai",
          "21Mai",
          "31Mai",
          "8Set",
          "18Set",
          "28Set",
          "8Out",
          "18Out",
          "28Out"
        )
      )
    },
    "TO" = {
      dados$EMD = factor(
        dados$EMD,
        levels = c(281,	291,
                   301,	311,
                   321, 331,
                   341,	351,
                   361, 1,
                   11,	21,
                   31),
        labels = c(
          "08Out",
          "18Out",
          "28Out",
          "07Nov",
          "17Nov",
          "27Nov",
          "07Dez",
          "17Dez",
          "27Dez",
          "01Jan",
          "11Jan",
          "21Jan",
          "31Jan"
        )
      )
    }
  )
  
  return(dados)
}
