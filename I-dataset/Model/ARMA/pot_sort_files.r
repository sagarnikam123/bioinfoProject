#sorts stationary & non-stationary potentials files


red_sadhu<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary.txt",skip=1) #opening stationary list
bhendval<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_dhak_dhak_non_stat.txt",skip=1)    #opening Non-stationary list

#sorting stationary
pardes<-as.character(red_sadhu$V1) #ids of stationary files

for( bhosari in pardes){
khal_nayak<-read.table(paste("C:\\kindle_patrika\\PDB\\pdb_jugnu_bholu\\",bhosari,".txt",sep=""),skip=1)
write.table(khal_nayak$V1,paste("C:\\kindle_patrika\\PDB\\pdb_clf_potentials\\pdb_clf_stationary_pot\\",bhosari,".txt",sep=""),col.names=F,row.names=F)
}


#soring Non-stationary
kuckoo<-as.character(bhendval$V1) #ids of Non-stationary files

for(zumri in kuckoo){
saloni<-read.table(paste("C:\\kindle_patrika\\PDB\\pdb_jugnu_bholu\\",zumri,".txt",sep=""),skip=1)
write.table(saloni$V1,paste("C:\\kindle_patrika\\PDB\\pdb_clf_potentials\\pdb_clf_non_stat_pot\\",zumri,".txt",sep=""),col.names=F,row.names=F)

}