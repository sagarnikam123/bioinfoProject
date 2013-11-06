#My-truth--->writes fasta file for BEST AR,ARMA models original stationary proteins only

#for Best ARMA_3       K:\Project_Data_Sagar\Halwa\BADMASHI\my_truth\Model\best_model\Stationary\my_truth_Best_stationary_ARMA_3.txt
rm(list=ls())
thokshahi<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\my_truth_best_stationary_ARMA_3.txt",skip=1)   #open ids of stationary files
azure<-as.character(thokshahi$V1) #all stationary ids

gh<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stat_ori_fasta\\ori_ARMA_3\\my_truth_best_stat_ARMA_3_ori.fasta","a")      #fasta file opening for appeding

 for( scandisk in azure){
dhoti_churna<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",scandisk,".txt",sep=""),skip=1)

shruti_walle<-paste(dhoti_churna[,2],collapse="")   #total aa seq
writeLines(paste(">",scandisk,sep=""),gh)
writeLines(shruti_walle,gh)
 }
close(gh)  #closing file
________________________________________________________________________________________________________________________________________________________________
#for Best AR_3
rm(list=ls())
thokshahi<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\my_truth_Best_stationary_AR_3.txt",skip=1)   #open ids of stationary files
azure<-as.character(thokshahi$V1) #all stationary ids
gh<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stat_ori_fasta\\my_truth_best_stat_AR_3_ori.fasta","a")      #fasta file opening for appeding

for( scandisk in azure){
dhoti_churna<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",scandisk,".txt",sep=""),skip=1)
shruti_walle<-paste(dhoti_churna[,2],collapse="")   #total aa seq
writeLines(paste(">",scandisk,sep=""),gh)
writeLines(shruti_walle,gh)
 }
close(gh)  #closing file




























