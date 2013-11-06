#Calculates auto.arima() for Non-stationary models

rm(list=ls())
library(forecast) #for loading auto.arima() function

dukh<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_dhak_dhak_non_stat.txt",skip=1)

melinda<-as.character(dukh$V1)     #taking all non-stationary ids


rakshak<-NULL
for(humdum in melinda){


ek_tuhi<-read.table(paste("C:\\kindle_patrika\\PDB\\pdb_jugnu_bholu\\",humdum,".txt",sep=""))

chumma<-ts(ek_tuhi$V1) #complete time series

afsana<-auto.arima(chumma)

#taking parameter
arima_p<-length(afsana$model$phi)
arima_q<-length(afsana$model$theta)
arima_aic<-afsana$aic
arima_aicc<-afsana$aicc

bhutan<-cbind(humdum,arima_p,arima_q,arima_aic,arima_aicc,deparse.level=0) 
rakshak<-rbind(rakshak,bhutan,deparse.level=0)


}        #for-file iterating


write.table(rakshak,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Non_stationary\\Autofit_arma_non_stationary_TS\\Auto_arima_non_stat_TS.txt",col.names=c("PDB_id","arima_p","arima_q","arima_aic","arima_aicc"),row.names=F)