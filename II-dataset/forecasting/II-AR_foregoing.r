#forecast only AR models  only
rm(list=ls())

#function returns only 1 value
pre<-function(post,p){
#post-starting value ,p-pvalue
#for all p coeffienct calculation
sham_sunder<-NULL #for adding p coeff
for( rum in seq_along(p)) {
sham_sunder<-sum(sham_sunder,p[rum]*t[post-rum] )  #left term of equation
}
z=sham_sunder+t[post]
return(z)
}  #function

v<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\pot_tamasha\\chocolate_potential_x.txt",skip=1)
w<-v[1:20,2:4] #taking only 3 columns & 20 rows (excludes X's row & AA column)





ohm<-NULL #for appending p-zero order file names
dhino_dhino<-NULL #for appending file_name & r_square
woh_hai<-list.files("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\")  #all stationary files


for ( bari_bari in woh_hai){
vaishakhi<-substr(bari_bari,1,nchar(bari_bari)-4) #contains file name
pyar<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",bari_bari,sep=""),skip=1 )  #opening potential file

shukrana<-as.character(pyar$V2)  #original AA seq
fikrana<-pyar$V3  #original AA States
muskurana<-pyar$V4  #original potential values


t<-pyar$V4 #assigning ori pot to another variable(4 convenience)
ishare<-ar(t)  #calculates AR model
hari_haran<- ishare$ar  #No of ar coefficient

#if AR p-order is zero checking
if(!length(hari_haran)==0){

#forecasting
sajna<-NULL #for appending forecasted value
shraddha<-length(hari_haran) #stoes length of p
for( phulwa in (shraddha+1):length(t)){
sajna<-append(sajna,pre(phulwa,hari_haran))   #1---> starting vlaue ,2---> p-value
}
sajna<-append(t[seq_along(hari_haran)],sajna,) #appending remaining element(has final predicted values)

x<-t   #original value
y<-sajna    #predicted value
f<-lm(y~x)
gen_r_square<-summary(f)$r.squared

#wikipedia method of R-square
r_wiki_square<-1- ( sum((x-y)^2)/ sum((x-mean(x))^2)  )

#for AA & state predictions
motivated<-NULL # for appending AA seq
robotic_vkj<-NULL #for appending states of AA

for( papa in sajna ){
muskurahat=papa     #taking predicted potential value for comparing with matrix
z<-abs(w-muskurahat)==min(abs(w-muskurahat))   #comparing with matrix
great_thumb<-as.character(v[c(which(z[,1]),which(z[,2]),which(z[,3])),]$V1)    #taking single AA character
motivated<-append(motivated,great_thumb)  #appending to predicted AA seq
jannatein<-which(c(length(which(z[,1])),length(which(z[,2])),length(which(z[,3])) )==1)   #gives state of AA
robotic_vkj<-append(robotic_vkj,jannatein)    #appending predicted AA states
}

#Assembling data & writing
sab_kuch<-append(rep(NA,length(t)-1),r_wiki_square,after=0)   #last column r_square with NA
behind<-cbind(t,sajna,sab_kuch,shukrana,motivated,fikrana,robotic_vkj,deparse.level=0)  #written matter for each file (ori_pot,pred_pot,r_sq,ori_AA,pred_AA,ori_states,pred_states)

write.table(behind,paste("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\forecasting\\AR\\forecast_AR_stationary\\",vaishakhi,".txt",sep=""),col.names=c("ori_pot","pred_pot","R_Square","ori_AA","pred_AA","ori_states","pred_states"),row.names=F)
dhino_dhino<-rbind(dhino_dhino,cbind(vaishakhi,gen_r_square,r_wiki_square,deparse.level=0),deparse.level=0) #file_name,General_R_sq,R_wiki_Sq
}  #p order checking

else{  ohm<-append(ohm,vaishakhi)}


} #whole file iterating


#writing p-zero order files
if(!is.null(ohm)){write.table(ohm,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\forecasting\\AR\\AR_stat_p_zero_models.txt",col.names="P-value zero files",row.names=F)}

#writing info file
write.table(dhino_dhino,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\forecasting\\AR\\AR_forecast_stat_R_sq_info.txt",col.names=c("PDB_id","Gen_R_square","Wiki_R_square"),row.names=F)
