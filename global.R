library(shiny)
library(leaflet)
library(shinythemes)
library(dplyr)

# See http://tuijasonkkila.fi/blog/2015/03/birds-on-a-map/

# http://atlas3.lintuatlas.fi/taustaa/kaytto
#
# linnut <- read.table("lajit.csv", sep = ",", stringsAsFactors = F, quote = "")
# names(linnut) <- c("lyhenne", "latina", "suomi", "ruotsi", "englanti", "julkisuus")
#
# ruudut <- read.table("ruudut.csv", sep = ",", stringsAsFactors = F, quote = "")
# names(ruudut) <- c("N", "E", "selvitysaste1", "selvitysaste2", "selvitys12")
#
# http://www.luomus.fi/fi/tietotekniikkapalvelut
# coord <- read.table("allcoord.csv", header = F, sep = ",", quote = "", stringsAsFactors = F)
#
# cd <- coord %>%
#  mutate(N = V2, E = V3, lat = V5, lon = V6) %>%
#  select(N, E, lat, lon)
#
# havainnot <- read.table("havainnot.csv", sep = ",", stringsAsFactors = F, quote = "")
# names(havainnot) <- c("lyhenne", "N", "E", "varmuus1", "varmuus2", "varmuus12")
#
# lintuhavainnot <- left_join(linnut, havainnot, by = "lyhenne")
#
# data <- inner_join(lintuhavainnot, cd, by = c("N" = "N", "E" = "E"))
#
# 4 Blues from ColorBrewer
# data$color <- sapply(data$varmuus12, function(x) { 
#  if (x == 2) "#a1dab4"
#  else if (x == 3) "#41b6c4"
#  else if (x == 4) "#225ea8"
#  else "#ffffcc"
#})
#
#
# write.table(data, file = "birds.csv", sep = ";", row.names = F)

data <- read.table(file = "birds.csv", sep = ";", header = T, stringsAsFactors = F)
data$ruotsi <- sapply(data$ruotsi, function(x) iconv(x, from = "ISO-8859-1", to = "UTF-8"))
data$suomi <- sapply(data$suomi, function(x) iconv(x, from = "ISO-8859-1", to = "UTF-8"))
