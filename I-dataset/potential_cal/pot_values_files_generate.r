 #only generates potenatial values files for time series analysis
 
 rm(list=ls())


 gene<-list.files("C:\\kindle_patrika\\MoserFear\\")
  for(coevolution in gene){

 shevanti<-read.table(paste("C:\\kindle_patrika\\MoserFear\\",coevolution,sep=""),skip=1)
 ramanathan<-substr(coevolution,1,(nchar(coevolution)-16) )#file name
 question<-shevanti$V4    #takes only potential value line
 write.table(question,paste("C:\\kindle_patrika\\jugnu_bholu\\",ramanathan,".txt",sep=""),col.names="AA_Potentials",row.names=F)

 }  #for ends