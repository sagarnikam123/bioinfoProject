#calculates prediction accuracy  for AR & ARMA model
rm(list=ls())

stephen_kaku<-list.files("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\forecast_AR_stationary\\") #all files for accuracy calculations

dubti_naiyya<-NULL #for appending final result

for(katil_anna in stephen_kaku){

jarasa<-read.table(paste("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\forecast_AR_stationary\\",katil_anna,sep=""),header=T)

white_rash<-length(jarasa$ori_pot)  #length of total values
tu_hi_mera<-jarasa$R_Square[1]  #R_Sq

auto_mantra<-length(which(as.character(jarasa$ori_AA)==as.character(jarasa$pred_AA)))  #gives no of matched AA seq
taklushahi<-length(which(jarasa$ori_states==jarasa$pred_states))  #gives matched states numbers

#calculating % Accuracy
#(total matching/Total length)*100
tarana_seq<-(auto_mantra/ white_rash)*100  #% Accuracy for AA seq
dhingana_states<-(taklushahi/ white_rash)*100  #% Accuracy for states
hatted_panchayat<-(tarana_seq+dhingana_states)/2  #Average accuracy

shamo_subah<-cbind(substr(katil_anna,1,nchar(katil_anna)-4),tu_hi_mera,tarana_seq,dhingana_states,hatted_panchayat,deparse.level=0)
dubti_naiyya<-rbind(dubti_naiyya,shamo_subah,deparse.level=0)
 
      }#for 4 file iterating

#writing result
write.table(dubti_naiyya,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\cooled_AR_forecast_stat_accutrek.txt",col.names=c("File_Name","R_sq","Seq_accuracy","States_accuracy","Avg_accuracy"),row.names=F)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________
#calculates prediction accuracy  for ARMA model
rm(list=ls())
stephen_kaku<-list.files("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\forecast_ARMA_stationary\\") #all files for accuracy calculations
                         
dubti_naiyya<-NULL #for appending final result

for(katil_anna in stephen_kaku){

jarasa<-read.table(paste("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\forecast_ARMA_stationary\\",katil_anna,sep=""),header=T)

white_rash<-length(jarasa$ori_pot)  #length of total values
tu_hi_mera<-jarasa$R_Square[1]  #R_Sq

auto_mantra<-length(which(as.character(jarasa$ori_AA)==as.character(jarasa$pred_AA)))  #gives no of matched AA seq
taklushahi<-length(which(jarasa$ori_states==jarasa$pred_states))  #gives matched states numbers

#calculating % Accuracy
#(total matching/Total length)*100
tarana_seq<-(auto_mantra/ white_rash)*100  #% Accuracy for AA seq
dhingana_states<-(taklushahi/ white_rash)*100  #% Accuracy for states
hatted_panchayat<-(tarana_seq+dhingana_states)/2  #Average accuracy

shamo_subah<-cbind(substr(katil_anna,1,nchar(katil_anna)-4),tu_hi_mera,tarana_seq,dhingana_states,hatted_panchayat,deparse.level=0)
dubti_naiyya<-rbind(dubti_naiyya,shamo_subah,deparse.level=0)
 
      }#for 4 file iterating

#writing result
write.table(dubti_naiyya,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\cooled_ARMA_forecast_stat_accutrek.txt",col.names=c("File_Name","R_sq","Seq_accuracy","States_accuracy","Avg_accuracy"),row.names=F)























