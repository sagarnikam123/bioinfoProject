#Uncomplete

#My-truth---> selects best model by compairing AIC/AICc values of AR , Autofit/ARMA & auto.ARIMA models ---->3 Models
rm(list=ls())

#reading data files
apiary<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\AR\\my_truth_AR_aic.txt",skip=1)       #opening mix AR_aic model data
csir_gate<-as.character(apiary$V1)  #all AR_aic ids

babuji<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\ARMA\\my_truth_autofit_arma_stationary.txt",skip=1)#opening autofit/ARMA stationary models



picture<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\Auto_ARIMA\\my_truth_Auto_arima_all.txt",skip=1)   #opening Auto_ARIMA data
gol_square<-as.character(picture$V1)  #all auto_arima ids

leaflet<-NULL   #best AR model
guni_ranjan<-NULL   #best ARMA model
nasheman<-NULL  #best ARIMA model
sukratu_karve<-NULL #Non-model ids(where p,q are zeros)

for( nature in seq_along(babuji$V1) ){

bhaltach<-as.character(babuji[nature,]$V1)   #takes pdb id of stationary model with .txt
nav_rich<-substr(bhaltach,1,nchar(bhaltach)-4)

code_id<-pmatch(nav_rich,csir_gate)  #extracts position in AR_aic file
sairam<-pmatch(nav_rich,gol_square)  #extracts position in Auto_arima file

#taking aic
ar_balkadu<-apiary[code_id,]$V4        #AR_std_aic value
arma_aicc<-babuji[nature,]$V7  #ARMA AICc of stationary
auto_arima_aicc<-picture[sairam,]$V6  #auto ARIMA aicc                 #


 #checking which AIC/AICc value great
 srujan_chintan<-which.min(c(ar_balkadu,arma_aicc,auto_arima_aicc))
 print(srujan_chintan)

 if(srujan_chintan==1 &&  apiary[code_id,]$V2!=0  ){nishani<-cbind(as.character(apiary[code_id,]$V1),apiary[code_id,]$V2,apiary[code_id,]$V4,deparse.level=0);  guni_ranjan<-rbind(guni_ranjan,nishani,deparse.level=0)}         #AR
 else if(srujan_chintan==2 && babuji[nature,]$V2!=0 | babuji[nature,]$V4!=0 ){khelpatti<-cbind(nav_rich,babuji[nature,]$V2,babuji[nature,]$V3,babuji[nature,]$V4,babuji[nature,]$V5,babuji[nature,]$V6,babuji[nature,]$V7,deparse.level=0);  leaflet<-rbind(leaflet,khelpatti,deparse.level=0)}   #ARMA
 else if(srujan_chintan==3 && picture[sairam,]$V2!=0 | picture[sairam,]$V4!=0 ){ subbu<-cbind(as.character(picture[sairam,]$V1),picture[sairam,]$V2 ,picture[sairam,]$V3,picture[sairam,]$V4,picture[sairam,]$V5,picture[sairam,]$V6,deparse.level=0);  nasheman<-rbind(nasheman,subbu,deparse.level=0) } #auto_ARIMA
else {}
          } #checking for ends


#writes Best AR model list
 if(is.null(guni_ranjan)){write("Your All AR models fails for \"Best fitted Model\"","K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\Best_stationary_AR_3.txt")}else{
 write.table(guni_ranjan,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\Best_stationary_AR_3.txt",col.names=c("AR_PDB_id","P_order","AIC"),row.names=F)  } #AR last else

 #writes Best ARMA model  list
if(is.null(leaflet)){write("Your All ARMA models fails for \"Best fitted Model\"","K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\Best_stationary_ARMA_3.txt")}else{
write.table(leaflet,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\Best_stationary_ARMA_3.txt",col.names=c("Auto_ARMA_PDB_file","Autof_p_order","Autof_ar_p_value","Autof_q_order","AutoF_ma_q_value","Autof_sigma2","AutoF_aicc"),row.names=F)     }  #ARMA last else

 #writes Best auto ARIMA model  list
if(is.null(nasheman)){write("Your All auto_ARIMA models fails for \"Best fitted Model\"","K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\Best_stationary_auto_ARIMA_3.txt")}else{
write.table(nasheman,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\Best_stationary_ARIMA_3.txt",col.names=c("Auto_arima_PDB_id","P_order","P_value","Q_order","Q_value","Auto_arima_AICC"),row.names=F)     }  #Auto_ARIMA last else

