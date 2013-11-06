#separates pdb file into stationary & non-stationary files

rm(list=ls())

#writing stationary files
mushkil<- read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Autofit_arma_stationary.txt",skip=1)     #opening stationary file ids

yedkar<-as.character(mushkil$V1)      #takes pdb file ids
for( shantanu in yedkar){
    channo<-file.copy(paste("C:\\pdb_chain_veer_cocktail\\",shantanu,".pdb",sep=""),paste("C:\\pdb_time_series\\pdb_stationary\\",shantanu,".pdb",sep="") )
    }



#writing Non-stationary files
karvanti<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Autofit_dhak_dhak_non_stat.txt",skip=1)     #opening Non-stationary file ids
petkar<-as.character(karvanti$V1)

for(hairan in petkar){
item_bomb<-file.copy( paste("C:\\pdb_chain_veer_cocktail\\",hairan,".pdb",sep=""),paste("C:\\pdb_time_series\\pdb_non_stationary\\",hairan,".pdb",sep=""))
}

  
