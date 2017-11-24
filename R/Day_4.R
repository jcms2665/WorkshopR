#Paso 0. Instalar el paquete: ggplot2
install.packages("ggplot2")


#Paso 1. Cargar las librerías: data.table, foreign, questionr, base, car y ggplot2
library(data.table)
library(foreign)
library(questionr)
library(base)
library(car)
library(ggplot2)
library(xlsx)



#Paso 2. Definir el directorio donde está la base: BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx
#        OJO: Hay que utilizar \\ o /
setwd("C:\\Users\\jmartinez\\Desktop\\WorkshopR-master\\WorkshopR-master\\Datos")


#Paso 3. Cargar la base de datos BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx
#        OJO: Poner atención al tipo de datos: excel 
#        OJO: El nombre de la base debe ser: BAR
BAR<-read.xlsx("BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx", sheetName = "BASE")


# Base de Solo mujeres

BAR_2 <- data.frame(BAR[which(BAR$SEX==1),])


# Base de Solo "TENTATIVA DE ROBO A CASA COMERCIAL"

BAR_3 <- data.frame(BAR[which(BAR$EVE==59),])


# Base de Solo Zona NORTE y EXHIBICIONISTA

BAR_4 <- data.frame(BAR[which(BAR$EVE==39 & BAR$OF==1),])


# GRAFICAS

ggplot(BAR, aes(x=EDAD)) + geom_histogram()


ggplot(BAR, aes(x=as.factor(SEX), fill=as.factor(SA) ))+geom_bar( )


ggplot(BAR, aes(x=as.factor(SEX), fill=as.factor(EVE) ))+geom_bar( )

