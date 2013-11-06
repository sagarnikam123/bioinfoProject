#writes fasta file for BEST AR,ARMA,ARIMA models original stationary proteins only

#for ARMA_3 
rm(list=ls())
thokshahi<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Stationary\\Best_stationary_3\\Best_stationary_ARMA_3.txt",skip=1)   #open ids of stationary files
azure<-as.character(thokshahi$V1) #all stationary ids
                  
gh<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Stationary\\Best_stationary_3_fasta\\Best_stationary_ARMA_3_ori.fasta","a")      #fasta file opening for appeding
                                            
 for( scandisk in azure){
dhoti_churna<-read.table(paste("C:\\pdb_phi_psi\\",scandisk,"_phi_psi.pdb",sep=""),skip=1)
bonanza<-as.character(dhoti_churna[1,2])  #file name
shruti_walle<-paste(dhoti_churna[,4],collapse="")   #total aa seq
writeLines(paste(">",bonanza,sep=""),gh)
writeLines(shruti_walle,gh)
 }
close(gh)  #closing file
________________________________________________________________________________________________________________________________________________________________
#for AR_3 
rm(list=ls())
thokshahi<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Stationary\\Best_stationary_3\\Best_stationary_AR_3.txt",skip=1)   #open ids of stationary files
azure<-as.character(thokshahi$V1) #all stationary ids
gh<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Stationary\\Best_stationary_3_fasta\\Best_stationary_AR_3_ori.fasta","a")      #fasta file opening for appeding
                                          
for( scandisk in azure){
dhoti_churna<-read.table(paste("C:\\pdb_phi_psi\\",scandisk,"_phi_psi.pdb",sep=""),skip=1)
bonanza<-as.character(dhoti_churna[1,2])  #file name
shruti_walle<-paste(dhoti_churna[,4],collapse="")   #total aa seq
writeLines(paste(">",bonanza,sep=""),gh)
writeLines(shruti_walle,gh)
 }
close(gh)  #closing file
____________________________________________________________________________________________________________________________________________________________________________
 #for ARIMA_3 
rm(list=ls())
thokshahi<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Stationary\\Best_stationary_3\\Best_stationary_ARIMA_3.txt",skip=1)   #open ids of stationary files
azure<-as.character(thokshahi$V1) #all stationary ids
gh<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Stationary\\Best_stationary_3_fasta\\Best_stationary_ARIMA_3_ori.fasta","a")      #fasta file opening for appeding
                                          
for( scandisk in azure){
dhoti_churna<-read.table(paste("C:\\pdb_phi_psi\\",scandisk,"_phi_psi.pdb",sep=""),skip=1)
bonanza<-as.character(dhoti_churna[1,2])  #file name
shruti_walle<-paste(dhoti_churna[,4],collapse="")   #total aa seq
writeLines(paste(">",bonanza,sep=""),gh)
writeLines(shruti_walle,gh)
 }
close(gh)  #closing file

































































