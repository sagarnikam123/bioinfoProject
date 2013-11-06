#Not-Requied---plots time series for every file of autocorrealtions

rm(list=ls())
pret<-NULL

shardul_vikridit<-list.files("C:\\Users\\msc2\\Desktop\\yeda\\")

for( sony in shardul_vikridit){

jai<-read.table(paste("C:\\Users\\msc2\\Desktop\\yeda\\",sony,sep=""))

species<-substr(sony,1,nchar(sony)-4)   #file name
galiya<-jai[,1]
ts<-ts(galiya)     #time series


pdf(paste("C:\\Users\\msc2\\Desktop\\koi\\",species,".pdf",sep=""))
plot(ts,main=species)
dev.off()


      }   #main for ends
      
      
      
  