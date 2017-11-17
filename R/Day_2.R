

#
install.packages("xlsx")

#
library(data.table)
library(foreign)
library(questionr)
library(base)
library(car)
library(xlsx)


#
setwd("C:\\Users\\jmartinez\\Desktop\\WorkshopR-master\\WorkshopR-master\\Datos")

#
BAR<-read.xlsx("BARANDILLA SEPTIEMBRE 2016 (051016 1031 MHT).xlsx", sheetName = "Sheet1")

#
wtd.table(BAR$OFICINA)

#
wtd.table(BAR$EVENTO)



# *********** ROBO

#1. Creo una variable llamada "ROBO" en donde ponga TRUE si en evento dice "ROBO"
BAR$ROBO<-grepl("ROBO", BAR$EVENTO, fixed=TRUE)

#2. Tabulo la nueva variable
wtd.table(BAR$ROBO)

#3. Creo una base más pequeña que solo tenga ROBO igual a TRUE
BAR_ROBO<-BAR[which(BAR$ROBO==TRUE),]



# *********** MOLESTIAS

#1. Creo una variable llamada "MOL" en donde ponga TRUE si en evento dice "MOLESTIAS"
BAR$MOL<-grepl("MOLESTIAS", BAR$EVENTO, fixed=TRUE)

#2. Tabulo la nueva variable
wtd.table(BAR$MOL)

#3. Creo una base más pequeña que solo tenga ROBO igual a TRUE

BAR$MOLESTIAS<-0
BAR$MOLESTIAS[BAR$MOL==TRUE] <- 1

wtd.table(BAR$MOLESTIAS)

wtd.table(BAR$MOLESTIAS, BAR$OFICINA)

