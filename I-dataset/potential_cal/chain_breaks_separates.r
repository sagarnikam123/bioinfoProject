#for finding chain breaks & separating files into fragments

rm(list=ls())
library(bio3d)

corrupted_id=NULL     #takes CA only atoms id
bengali_joker<-NULL  #takes chain breaked id


gangster<-"C:\\Users\\exam\\Desktop\\pdb_chain_veer\\"
farebi<-list.files(gangster)

#for-->1 for whole file reading
for(daman in farebi ){

pdb_id<-paste(substr(daman,1,6),".pdb",sep="")
pdb_id_chain<-substr(daman,1,6)
chainiya<-paste(gangster,daman,sep="")    #putting file path
pdb<-read.pdb(chainiya,maxlines=1000000,verbose=FALSE)

#checking chain breaks
spartacus<-NULL #for taking first index of breaked(started)
show<-as.numeric(unique(pdb$atom[,6]))  #taking unique resno only

for(bond in 1:(length(show)-1)){
if(show[bond+1]-show[bond]!=1){
#print(show[bond+1])  #prints first atom starts after breaks
spartacus<-append(spartacus,bond+1) }
}
#spartacus<-array(spartacus) #takes only first index of breaked(started)

# breaks  if (small)
  if(length(spartacus)>0){

retiwala_navra<-1  #for intitiating value from 1
you_know<-NULL
for( ss in spartacus){
     you_know<-append(you_know,ss-retiwala_navra)
     retiwala_navra<-ss     
    }
rm(retiwala_navra)   #removing unwanted
you_know<-append(you_know,length(show)-sum(you_know)) #contains final fragments length
    
  chain_length<-paste(you_know,collapse=" ")
  after_resno<-paste((spartacus-1),collapse=" ")
  no_breaks<-length(spartacus)
  
  sufiyana<-paste(pdb_id,no_breaks,"--->",after_resno,"<---",chain_length,sep=" ")
  bengali_joker<-append(bengali_joker,sufiyana)       #appending
  cat(paste("Found","-------------->",length(spartacus),pdb_id,"\n"))
  
  vf_index<-0
  vl_index<-0
  reception_counter<-0   
  for ( zingtel in seq_along(you_know)) {

  vf_atom<-show[vf_index+1]  #takes first res no
  vl_index<-vf_index+you_know[zingtel]
  
  vl_atom<-show[vl_index]  #takes last res no
  #checking file length for >40 residues
  if((you_know[zingtel])>40){
  reception_counter<-reception_counter+1    #counter for file number
  i_papita<-atom.select(pdb,resno=vf_atom:vl_atom,verbose=FALSE)   #takes index of res
  happening<-trim.pdb(pdb,i_papita)   #creates new pdb file
  ghan_path=paste("C:\\Users\\exam\\Desktop\\Halwa\\Arman\\",pdb_id_chain,"_",reception_counter,".pdb",sep="")
  write.pdb(happening,xyz=happening$xyz,file=ghan_path)
       } #writing cutted files
  vf_index<- vl_index
   
  } # intermediate for------breaked chain breaking & making

  }  # breaks  else (small) new chain breaks
          
       
 }  #last for ending   
 
#writing breaked chain ids
write.table(bengali_joker,file="C:\\Users\\exam\\Desktop\\Halwa\\BADMASHI\\chain_breaks_shripati.txt",col.names=F,row.names=F)
print(bengali_joker)

rm(bengali_joker)       