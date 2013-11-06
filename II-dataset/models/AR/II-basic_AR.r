#my-truth calculates AR model-,p_value,My_aic,STD_AIC

rm(list=ls())
library(tseries)  #for arma process

alli<-NULL
zafari<-list.files("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\")  #have potentials files

for(roll in zafari){
jai<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\sangram_clipso\\",roll,sep=""),skip=1)  #reading with avoiding first name
file_id<-substr(roll,1,(nchar(roll)-4) )  #file name

galiya<-jai$V4   #have whole time series
ts<-ts(galiya)

ishare<-ar(ts)   #Autoressive model
ts_p<-ishare$order    #order P value

#for AIC value
lm<-lm(ts ~ 1)     #fitting linear model
loglik<-logLik(lm)     #Extract Log-Likelihood
my_aic<-AIC(loglik)

arita<-arma(ts,order=c(ts_p,0))    #for calculating STD AIC value
y<-summary(arita)
std_aic<-y$aic

tun_tuna<-cbind(file_id,ts_p,my_aic,std_aic,deparse.level=0)   #making single row for each file
alli<-rbind(alli,tun_tuna)
}   #file iterating for

write.table(alli,"K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\Model\\AR\\my_truth_AR_aic.txt",col.names=c("PDB_ID","P_value","MY_AIC","STD_AIC"),row.names=F)

