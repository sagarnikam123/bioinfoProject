#for identifying CA atoms only(corrupted ids)


rm(list=ls())  #removing previous objects
library(bio3d)

corrupted_id=NULL     #takes CA only atoms id
bengali_joker<-NULL  #takes chain breaked id


gangster<-"C:\\Users\\exam\\Desktop\\pdb_chain_veer\\"
farebi<-list.files(gangster)

#for-->1 for whole file reading
for(daman in farebi ){

pdb_id<-paste(substr(daman,1,4),".pdb",sep="")
chainiya<-paste(gangster,daman,sep="")
pdb<-read.pdb(chainiya,maxlines=1000000,verbose=FALSE)

seq<-seq.pdb(pdb)
ttr<-torsion.pdb(pdb)
phi<-ttr$phi
psi<-ttr$psi

#checking for CA
#if ---> 1 
if(length(seq)!=length(phi)){corrupted_id<-append(corrupted_id,pdb_id);
print(paste("------------------------------------Corruption--",pdb_file_name,spe=""))

}else{  
    
  
         }  #else---> 1


}#for--> 1 for whole file reading


writing corrupted ids
write.table(corrupted_id,file="C:\\Users\\exam\\Desktop\\Halwa\\BADMASHI\\corrupted_id.txt",col.names=F,row.names=F)
print(corrupted_id)


#writing breaked chain ids
#write.table(bengali_joker,file="C:\\Users\\exam\\Desktop\\Halwa\\BADMASHI\\chain_breaks_shripati.txt",col.names=F,row.names=F)
#print(bengali_joker)

rm(corrupted_id)
rm(bengali_joker)