#writes_separate potentials files(of selected size)
rm(list=ls())

black_pearl<-list.files("K:\\Project_Data_Sagar\\my_truth\\recruit_truth\\")
altis<-as.numeric(substr(black_pearl,10,12))        #only numbers indicating no of AA residues in each files


#>100
length(which(altis>110 & altis<120))  #---> 1110
length(which(altis>120 & altis<130))  #907
length(which(altis>130 & altis<140))  #728
length(which(altis>90 & altis<100))   #1546
.
length(which(altis>=100 & altis<=110))  #2199
length(which(altis>=110 & altis<=120))  # 1313
length(which(altis>=100 & altis<=120)) # 3422   ---->

length(which(altis>=110 & altis<=115))  #756
length(which(altis>=115 & altis<=120))  #728


length(which(altis>=400 & altis<=500)) #533
length(which(altis>=500 & altis<=600)) #153
length(which(altis>=200 & altis<=300)) #2759 ------>
length(which(altis>=300 & altis<=400))  #1342

length(which(altis>100 & altis<200)) #9001

shekarya<-black_pearl[which(altis>=100 & altis<=110)]  #taking requied

#writing only requied files
for(atireki in shekarya){
metadata<-substr(atireki,1,8) #file name
file.copy(paste("K:\\Project_Data_Sagar\\my_truth\\recruit_truth\\",atireki,sep=""), paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",metadata,".txt",sep="") )
}














