#my_truth_calculates distance matrix for BEST auto.ARMA_3 TS of Stationary processes

rm(list=ls())                          

seq<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stationary\\my_truth_best_stationary_ARMA_3.txt",skip=1)  #opens best ARMA_3 models

ruthe<-as.character(seq$V1) #dim names (PDB file names)
ho<-seq$V2  #seq of numbers--p values
wo<-seq$V4  #seq of numbers--q values
agar<-matrix(nrow=length(ho),ncol=length(ho))  #making blank matrix

for ( i in seq_along(ho) ){
for(j in seq_along(ho)){
       agar[i,j]=sqrt(  (ho[i]-ho[j])^2 +  (wo[i]-wo[j])^2 )
          }    #small for
}    #large for


#dimnames(agar)<-list(ruthe,ruthe) #setting dimension names of matrix
dimnames(agar)<-list(ruthe,NULL)
                                               
write.table(agar,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stat_tree_TS\\ARMA_3\\my_truth_best_stat_ARMA_3_TS_dist_matrix.txt",col.names=F)

#for making dist matrix table
library(stringr)      #for string manipulation(right padding/blankspaces)

fileConn<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\best_model\\Stat_tree_TS\\ARMA_3\\my_truth_best_stat_ARMA_3_TS_phylip_dist.txt","a")  #opening file connection (appending mode)
writeLines(paste("",length(agar[1,]),sep=""), fileConn)   #writing length of seq

for (i in seq_along(agar[1,])){
w<-sprintf("%f",agar[i,])   #converting to decimal places
sarata<-paste(substr(w[1:length(w)],1,6),collapse="  ")    #converting to string,taking only five digits & collapsing all values to again string
audi<- str_pad(names(agar[i,1]), width=8, side = "right", pad = " ")  #name only
sampat<-paste(audi,sarata,sep="     ")
writeLines(sampat, fileConn)   #appending line to file
}
close(fileConn)    #closing file connection