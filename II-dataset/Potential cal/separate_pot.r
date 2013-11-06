#separates only potenatial values from sangram clipso

jones<-list.files("N:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\")


for(duniya in jones ){

kismat<-read.table(paste("N:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",duniya,sep=""),skip=1) #opens file

write.table(kismat$V4,paste("N:\\Project_Data_Sagar\\my_truth\\single_pot_sangram_clipso\\",duniya,sep=""),col.names=F,row.names=F )

}