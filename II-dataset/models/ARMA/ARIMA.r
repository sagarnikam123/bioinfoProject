#My-truth---calculates autofit(p,q)order all value in string/arma models to divide into stationary & non-stat models

rm(list=ls())
library(itsmr)  #adding itsmr package

#pandit <-list.files("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\")  #before
pandit<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\ARMA\\my_truth_autofit_arma_stationary.txt",skip=1)
pandit<-as.character(pandit$V1)   #taking only stationary pdf ids

naringi_firangi<-NULL #complete row information for Stationary model
bunty_bubly<-NULL  #for taking zero p & q
kuvari_dulhan<-NULL #takes non-stat ids

for (sangeet in pandit){

straussberg<-substr(sangeet,1,nchar(sangeet)-4) #file name
compendium<- read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",sangeet,sep=""),skip=1)
print(paste("Reading-------------------------------->",sangeet))

#autofit(arma)model  & checking for non stationarity
 j<-NULL
 red_money<-NULL
 j<-tryCatch(red_money<-autofit(ts(compendium$V4)),error=function(e)e )   #autofit(arma)model (max likelihood method)

 if(inherits(j,"simpleError")){ kuvari_dulhan<-append(kuvari_dulhan,straussberg);print(paste("Non-Stationary-------------------------->",straussberg))}else{


#checking p & q (both)zero
if(red_money$phi[1]==0 && red_money$theta[1]==0 ){
  bunty_bubly<-append(bunty_bubly,straussberg)  #p,q not zero else
   } else{

if(length(red_money$phi)>1){p_tunar<-paste(red_money$phi,collapse=" ");autofit_ar_p<-length(red_money$phi) }  else if(red_money$phi==0){p_tunar<-0;autofit_ar_p<-0} else{p_tunar<-red_money$phi;autofit_ar_p<-length(red_money$phi)}       #autoregressive p value & order  #to decode jk<-strsplit(tunar," ")  & pal<-jk[[1]][1]
if(length(red_money$theta)>1){q_funar<-paste(red_money$theta,collapse=" ");autofit_ma_q<-length(red_money$theta)}  else if(red_money$theta==0){q_funar<-0;autofit_ma_q<-0} else{q_funar<-red_money$theta;autofit_ma_q<-length(red_money$theta)}   #moving average q value & order


 
autofit_aicc<-red_money$aicc   #aicc
autofit_sigma2<-red_money$sigma2  # sigma2

 #joining single line
 bumro<-cbind(sangeet,autofit_ar_p,p_tunar,autofit_ma_q,q_funar,autofit_sigma2,autofit_aicc,deparse.level=0)
 naringi_firangi<-rbind(naringi_firangi,bumro)
            } #else,checking p,q -->zero
      
}# else non-stat
      
}  #last for  4 file iterating

#writnig only stationary model
write.table(naringi_firangi,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\ARMA\\my_truth_autofit_arma_stationary_after_kamal.txt",col.names=c("PDB_file","Autof_p_order","Autof_ar_p_value","Autof_q_order","AutoF_ma_q_value","Autof_sigma2","AutoF_aicc"),row.names=F)

#zero p & q models
write.table(bunty_bubly,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\ARMA\\my_truth_autofit_arma_stat_p_q_zero_after_kamal.txt",col.names="zero p & q models",row.names=F)

#Non-statioary models list
if(is.null(kuvari_dulhan)){write.table("Your data has NO-non-stationary items","K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\ARMA\\my_truth_autofit_arma_non_stat_after_kamal.txt",col.names=F,row.names=F)}else{
write.table(kuvari_dulhan,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\ARMA\\my_truth_autofit_arma_non_stat_after_kamal.txt",col.names="MY-truth_Non-stat_ARMA",row.names=F)  }

