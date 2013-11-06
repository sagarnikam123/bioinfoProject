#moving scop domain file(pdb style formats)

rm(list=ls())

jiji<-list.files("C:/Users/msc2/Downloads/SCOP/pdbstyle-1.73",recursive=TRUE)  #all files in all folders

for( sci_lab in jiji)
{
valle<-substr(sci_lab,5,nchar(sci_lab)-4) #only scop domain name without d(i.e. file name)

#mvoing
 file.rename(from=paste("C:/Users/msc2/Downloads/SCOP/pdbstyle-1.73/",sci_lab,sep=""),to=paste("C:/kindle_patrika/my_truth/scop_truth/",valle,".pdb",sep="") )

}