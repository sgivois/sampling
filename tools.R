################################################################################
##### ENSEMBLE DE FONCTIONS UTILITAIRES (NEUCHÂTEL)
##### - - - - - > utilisées de façon régulière
##### (29/06/2017)
################################################################################

### Ligne de commande Windows :
# C:\Users\givoiss\Documents\R\R-3.4.0\bin\R CMD INSTALL C:\users\givoiss\Desktop\WORKSPACE\wd\tools samTools
# C:\Users\givoiss\Documents\R\R-3.4.0\bin\R CMD build C:\users\givoiss\Desktop\WORKSPACE\wd\tools\samTools
### Installation dans R :
# install.packages(file.choose(), repos = NULL, type="source")

rm(list = ls())
gc()

wd_std <- "C:/users/givoiss/Desktop/WORKSPACE/wd/tools"
setwd(wd_std)
getwd()

### Tranforme un vecteur d'indices en vecteur composé de 0 et de 1
toBit <- function(v, n) {
  res <- rep(0, n)
  res[v] <- 1
  return(res)
}

### Tranforme un vecteur composé de 0 et de 1 en vecteur contenant
### les indices des 1
fromBit <- function(v) {
  res <- v * (1:length(v))
  res <- res[res != 0]
  return(res)
}

### Fonction de log (avec temps ecoule)
logger <- function(start,  msg) {
  dt <- as.numeric(Sys.time() - start, units = "secs")
  df <- formatDate(dt)
  print(paste("(", df, ") : ", msg, sep = ""))
}

### Formatage de la date (en seconde)
formatDate <- function(t) {
  remain <- t
  hours <- sprintf("%02d", t %/% 3600)
  remain <- t %% 3600
  minutes <- sprintf("%02d", remain %/% 60)
  remain <- t %% 60
  secondes <- sprintf("%06.3f", remain)
  return(paste(hours, ":", minutes, ":", secondes, sep = ""))
}

### Compilation :
rm(wd_std)
package.skeleton(name = "samTools")