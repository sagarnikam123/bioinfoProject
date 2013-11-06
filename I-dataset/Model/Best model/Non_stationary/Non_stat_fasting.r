#writes fasta for Autofit/ARMA Non-stationary models

rm(list=ls())
                                 
shakti<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_dhak_dhak_non_stat.txt",skip=1)   #open ids of Non-stationary files
nabhi<-as.character(shakti$V1) #all stationary ids

bhutni<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\Best model\\Non_stationary\\Autofit_non_stationary.fasta","a")      #fasta file opening for appeding
                                                          

 for( sampurna in nabhi){
dhoti_churna<-read.table(paste("C:\\pdb_phi_psi\\",sampurna,"_phi_psi.pdb",sep=""),skip=1)
bonanza<-as.character(dhoti_churna[1,2])  #file name
shruti_walle<-paste(dhoti_churna[,4],collapse="")   #total aa seq
writeLines(paste(">",bonanza,sep=""),bhutni)
writeLines(shruti_walle,bhutni)

 }

close(bhutni)  #closing file