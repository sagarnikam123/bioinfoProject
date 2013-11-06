#calculates autofit(p,q)order/arma model,divides list into stationary & non-stationary

rm(list=ls())
library(itsmr)  #adding itsmr package


faana<-"C:\\kindle_patrika\\jugnu_bholu\\"  #file path for r values     
madhur<-list.files(faana)

naringi_firangi<-NULL #complete row information for Stationary model
bunty_bubly<-NULL  #for taking all Non-Stationary info

for (sangeet in madhur){

 html_page<-substr(sangeet,1,nchar(sangeet)-4) #name of file
 compendium<- read.table(paste(faana,sangeet,sep=""),skip=1)
   print(paste("Reading-------------------------------->",html_page))
 

 #autofit(arma)model  & checking for non stationarity
 j<-NULL
 j<-tryCatch(red_money<-autofit(ts(compendium$V1)),error=function(e)e )   #autofit(arma)model (max likelihood method)
 
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
if(is.null(naringi_firangi)){write("Your data has no Autofit ARMA stationary models","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary.txt") }else{
write.table(naringi_firangi,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_arma_stationary.txt",col.names=c("PDB_file","AutoF_ar_p","AutoF_ma_q","AutoF_aicc"),row.names=F)
     } #else stationary

#Non-Stationary model
if(is.null(bunty_bubly)){ write("Your data has NO Autofit ARMA NON-stationary models","C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_dhak_dhak_non_stat.txt") }else{
write.table(bunty_bubly,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\Model\\ARMA\\Autofit_dhak_dhak_non_stat.txt",col.names="Non-Stationary models",row.names=F)
                      } #else non-stationary 


