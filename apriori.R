#
library(arules)
library(readr)
library(arulesViz)
setwd("C:/Users/fioab/Documents/CUC/II CUATRI/MINERIA/aprior")
productos<-read.csv("Productos.csv",sep=";")
#preparar los datos de excel a transacciones 
i=1 #columnas
j=1 #filas
for (i in 1:ncol(productos)){
 for (j in 1:nrow(productos)) {
   productos[j,i] <- ifelse (productos[j,i]>0,names(productos[i]),NA)
 }
 print(i)
}

nombres<- seq(1:ncol(productos))
names(productos)<-nombres

#definir dir de trabajo
reglas<- apriori(productos,
                parameter=list(support= 0.1, confidence=0.08))

inspeccion<- inspect(head(sort(reglas, by ="lift"),20))

library(arulesViz)

plot(reglas,method="grouped matrix",engine="interactive")

plot(reglas, engine="htmlwidget")

plot(reglas, method = "graph", engine ="htmlwidget")
