#my-truth--plots time series for every file

rm(list=ls())

shardul_vikridit<-list.files("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\")

for( sony in shardul_vikridit){

species<-substr(sony,1,nchar(sony)-4)   #file name

jai<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",sony,sep=""),skip=1)


galiya<-jai$V4
ts<-ts(galiya)     #time series

pdf(paste("K:\\Project_Data_Sagar\\my_truth\\haule_haule\\",species,".pdf",sep=""))
plot(ts,main=species)
dev.off()
      }   #main for ends
