 #Not done yet--forecast only ARIMA models only
 rm(list=ls())



#function returns only 1 value
pre<-function(post,p,q){
#post-starting value ,p-pvalue

#for all p coeffienct calculation
sham_sunder<-NULL #for adding p coeff
for( rum in seq_along(p)) {
sham_sunder<-sum(sham_sunder,p[rum]*t[post-rum] )  #left term of equation
}   #for 4 p

#for all q coefficient cal
vasant_vruksha<-NULL
for (sari in seq_along(q)){
vasant_vruksha<-sum(vasant_vruksha,q[sari]*t[post-sari])  #right term of equation
}  #for 4 q

z=sham_sunder+t[post]+vasant_vruksha
return(z)
}  #function finish



#opening potential values matrix
v<-read.table("C:\\Project_Data_Sagar\\Halwa\\BADMASHI\\pot_tamasha\\chocolate_potential_x.txt",skip=1)
w<-v[1:20,2:4] #taking only 3 columns & 20 rows (excludes X's row & AA column)


dhino_dhino<-NULL #for appending file_name & r_square
woh_hai<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary_rectified_linux.txt",skip=1)  #all stationary files
kaun_hai<-as.character(woh_hai[,1])  #file names 


for ( bari_bari in seq_along(kaun_hai)){

tripyl<-as.character(woh_hai[bari_bari,]$V1)
pyar<-read.table(paste("C:\\kindle_patrika\\PDB\\pdb_MoserFear\\",tripyl,"_phi_psi_pot.pdb",sep=""),skip=1 )  #opening potential file

shukrana<-as.character(pyar$V2)  #original AA seq
fikrana<-pyar$V3  #original AA States
muskurana<-pyar$V4  #original potential values

t<-muskurana
hari_haran<-as.numeric(strsplit(toString(woh_hai[bari_bari,]$V3[1])," ")[[1]])  #p-values      #pal<-jk[[1]][1]
kari_karan<-as.numeric(strsplit(toString(woh_hai[bari_bari,]$V5[1])," ")[[1]])  #q-values     #


#forecasting
sajna<-NULL #for appending forecasted value
sallu<-c(length(hari_haran),length(kari_karan))
shraddha<-which.max(sallu) #stoes length of p
if(shraddha==1){shraddha<-length(hari_haran) }else{shraddha<-length(kari_karan)}  #checking which p/q max

for( phulwa in (shraddha+1):length(t)){
sajna<-append(sajna,pre(phulwa,hari_haran,kari_karan))   #1---> starting vlaue ,2---> p-value
}
sajna<-append(t[1:shraddha],sajna,) #appending remaining element

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
sab_kuch<-append(rep(NA,length(t)-1),r_wiki_square,after=0)   #last column
behind<-cbind(t,sajna,sab_kuch,shukrana,motivated,fikrana,robotic_vkj,deparse.level=0)  #written matter for each file (ori_pot,pred_pot,r_sq,ori_AA,pred_AA,ori_states,pred_states)

write.table(behind,paste("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\forecast_ARMA_stationary\\",tripyl,".txt",sep=""),col.names=c("ori_pot","pred_pot","R_Square","ori_AA","pred_AA","ori_states","pred_states"),row.names=F)
dhino_dhino<-rbind(dhino_dhino,cbind(tripyl,gen_r_square,r_wiki_square,deparse.level=0),deparse.level=0) #file_name,General_R_sq,R_wiki_Sq


} #whole file iterating



#writing info file
write.table(dhino_dhino,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\ARMA_forecast_stat_R_sq_info.txt",col.names=c("PDB_id","Gen_R_square","Wiki_R_square"),row.names=F)
