#my_truth_calculates distance matrix  for Best_AR_3_stationary_TS_models
rm(list=ls())


room<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\my_truth_Best_stationary_AR_3.txt",skip=1)     #opens BEST_AR_AIC file

ruthe<-as.character(room$V1) #dim names (file names)
ho<-room$V2  #seq of numbers--p values
agar<-matrix(nrow=length(ho),ncol=length(ho))  #making blank matrix

for ( i in seq_along(ho) ){
for(j in seq_along(ho)){
       agar[i,j]=abs(ho[i]-ho[j])
          }    #small for
}    #large for


#dimnames(agar)<-list(ruthe,ruthe) #setting dimension names of matrix
dimnames(agar)<-list(ruthe,NULL)

write.table(agar,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stat_tree_TS\\AR_3\\my_truth_best_AR_dist_TS_3.txt",col.names=F)

#for making dist matrix table
library(stringr)      #for string manipulation(right padding/blankspaces)

fileConn<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stat_tree_TS\\AR_3\\my_truth_best_AR_dist_TS_3_protdist.txt","a")  #opening file connection (appending mode)
writeLines(paste("",length(agar[1,]),sep=""), fileConn)   #writing length of seq

for (i in seq_along(agar[1,])){
w<-sprintf("%f",agar[i,])   #converting to decimal places
sarata<-paste(substr(w[1:length(w)],1,6),collapse="  ")    #converting to string,taking only five digits & collapsing all values to again string
audi<- str_pad(names(agar[i,1]), width=8, side = "right", pad = " ")  #name only
sampat<-paste(audi,sarata,sep="     ")
writeLines(sampat, fileConn)   #appending line to file
}
close(fileConn)    #closing file connection
__________________________________________________________________________________________________________________________________________________________________________________
#finds fasta seq for best AR_3_stat

#for AR_3
rm(list=ls())
thokshahi<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stationary_AR_3.txt",skip=1)   #open ids of stationary files
azure<-as.character(thokshahi$V1) #all stationary ids
gh<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best_model\\Stationary\\Best_stationary_3\\Best_stat_AR_3\\Best_stat_AR_3_ori.fasta","a")      #fasta file opening for appeding

for( scandisk in azure){
dhoti_churna<-read.table(paste("C:\\kindle_patrika\\PDB\\pdb_phi_psi\\",scandisk,"_phi_psi.pdb",sep=""),skip=1)
bonanza<-as.character(dhoti_churna[1,2])  #file name
shruti_walle<-paste(dhoti_churna[,4],collapse="")   #total aa seq
writeLines(paste(">",bonanza,sep=""),gh)
writeLines(shruti_walle,gh)
 }
close(gh)  #closing file













