#deletes are corruped id

chudi<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\corrupted_id.txt")

chudi<-as.character(chudi$V1) #converting to characters
#destroying in pdb_chain_veer_cocktail,contains only considered pdb finally
for( kidadas in chudi){
 payal<-unlink(paste("C:\\pdb_chain_veer_cocktail\\",kidadas,".pdb",sep=""))
 }



 kudi<-list.files("C:\\pdb_chain_veer_cocktail\\")
 
 #destroying in pdb_chain_veer_nt_consider,contains only corrupted ids
 for(jalview in kudi){

 unlink(paste("C:\\pdb_chain_vir_nt_cons\\",jalview,sep=""))
    }