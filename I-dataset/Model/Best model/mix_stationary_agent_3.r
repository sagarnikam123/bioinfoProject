#selects best model by compairing AIC/AICc values of AR , Autofit/ARMA & auto.ARIMA models ---->3 Models
rm(list=ls())

#reading data files
apiary<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\AR\\AR_aic.txt",skip=1)       #opening mix AR_aic model data
csir_gate<-as.character(apiary$V1)  #all AR_aic ids

babuji<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary.txt",skip=1)#opening autofit/ARMA stationary models



picture<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Auto_ARIMA\\Auto_arima_all_gumshuda.txt",skip=1)   #opening Auto_ARIMA data
gol_square<-as.character(picture$V1)  #all auto_arima ids

leaflet<-NULL   #best AR model
guni_ranjan<-NULL   #best ARMA model
nasheman<-NULL  #best ARIMA model

for( nature in seq_along(babuji$V1) ){

nav_rich<-as.character(babuji[nature,]$V1)    #takes pdb id of stationary model

code_id<-pmatch(nav_rich,csir_gate)  #extracts position in AR_aic file
sairam<-pmatch(nav_rich,gol_square)  #extracts position in Auto_arima file

#taking aic
ar_balkadu<-apiary[code_id,]$V4        #AR_std_aic value
arma_aicc<-babuji[nature,]$V4  #ARMA AICc of stationary
auto_arima_aicc<-picture[sairam,]$V4  #auto ARIMA aicc                 #


 #checking which AIC/AICc value great
 srujan_chintan<-which.min(c(ar_balkadu,arma_aicc,auto_arima_aicc))

 if(srujan_chintan==1){nishani<-cbind(as.character(apiary[code_id,]$V1),apiary[code_id,]$V2,apiary[code_id,]$V4,deparse.level=0);  guni_ranjan<-rbind(guni_ranjan,nishani,deparse.level=0)}         #AR
 if(srujan_chintan==2){khelpatti<-cbind(nav_rich,babuji[nature,]$V2,babuji[nature,]$V3,babuji[nature,]$V4,deparse.level=0);  leaflet<-rbind(leaflet,khelpatti,deparse.level=0)}   #ARMA
 if(srujan_chintan==3){ subbu<-cbind(as.character(picture[sairam,]$V1),picture[sairam,]$V2 ,picture[sairam,]$V3,picture[sairam,]$V4,deparse.level=0);  nasheman<-rbind(nasheman,subbu,deparse.level=0) }  #auto_ARIMA

          } #checking for ends


#writes Best AR model list
 if(is.null(guni_ranjan)){write("Your All AR models fails for \"Best fitted Model\"","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_AR_3.txt")}else{
 write.table(guni_ranjan,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_AR_3.txt",col.names=c("AR_PDB_id","P_value","AIC"),row.names=F)  } #AR last else

 #writes Best ARMA model  list
if(is.null(leaflet)){write("Your All ARMA models fails for \"Best fitted Model\"","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_ARMA_3.txt")}else{
write.table(leaflet,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_ARMA_3.txt",col.names=c("ARMA_PDB_id","P_value","Q_value","AICC"),row.names=F)     }  #ARMA last else

 #writes Best auto ARIMA model  list
if(is.null(nasheman)){write("Your All auto_ARIMA models fails for \"Best fitted Model\"","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_auto_AIRMA_3.txt")}else{
write.table(nasheman,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_ARIMA_3.txt",col.names=c("Auto_ARIMA_PDB_id","P_value","Q_value","AICC"),row.names=F)     }  #Auto_ARIMA last else

