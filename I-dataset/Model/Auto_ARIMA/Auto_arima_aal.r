#writes auto.ARIMA model for all seq (4449)

rm(list=ls())
sunflower<-list.files("C:\\kindle_patrika\\jugnu_bholu\\")

library(forecast)  #loading for auto.arima

zangid<-NULL #for appending

for(ambada in sunflower){
inkar<-read.table(paste("C:\\kindle_patrika\\jugnu_bholu\\",ambada,sep=""),skip=1)
shukrana<-substr(ambada,1,nchar(ambada)-4)  #file name
krantivir<-auto.arima( ts(inkar$V1) )       #Auto Arima function

auto_arima_p<-length(krantivir$model$phi)  #p-value
auto_arima_q<-length(krantivir$model$theta)   #q-value
auto_arima_aicc<-krantivir$aicc   #aicc value

sanghmitra<-cbind(shukrana,auto_arima_p,auto_arima_q,auto_arima_aicc,deparse.level=0)
zangid<-rbind(zangid,sanghmitra)

}


write.table(zangid,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Auto_ARIMA\\Auto_arima_all_gumshuda.txt",col.names=c("PDB_id","Auto_arima_P","Auto_arima_Q","Auto_arima_AICC"),row.names=F)