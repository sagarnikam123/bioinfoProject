#selecting best forecasted from AR & ARMA models   
rm(list=ls())

#AR models
sapne<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_AR_3.txt",header=T)
dosing_criteria<-as.character(sapne$AR_PDB_id)  #all file name of best AR models--91

sat_rang<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\cooled_AR_forecast_stat_accutrek.txt",header=T)
shalini_sangraha<-as.character(sat_rang$File_Name)  #files names of all forecasted AR


zenda<-NULL #for appending resulsts
for(listered in dosing_criteria ) {

tukoba<-pmatch(listered,shalini_sangraha) #position of best model
zenda<-rbind(zenda,sat_rang[tukoba,],deparse.level=0)   #taking matched line
}

#writing best AR models
write.table(zenda,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\best_AR_forecast_stat.txt",col.names=c("File_Name","R_sq","Seq_accuracy","States_accuracy","Avg_accuracy"),row.names=F)


shuddhi<-max(zenda$Avg_accuracy)  #Max --average accuracy ---43.02326
life<-min(zenda$Avg_accuracy)#Min --average accuracy  ----10.46512

 max(zenda$Seq_accuracy)  #Max --seq accuracy---32.55814
 min(zenda$Seq_accuracy)   #Min --SEq accuracy ---1.470588
 
 
max(zenda$States_accuracy) #Max --States accuracy---56.02968
min(zenda$States_accuracy) #Min --States accuracy---12.76596

sum(zenda$Avg_accuracy)/length(zenda$Avg_accuracy)  #---Total average for all best models ----25.65231

_________________________________________________________________________________________________________________________________________________________________________________________________________
rm(list=ls())

#ARMA models
sapne<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_ARMA_3.txt",header=T)
dosing_criteria<-as.character(sapne$ARMA_PDB_id)  #all file name of best ARMA models--91

sat_rang<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\cooled_ARMA_forecast_stat_accutrek.txt",header=T)
shalini_sangraha<-as.character(sat_rang$File_Name)  #files names of all forecasted ARMA


zenda<-NULL #for appending resulsts
fanna<-NULL #for appending missing files (means zero models)
for(listered in dosing_criteria ) {

tukoba<-pmatch(listered,shalini_sangraha) #position of best model
#print(tukoba)
if(is.na(tukoba)){  fanna<-append(fanna,listered) }else{  zenda<-rbind(zenda,sat_rang[tukoba,],deparse.level=0) }   #taking matched line

}

#writing best ARMA models
write.table(zenda,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\best_ARMA_forecast_stat.txt",col.names=c("File_Name","R_sq","Seq_accuracy","States_accuracy","Avg_accuracy"),row.names=F)


shuddhi<-max(zenda$Avg_accuracy)  #Max --average accuracy ---60.10929
life<-min(zenda$Avg_accuracy)#Min --average accuracy  ----5.882353

 max(zenda$Seq_accuracy)  #Max --seq accuracy---49.72678
 min(zenda$Seq_accuracy)   #Min --SEq accuracy ---1.886792
 
 
max(zenda$States_accuracy) #Max --States accuracy--- 70.4918
min(zenda$States_accuracy) #Min --States accuracy---5.479452

sum(zenda$Avg_accuracy)/length(zenda$Avg_accuracy) #---Total average for all best models -----25.42938

