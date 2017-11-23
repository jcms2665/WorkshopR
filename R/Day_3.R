

#Paso 0. Instalar el paquete: ggplot2
install.packages("ggplot2")


#Paso 1. Cargar las librerías: data.table, foreign, questionr, base, car y ggplot2
library(data.table)
library(foreign)
library(questionr)
library(base)
library(car)
library(ggplot2)


#Paso 2. Definir el directorio donde está la base: BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx
#        OJO: Hay que utilizar \\ o /
setwd("C:\\Users\\jmartinez\\Desktop\\WorkshopR-master\\WorkshopR-master\\Datos")


#Paso 3. Cargar la base de datos BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx
#        OJO: Poner atención al tipo de datos: excel 
#        OJO: El nombre de la base debe ser: BAR
BAR<-read.xlsx("BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx", sheetName = "ENERO")


#Paso 4. Tabular la variable SEXO para ver cuántas categorías tiene
#         OJO: Debes indicar la base, el signo $ y el nombre de la variable. 
#         Sugerencia: Usa la función "wtd.table"
wtd.table(BAR$SEXO)



#Paso 5. Tabular la variable OFICINA para ver cuántas categorías tiene
#         OJO: Debes indicar la base, el signo $ y el nombre de la variable. 
#         Sugerencia: Usa la función "wtd.table"
wtd.table(BAR$OFICINA)






# Seleccionar Columnas (variables)
var<-c("EVENTO", "OFICINA")
nueva_BAR_1 <- BAR[,var]


# Seleccionar filas (registros/casos)
BAR$ROBO<-grepl("ROBO", BAR$EVENTO, fixed=TRUE)
nueva_BAR_2 <- data.frame(BAR[which(BAR$ROBO==TRUE),])
wtd.table(nueva_BAR_2$OFICINA)


# TIPOS DE VARIABLES

#1. Variables numéricas
#2. Variables binarias
#3. Variables cadena


#1. Variables numéricas (MULTA)
BAR$MULTA <-as.numeric(as.character(BAR$MULTA))
wtd.table(BAR$MULTA)



#2. Variables binarias (SEXO)
BAR$SEXO <-as.character(BAR$SEXO)
BAR$S<-0
BAR$S[BAR$SEXO=="FEMENINO"] <- 1
wtd.table(BAR$S)


#3. Variables cadena (EVENTO)
BAR$EVENTO <-as.character(BAR$EVENTO)




