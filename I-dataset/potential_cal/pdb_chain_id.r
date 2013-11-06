#for wrting new files with chain id  as--> pdb id_chainid.pdb

ptm<-proc.time()
library(bio3d)


file<-file("C:\\Users\\exam\\Desktop\\Halwa\\pdb_id_list.txt",open="r")
x<-readLines(file)
close(file)

corrupted_id=NULL     #takes CA only atoms id
bengali_joker<-NULL  #takes chain breaked id

#files iterating---for---> 1
for(y in x){


pdb_file_name<-substr(y,1,5)  #pdbid with chain
pdb_id<-paste(substr(y,1,4),".pdb",sep="")   #original file name with extension
pdb_id_4<-substr(y,1,4)  #original file name 
chain_id<-substr(y,5,5)  #only chain id

#cat(pdb_id,chain_id)     #checking pdb file id with chain id

folder_id<-"C:\\pdbfiles\\"

full_pdb_path<-paste(folder_id,pdb_id,sep="")

#pdb<-read.pdb(full_pdb_path,maxlines=1000000,verbose=FALSE)

pdb<-read.pdb(full_pdb_path,maxlines=1000000,verbose=FALSE)

inds<-atom.select(pdb,chain=chain_id,verbose=FALSE)
pdb<-trim.pdb(pdb,inds)
ghan_path=paste("C:\\Users\\exam\\Desktop\\pdb_chain_veer\\",pdb_id_4,"_",chain_id,".pdb",sep="")
write.pdb(pdb,xyz=pdb$xyz,file=ghan_path)

}  #writing for ends