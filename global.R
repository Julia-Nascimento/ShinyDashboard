library(readr)
library(dplyr)
library(DT)
library(shinyjs)
library(plotly)



covidBrasil <- read_csv("data/covidBrasil.csv")
informacoesUltimoDia <- read_csv("data/informacoesUltimoDia.csv")

informacoesUltimoDiaEstados<- informacoesUltimoDia[is.na(informacoesUltimoDia$municipio),]
informacoesUltimoDiaEstados<- informacoesUltimoDiaEstados[!is.na(informacoesUltimoDiaEstados$populacaoTCU2019),]


andamento=5

dataMaxima <- covidBrasil %>% pull(data) %>% max(na.rm = TRUE) 

dataMinimo <- covidBrasil %>% pull(data) %>% min(na.rm = TRUE)

