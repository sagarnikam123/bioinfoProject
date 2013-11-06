#my_truth---plots time series for every file of autocorrealtions
#N0t work in R-studio

rm(list=ls())
pret<-NULL

shardul_vikridit<-list.files("N:\\Project_Data_Sagar\\my_truth\\single_pot_sangram_clipso\\")

for( sony in shardul_vikridit){

jai<-read.table(paste("N:\\Project_Data_Sagar\\my_truth\\single_pot_sangram_clipso\\",sony,sep=""))

species<-substr(sony,1,nchar(sony)-4)   #file name
acf(jai$V1,main=paste("ACF plot",species),col="red")    #ACF plotting

savePlot(paste("N:\\Project_Data_Sagar\\my_truth\\acf_sangram_clipso\\",species,sep=""),type="jpeg")

    }   #main for ends
___________________________________________________________________________________________________________________________________________
#plots PACF
rm(list=ls())
pret<-NULL

shardul_vikridit<-list.files("N:\\Project_Data_Sagar\\my_truth\\single_pot_sangram_clipso\\")

for( sony in shardul_vikridit){

jai<-read.table(paste("N:\\Project_Data_Sagar\\my_truth\\single_pot_sangram_clipso\\",sony,sep=""))

species<-substr(sony,1,nchar(sony)-4)   #file name
pacf(jai$V1,main=paste("PACF plot",species),col="red")    #ACF plotting

savePlot(paste("N:\\Project_Data_Sagar\\my_truth\\pacf_sangram_clipso\\",species,sep=""),type="jpeg")

    }   #main for ends



