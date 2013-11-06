 #puts total aa of all protein takes in single value

rm(list=ls())
didi<-read.table("C:/Users/exam/Desktop/Halwa/BADMASHI/aa_freq_ek_kalsa.txt")


appendia<-NULL

for (raja_aaja in seq_along(didi[,1])){

sharmila<-as.character(didi[raja_aaja,1])  #takes aa letter
topup<-(didi[raja_aaja,2]+didi[raja_aaja,3]+didi[raja_aaja,4]) # takes all addition of states 
appendia<-rbind(appendia,c(sharmila,topup))

}

write.table(appendia,"C:\\Users\\exam\\Desktop\\Halwa\\BADMASHI\\total_aa_ultimatum.txt",col.names=F,row.names=F)
rm(appendia)