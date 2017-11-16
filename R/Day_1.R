
#######################################################################################
#           CURSO DE CAPACITACIÓN DEL SOFTWARE R                                      #
#           SIMO Consulting                                                           #
#           Julio César Martínez Sánchez                                              #
#######################################################################################

#           Temario
#
# 0. Consideraciones iniciales
# 1. Frecuencias
# 2. Tabulados
# 3. Etiquetar variables
# 4. Recodificar variables
# 5. Subconjunto de datos


#######################################################################################
#0. Consideraciones iniciales

      #0.1  Instalar paquetes 
            install.packages(c("foreign","data.table","questionr","base","car"))

      #0.2  Cargar las librerias
            library(data.table)
            library(foreign)
            library(questionr)
            library(base)
            library(car)

      #0.3  Limpiar el entorno de trabajo
            rm(list = ls())
            # Ctrl + L  Limpia la consola  
      
      #0.4  Definir el directorio 
            # Hay que utilizar \\ o / 
            setwd("C:/Users/jmartinez/Desktop/TalleR-master/TalleR-master/Datos")
      
      #0.5  Importar datos:     excel, dbf,dbf, stata, csv, sas   ->   R 

            dbf<-data.frame(read.dbf("EJEMPLO_DBF.dbf"))
            cvs<- data.frame(read.table("BARANDILLA.csv", header=TRUE, sep=","))

      
      #0.6  Exportar datos:      R    ->    excel, dbf,dbf, stata, csv, sas

            #0.6.1 Limpiamos y solo nos quedamos  con la base de dbf
                    rm("cvs") 
          
            #0.6.4 Guardamos en CSV (Excel)
                    write.table(dbf, "Julio_R.txt", sep=",")

                          
      #0.7  Descripción de la base
            
            #0.7.1  Descripción de la base
                    names(dbf)
                    head(dbf,2)
      
            #0.7.2  Columnas (como en EXCEL)
                    dbf[1,]
                    dbf[1:3,]
            
            #0.7.3  Filas (como en EXCEL)
                    dbf[,22]
                    dbf[,c("SEX")]
      
            #0.7.4  Columnas y filas 
                    dbf[1:3,9]
      
#######################################################################################
  
#1. Frecuencias
                    
      #1.0  Ayuda
            ?wtd.table

      #1.1  Frecuencias con datos muestrales (sin ponderar)
            wtd.table(dbf$POS_OCU)


#######################################################################################
#2. Tabulados

      #2.1  Tabulados con datos muestrales 
            wtd.table(dbf$SEX,dbf$POS_OCU)
            
#######################################################################################
#3. Etiquetar variables

      #3.1  Generar etiquetas (variable SEXO)
            dbf$SEX <- factor(dbf$SEX,levels = c(1,2),labels = c("Hombre", "Mujer"))
            
      #3.2  Tabular variable etiquetada
            wtd.table(dbf$SEX)
            
      #3.3  Generar etiquetas (variable POS_OCU)
            dbf$POS_OCU <- factor(dbf$POS_OCU,levels = c(1,2,3,4,5),labels = c("Subordinados", "Empleadores","Cuenta Propia", "Sin Pago","NE"))
            
      #3.4  Tabulado 2x2 (SEXO x POS_OCU)
            wtd.table(dbf$POS_OCU, dbf$SEX)
            

#######################################################################################
#4. Recodificar variables
      
      #4.1  Recodificion de variables numericas (rangos)
            
            #4.1.1  Convertir a numéricas
            dbf$EDA <-as.numeric(as.character(dbf$EDA))
            
            #4.1.2  Crear nueva variable
            dbf$EDA_5categ<-0
            
            #4.1.3  Establecer los rangos
            dbf$EDA_5categ[dbf$EDA >= 0 & dbf$EDA <=10] <- 1
            dbf$EDA_5categ[dbf$EDA >= 11 & dbf$EDA <=20] <- 2
            dbf$EDA_5categ[dbf$EDA >= 21 & dbf$EDA <=30] <- 3
            dbf$EDA_5categ[dbf$EDA >= 31 & dbf$EDA <=40] <- 4
            dbf$EDA_5categ[dbf$EDA >= 41] <- 5          

            #4.1.4 Validar
            wtd.table(dbf$EDA_5categ)

      #4.2  Recodificion de variables tipo caracter
            
            #4.2.1  Convertir a caracter
            dbf$R_DEF <- as.character(dbf$R_DEF)
            
            #4.2.2  Crear nueva variable
            dbf$R_DEF_VALIDO <-" "
            
            #4.2.3  Establecer los rangos
            
            dbf$R_DEF_VALIDO[dbf$R_DEF!="00"] <- "Entrevista incompleta"
            dbf$R_DEF_VALIDO[dbf$R_DEF=="00"] <- "Entrevista completa"

            #4.2.4 Validar
            wtd.table(dbf$R_DEF_VALIDO)
                 
#######################################################################################
#5. Subconjunto de datos

      #5.1  Seleccionar variables
            
            #5.1.1 Definimos las variables
                   var<-c("SEX", "POS_OCU")
            
            #5.1.2 Seleccionamos SÓLO esas variables
                   nueva_dbf_1 <- dbf[,var]
            

      #5.2  Seleccionar casos          
            nueva_dbf_2 <- dbf[ which(as.numeric(dbf$EDA)<18), ]


      #5.3  Seleccionar variables y casos
            nueva_dbf_1 <- dbf[which(as.numeric(dbf$EDA)<18), c("SEX", "POS_OCU")]


