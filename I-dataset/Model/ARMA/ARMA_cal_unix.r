#UNIX-------->   calculates autofit(p,q)order/arma model,divides list into stationary & non-stationary

rm(list=ls())
library(itsmr)  #adding itsmr package

#source("C:\\Users\\msc2\\Desktop\\Halwa\\coke pene de\\new_dot_star\\itall.R.txt")  #adding sarima function source code

faana<-"/data/vikas/bin/yeda/"  #file path for r values
madhur<-list.files(faana)

naringi_firangi<-NULL #complete row information for Stationary model
bunty_bubly<-NULL  #for taking all Non-Stationary info

for (sangeet in madhur){

 html_page<-substr(sangeet,1,nchar(sangeet)-4) #name of file
 compendium<- read.table(paste(faana,sangeet,sep=""))
   print(paste("Reading-------------------------------->",html_page))


 #autofit(arma)model  & checking for non stationarity
 j<-NULL
 j<-tryCatch(red_money<-autofit(compendium$V1),error=function(e)e )   #autofit(arma)model (max likelihood method)

 if(inherits(j,"simpleError")){ bunty_bubly<-append(bunty_bubly,html_page);print(paste("Non-Stationary-------------------------->",html_page))}
 else{

 autofit_ar_p<-length(red_money$phi)  #autoregressive p value
 autofit_ma_q<-length(red_money$theta)  #moving average q value
 autofit_aicc<-red_money$aicc   #aicc


 #joining single line
 bumro<-cbind(html_page,autofit_ar_p,autofit_ma_q,autofit_aicc,deparse.level=0)
 naringi_firangi<-rbind(naringi_firangi,bumro)
            } #non-stationary else

}  #last for

#only stationary model
write.table(naringi_firangi,"/data/vikas/bin/Halwa/BADMASHI/Model/ARMA/Autofit_arma_stationary.txt",col.names=c("PDB_file","AutoF_ar_p","AutoF_ma_q","AutoF_aicc"),row.names=F)


#Non-Stationary model
write.table(bunty_bubly,"/data/vikas/bin/Halwa/BADMASHI/Model/ARMA/Autofit_dhak_dhak_non_stat.txt",col.names="Non-Stationary models",row.names=F)



