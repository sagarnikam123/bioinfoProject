#checks files with length <40

rm(list=ls())
chandni<-list.files("C:\\pdb_phi_psi\\")
maja<-NULL  #for taking <40 wale files ids

for ( chainny in chandni)
{     no<-read.table(paste("C:\\pdb_phi_psi\\",chainny,sep=""),skip=1)
      if( (length(no[,3]))<40 ) maja<-append(maja,chainny)
            }

#writing less than 40 ids
write.table(maja,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\pot tamasha\\forty_gholiya.txt",col.names=F,row.names=F)
___________________________________________________________________________________________________________________________________________________________________

#deletes in _phi_psi.pdb files

hari<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\pot tamasha\\forty_gholiya.txt")  #opeing ghotala file

prabhu<-as.character(hari$V1) #converting to characters

for(ishwar in prabhu){
 unlink(paste("C:\\pdb_phi_psi\\",ishwar,sep=""))
    }
____________________________________________________________________________________________________________________________________________________________________
#deletes in pdb_chain_veer_cocktail,contains only considered pdb finally

hari<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\pot tamasha\\forty_gholiya.txt")  #opeing ghotala file
prabhu<-as.character(hari$V1) #converting to characters
aldrich<-substr(prabhu,1,nchar(prabhu[1])-12)  #deleting _phi_psi.pdb string
again<-paste(aldrich,".pdb",sep="")  #adding .pdbname

for(tinu in again){
 unlink(paste("C:\\pdb_chain_veer_cocktail\\",tinu,sep=""))
    }
____________________________________________________________________________________________________________________________________________________________________
#deletes       _phi_phi_pot.pdb

hari<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\pot tamasha\\forty_gholiya.txt")  #opeing ghotala file
prabhu<-as.character(hari$V1) #converting to characters
aldrich<-substr(prabhu,1,nchar(prabhu[1])-12)  #deleting _phi_psi.pdb string
again<-paste(aldrich,"_phi_psi_pot.pdb",sep="")  #adding _phi_psi_pot.pdb name

for(tinu in again){
 unlink(paste("C:\\Users\\msc2\\Desktop\\MoserFear\\",tinu,sep=""))
    }