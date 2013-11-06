#calculates autofit(p,q)order all value in string/arma model for stationary models----> for LINUX

rm(list=ls())
library(itsmr)  #adding itsmr package

pandit <-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary.txt",skip=1)
madhur<-as.character(pandit$V1)     #have all ids stat

naringi_firangi<-NULL #complete row information for Stationary model
bunty_bubly<-NULL  #for taking zero p & q



for (sangeet in madhur){
compendium<- read.table(paste("C:\\kindle_patrika\\PDB\\pdb_clf_potentials\\pdb_clf_stationary_pot\\",sangeet,".txt",sep=""))
print(paste("Reading-------------------------------->",sangeet))

#autofit(arma)model  & checking for non stationarity
red_money<-autofit(ts(compendium$V1))  #autofit(arma)model (max likelihood method)


#checking p & q (both)zero
if(red_money$phi[1]==0 && red_money$theta[1]==0 ){
  bunty_bubly<-append(bunty_bubly,sangeet)  #p,q not zero else
   }
else{   
   
p_tunar<-paste(red_money$phi,collapse=" ")        #to decode jk<-strsplit(tunar," ")  & pal<-jk[[1]][1]
q_funar<-paste(red_money$theta,collapse=" ")

autofit_ar_p<-length(red_money$phi)  #autoregressive p value
autofit_ma_q<-length(red_money$theta)  #moving average q value
autofit_aicc<-red_money$aicc   #aicc
autofit_sigma2<-red_money$sigma2  # sigma2
 
 #joining single line
 bumro<-cbind(sangeet,autofit_ar_p,p_tunar,autofit_ma_q,q_funar,autofit_sigma2,autofit_aicc,deparse.level=0)
 naringi_firangi<-rbind(naringi_firangi,bumro)
    
} #else



}  #last for  4 file iterating

#writnig only stationary model
write.table(naringi_firangi,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary_rectified_linux.txt",col.names=c("PDB_file","Autof_p_order","Autof_ar_p_value","Autof_q_order","AutoF_ma_q_value","Autof_sigma2","AutoF_aicc"),row.names=F)

#zero p & q models
write.table(bunty_bubly,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stat_p_q_zero.txt",col.names="zero p & q models",row.names=F)



