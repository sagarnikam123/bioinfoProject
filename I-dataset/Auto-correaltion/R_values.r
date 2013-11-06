#Not required---writes r-values only in single files

rm(list=ls())
diesel<-"C:\\Users\\msc2\\Desktop\\rajaRampool\\"
order<-list.files(diesel)


for(one_mb in order){

red_fm<-paste(diesel,one_mb,sep="")

shala<-read.table(red_fm,skip=1)
shala[,1]  #checking

kolaveri<-paste("C:\\Users\\msc2\\Desktop\\yeda\\",substr(one_mb,1,nchar(one_mb)-8),".txt",sep="" )
write.table(shala[,1],file=kolaveri,col.names=F,row.names=F)

}               #for ends