#calculates autocorrelation with each another

rm(list=ls())
rutba<-list.files("C:\\kindle_patrika\\PDB\\pdb_MoserFear\\")


for( retiwalu in rutba){

 zhumka<-substr(retiwalu,1,(nchar(retiwalu)-16)  )    #takes file name
 chipku<-paste("C:\\kindle_patrika\\PDB\\pdb_MoserFear\\",retiwalu,sep="")
pas<-read.table(chipku,skip=1)

potential<-pas[,4]
mean<-mean(potential)


N<-length(potential)

surya<-NULL   #for appending cor value
kai_zale<-NULL  #for appending t-value

for(jahan in seq_len(N-1) ){   #for each lag

k<-jahan  #for which lag

up_k<-0
for(i in seq_len(N-k)){
sadha_job<-(potential[i]-mean)*(potential[i+k]-mean)
up_k<-up_k+sadha_job
} #up_k


down_k<-0
for (j in seq_len(N) ){
flex<-(potential[j]-mean)**2
down_k<-down_k+flex
} #down_k


r_k<-up_k/down_k   #calculates correlation coe value
surya<-append(surya,r_k)

thumka<-r_k*(sqrt(N-2/1-(r_k)**2) )  #calculates t-value
kai_zale<-append(kai_zale,thumka)
#print(paste("r--> ",r_k,"  t--> ",thumka ) )


rm(up_k)
rm(down_k)
}  #for each lag

#writing each t-valued file
pani_lao<-cbind(surya,kai_zale,deparse.level=0)
lexicon<-paste("C:\\kindle_patrika\\PDB\\pdb_rajaRampool\\",zhumka,"_r_k",".pdb",sep="")
write.table(pani_lao,lexicon,col.names=c("r-value","t-value"),row.names=F)

} #for folder iterating