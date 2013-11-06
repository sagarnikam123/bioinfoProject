#plots time series for every file of potential values

rm(list=ls())
pret<-NULL

shardul_vikridit<-list.files("C:\\kindle_patrika\\PDB\\pdb_jugnu_bholu\\")   #takes potential files potentials

for( sony in shardul_vikridit){

jai<-read.table(paste("C:\\kindle_patrika\\PDB\\pdb_jugnu_bholu\\",sony,sep=""),skip=1)

species<-substr(sony,1,nchar(sony)-4)   #file name
galiya<-jai[,1]
ts<-ts(galiya)     #time series

pdf(paste("C:\\kindle_patrika\\PDB\\pdb_koi\\",species,".pdf",sep=""))   #wites pdf potential graphs
plot(ts,main=species)
dev.off()

      }   #main for ends

