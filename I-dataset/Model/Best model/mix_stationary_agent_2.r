#selects best model by compairing AIC/AICc values of AR & Autofit/ARMA models
rm(list=ls())

#reading data files
babuji<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary.txt",skip=1)#opening autofit/ARMA stationary models

apiary<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\AR\\AR_aic.txt",skip=1)       #opening mix AR_aic model data
     

csir_gate<-as.character(apiary$V1)  #all AR_aic ids

guni_ranjan<-NULL   #best ARMA model
leaflet<-NULL   #best AR model


for( nature in seq_along(babuji$V1) ){

nav_rich<-as.character(babuji[nature,]$V1)    #takes pdb id of stationary model

code_id<-pmatch(nav_rich,csir_gate)  #extracts position in AR_aic file
 
 arma_aicc<-babuji[nature,]$V4  #AICc of stationary    
 #ar_balkadu<-apiary[code_id,]$V3        #AR_my_aic value
 ar_balkadu<-apiary[code_id,]$V4        #AR_std_aic value
 
 #checking which AIC/AICc value great
 if(which.min(c(arma_aicc,ar_balkadu))==1){dahi_lassi<-cbind(nav_rich,babuji[nature,]$V2,babuji[nature,]$V3,babuji[nature,]$V4);guni_ranjan<-rbind(guni_ranjan,dahi_lassi) }else { khelpatti<-cbind(as.character(apiary[code_id,]$V1),apiary[code_id,]$V2,apiary[code_id,]$V4,deparse.level=0)
 leaflet<-rbind(leaflet,khelpatti,deparse.level=0) }
 
          } #checking for ends
 
 #writes Best ARMA model  list
if(is.null(guni_ranjan)){write("Your All ARMA models fails for \"Best fitted Model\"","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_2\\Best_stationary_ARMA_2.txt")}else{ 
write.table(guni_ranjan,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_2\\Best_stationary_ARMA_2.txt",col.names=c("Best_stationary_ARMA_2","P_value","Q_value","AICC"),row.names=F)     }  #ARMA last else
                                
 #writes Best AR model list
 if(is.null(leaflet)){write("Your All AR models fails for \"Best fitted Model\"","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_2\\Best_stationary_AR_2.txt")}else{
 write.table(leaflet,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_2\\Best_stationary_AR_2.txt",col.names=c("Best_stationary_AR_id_2","P_value","AR_AIC"),row.names=F)  } #AR last else 
 