#my-truth---writes auto.ARIMA model for all seq

rm(list=ls())
sunflower<-list.files("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\")

library(forecast)  #loading for auto.arima

zangid<-NULL #for appending

for(ambada in sunflower){
inkar<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",ambada,sep=""),skip=1)
shukrana<-substr(ambada,1,nchar(ambada)-4)  #file name
krantivir<-auto.arima( ts(inkar$V4) )       #Auto Arima function

auto_arima_p_value<-krantivir$model$phi     #p-value
auto_arima_p_order<-length(krantivir$model$phi)  #p-order

auto_arima_q_value<-krantivir$model$theta
auto_arima_q_order<-length(krantivir$model$theta)   #q-value
auto_arima_aicc<-krantivir$aicc   #aicc value

sanghmitra<-cbind(shukrana,auto_arima_p_order,paste(auto_arima_p_value,collapse=" "),auto_arima_q_order,paste(auto_arima_q_value,collapse=" "),auto_arima_aicc,deparse.level=0)
zangid<-rbind(zangid,sanghmitra)

}


write.table(zangid,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\Auto_ARIMA\\my_truth_Auto_arima_all.txt",col.names=c("PDB_id","P_order","P_value","Q_order","Q_value","Auto_arima_AICC"),row.names=F)