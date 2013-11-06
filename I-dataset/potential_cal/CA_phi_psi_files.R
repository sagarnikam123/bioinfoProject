#for identifying CA atoms only(corrupted ids) & writing phi_psi.pdb files


rm(list=ls())
library(bio3d)

mashuko<-getwd()   #getting default directory path
madno<-"C:\\Users\\exam\\Desktop\\pdb_chain_veer"        #source
setwd(madno)

omkarnath<-list.files()

corrupted_id=NULL     #takes CA only atoms id

#main for file iterating
for( samja_x in omkarnath){


pdb_id<-substr(samja_x,1,nchar(samja_x)-4   )
pdb<-read.pdb(samja_x,maxlines=1000000,verbose=FALSE)

seq<-seq.pdb(pdb)
ttr<-torsion.pdb(pdb)
phi<-ttr$phi
psi<-ttr$psi     
 #checking for CA 
if(length(seq)!=length(phi)){corrupted_id<-append(corrupted_id,pdb_id);
print(paste("------------------------------------Corruption--",pdb_id,spe=""))

}else{
  #long else -----> 1
  
   #writing original pdb' result----> 2
  aa_no<-attributes(seq)
  sr_no<-(1:length(seq))
  aa_no=aa_no$names
  aa=seq
  # checkes for NA
  phi[which(is.na(phi))]=0

  psi[which(is.na(psi))]=0
  
  banarasi_pan<-NULL
  #main condition ---> 2
  for (z in 1:length(phi)){ 

  if(  ( (phi[z]<=0)&(phi[z]>= -140) ) & ( (psi[z]<=0)&(psi[z]>= -100)  ) )

  {banarasi_pan<-append(banarasi_pan,1)}

  else if( ( (phi[z]<=0)&(phi[z]>= -180) ) & ( (psi[z]<=180)&(psi[z]>=80) ) ) 

  {banarasi_pan<-append(banarasi_pan,2)}

  else {banarasi_pan<-append(banarasi_pan,3)}   }

  pdb_id_4<-rep(pdb_id,length(phi))
  last<-cbind(sr_no,pdb_id_4,aa_no,aa,phi,psi,banarasi_pan)

  phi_psi_path="C:\\Users\\exam\\Desktop\\pdb_phi_psi\\"
  phi_psi_file_id<-paste(pdb_id,"_phi_psi.pdb",sep="")

  write.table(last,file=paste(phi_psi_path,phi_psi_file_id,sep=""),col.names=TRUE,row.names=FALSE)

  print(pdb_id)      
      
  } #is for CA checking --->1    
      
      
      
      
      } #file reading for ---> 1
      
#writing corrupted ids
write.table(corrupted_id,file="C:\\Users\\exam\\Desktop\\Halwa\\BADMASHI\\corrupted_id.txt",col.names=F,row.names=F)
print(corrupted_id)

#removing futuristic elements
rm(corrupted_id)
setwd(mashuko)       #setting default directory
