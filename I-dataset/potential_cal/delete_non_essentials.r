#deletes files(not useful)formed due to isolated fragmented chains 
 
 rm(list=ls())
 midnight_surflex<-getwd()
 duniya<-list.files("C:\\Users\\exam\\Desktop\\Halwa\\Arman")
 
 rational_dhum<-NULL
 
 for(duriyan in duniya){
 rational_dhum<-append(rational_dhum,paste(substr(duriyan,1,6),".pdb",sep="") )
  }
 
 rational_dhum<-unique(rational_dhum) #taking only unique ids for deletion
 setwd("C:\\Users\\exam\\Desktop\\pdb_chain_veer")

#deleting files
 
 for(tanha_bheed in rational_dhum){
 unlink(tanha_bheed)
 }
 
setwd(midnight_surflex)