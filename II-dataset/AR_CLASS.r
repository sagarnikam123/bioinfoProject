#finds class for best AR models


#opens scop clf file
why_this<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\SCOP\\scop_clf_june_2009.txt")
humsafar<-substr(as.character(why_this$V1),2,5) #only pdb ids of scop

#opens best AR forecasted file
char_disha<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\best_AR_forecast_stat.txt",header=T)
dillagi<-tolower(substr(as.character(char_disha$File_Name),1,4))

italics<-NULL #for appending total info
for( khadaksingh in seq_along(dillagi) ){

svm<-pmatch(dillagi[khadaksingh],humsafar)  #correct position of matched id
population<-substr(as.character(why_this[svm,]$V4),1,1)   #only class characters(last two)

satyameva_jayate<-cbind(as.character(char_disha[khadaksingh,1]),char_disha[khadaksingh,2],char_disha[khadaksingh,3],char_disha[khadaksingh,4],population,deparse.level=0)
italics<-rbind(italics,satyameva_jayate)
print(population)
#if(is.na(population))print(paste(dillagi[khadaksingh],population))
}

write.table(italics,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\best_AR_forecast_stat_class_info.txt",col.names=c("File_Name","R_sq","Seq_accuracy","States_accuracy","Prot_Class" ),row.names=F)

#analyzing AR data
length(which(is.na(italics[,5])))  #no of NA(class not found)
table(italics[,5])
# a  b  c  d  g  h
#12  5  9 13  1  3  1

#all alpha
all_alpha_ar<-italics[which(italics[,5]=="a"),]  #all alpha AR
as.numeric(all_alpha_ar[,3])[which.min(as.numeric(all_alpha_ar[,3]))]  #------2.419355 minimum AA seq accuracy
as.numeric(all_alpha_ar[,3])[which.max(as.numeric(all_alpha_ar[,3]))] #-----26.82927 #max AA Seq

as.numeric(all_alpha_ar[,4])[which.min(as.numeric(all_alpha_ar[,4]))]  #------21.77419 minimum states accuracy
as.numeric(all_alpha_ar[,4])[which.max(as.numeric(all_alpha_ar[,4]))] #-----55.68182 #max states

#all beta
all_beta_ar<-italics[which(italics[,5]=="b"),]  #all beta AR
as.numeric(all_beta_ar[,3])[which.min(as.numeric(all_beta_ar[,3]))]  #------ 8.888889 minimum AA seq
as.numeric(all_beta_ar[,3])[which.max(as.numeric(all_beta_ar[,3]))]  #------16.3017 max AA seq

as.numeric(all_beta_ar[,4])[which.min(as.numeric(all_beta_ar[,4]))]  #------ 44.7619 minimum states accuracy
as.numeric(all_beta_ar[,4])[which.max(as.numeric(all_beta_ar[,4]))]  #------51.11111  max staes accuracy

#alpha/beta --c
alpha_by_beta_ar<-italics[which(italics[,5]=="c"),]  #alpha/beta AR
as.numeric(alpha_by_beta_ar[,3])[which.min(as.numeric(alpha_by_beta_ar[,3]))]  #------  1.470588 minimum AA seq
as.numeric(alpha_by_beta_ar[,3])[which.max(as.numeric(alpha_by_beta_ar[,3]))]  #----- 27.77778  max AA seq

as.numeric(alpha_by_beta_ar[,4])[which.min(as.numeric(alpha_by_beta_ar[,4]))]  #------ 30.64516  minimum states accuracy
as.numeric(alpha_by_beta_ar[,4])[which.max(as.numeric(alpha_by_beta_ar[,4]))]  #------54.76636   max staes accuracy

#alpha+beta --d
alpha_plus_beta_ar<-italics[which(italics[,5]=="d"),]  #alpha+beta AR
as.numeric(alpha_plus_beta_ar[,3])[which.min(as.numeric(alpha_plus_beta_ar[,3]))]  #------7.042254   minimum AA seq
as.numeric(alpha_plus_beta_ar[,3])[which.max(as.numeric(alpha_plus_beta_ar[,3]))]  #----- 28.57143  max AA seq

as.numeric(alpha_plus_beta_ar[,4])[which.min(as.numeric(alpha_plus_beta_ar[,4]))]  #------ 19.04762  minimum states accuracy
as.numeric(alpha_plus_beta_ar[,4])[which.max(as.numeric(alpha_plus_beta_ar[,4]))]  #------  51.70068  max staes accuracy

#small proteins
small_proteins_ar<-italics[which(italics[,5]=="g"),]   #seq--19.5121951219512      states---48.780487804878

#coiled proteins
coiled_proteins_ar<-italics[which(italics[,5]=="h"),]
#seq AA max-- 22.5
#seq AA min-5.88235294117647
#states max-- 26
#states min-- 15


#designed proteins
designed_proteins_ar<-italics[which(italics[,5]=="k"),]
#"1N0Q_B" "-0.514291233694245" "29.0322580645161"   "26.8817204301075"   "k"



gum_fida<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\AR\\best_AR_forecast_stat_class_info.txt",header=T)


________________________________________________________________________________________________________________________________________________________________________________

#finds class for best ARMA models


#opens scop clf file
why_this<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\SCOP\\scop_clf_june_2009.txt")
humsafar<-substr(as.character(why_this$V1),2,5) #only pdb ids of scop

#open best arma forecasted file
hara_bara_tera<-read.table("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\best_ARMA_forecast_stat.txt",header=T)
dillagi<-tolower(substr(as.character(hara_bara_tera$File_Name),1,4))

saxophone<-NULL #for appending total info
for( khadaksingh in seq_along(dillagi) ){

svm<-pmatch(dillagi[khadaksingh],humsafar)  #correct position of matched id
population<-substr(as.character(why_this[svm,]$V4),1,1)   #only class characters(last two)

satyameva_jayate<-cbind(as.character(hara_bara_tera[khadaksingh,1]),hara_bara_tera[khadaksingh,2],hara_bara_tera[khadaksingh,3],hara_bara_tera[khadaksingh,4],population,deparse.level=0)
saxophone<-rbind(saxophone,satyameva_jayate)
print(population)
#if(is.na(population))print(paste(dillagi[khadaksingh],population))
}

write.table(saxophone,"C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\forecasting\\ARMA\\best_ARMA_forecast_stat_class_info.txt",col.names=c("File_Name","R_sq","Seq_accuracy","States_accuracy","Prot_Class" ),row.names=F)


#table(saxophone[,5])

#  a   b   c   d   e   f   g   h 
#123 146 120 127  13   4  17   7 


#all alpha
all_alpha_ar<-saxophone[which(saxophone[,5]=="a"),]  #all alpha AR
as.numeric(all_alpha_arma[,3])[which.min(as.numeric(all_alpha_arma[,3]))]  #------ minimum AA seq accuracy
as.numeric(all_alpha_arma[,3])[which.max(as.numeric(all_alpha_arma[,3]))] #----- #max AA Seq

as.numeric(all_alpha_arma[,4])[which.min(as.numeric(all_alpha_arma[,4]))]  #------ minimum states accuracy
as.numeric(all_alpha_arma[,4])[which.max(as.numeric(all_alpha_arma[,4]))] #----- #max states

#all beta
all_beta_ar<-saxophone[which(saxophone[,5]=="b"),]  #all beta AR
as.numeric(all_beta_arma[,3])[which.min(as.numeric(all_beta_arma[,3]))]  #------ 8.888889 minimum AA seq
as.numeric(all_beta_arma[,3])[which.max(as.numeric(all_beta_arma[,3]))]  #------16.3017 max AA seq

as.numeric(all_beta_arma[,4])[which.min(as.numeric(all_beta_arma[,4]))]  #------ 44.7619 minimum states accuracy
as.numeric(all_beta_arma[,4])[which.max(as.numeric(all_beta_arma[,4]))]  #------51.11111  max staes accuracy

#alpha/beta --c
alpha_by_beta_ar<-saxophone[which(saxophone[,5]=="c"),]  #alpha/beta AR
as.numeric(alpha_by_beta_arma[,3])[which.min(as.numeric(alpha_by_beta_arma[,3]))]  #------  1.470588 minimum AA seq
as.numeric(alpha_by_beta_arma[,3])[which.max(as.numeric(alpha_by_beta_arma[,3]))]  #----- 27.77778  max AA seq

as.numeric(alpha_by_beta_arma[,4])[which.min(as.numeric(alpha_by_beta_arma[,4]))]  #------ 30.64516  minimum states accuracy
as.numeric(alpha_by_beta_arma[,4])[which.max(as.numeric(alpha_by_beta_arma[,4]))]  #------54.76636   max staes accuracy

#alpha+beta --d
alpha_plus_beta_ar<-saxophone[which(saxophone[,5]=="d"),]  #alpha+beta AR
as.numeric(alpha_plus_beta_arma[,3])[which.min(as.numeric(alpha_plus_beta_arma[,3]))]  #------7.042254   minimum AA seq
as.numeric(alpha_plus_beta_arma[,3])[which.max(as.numeric(alpha_plus_beta_arma[,3]))]  #----- 28.57143  max AA seq

as.numeric(alpha_plus_beta_arma[,4])[which.min(as.numeric(alpha_plus_beta_arma[,4]))]  #------ 19.04762  minimum states accuracy
as.numeric(alpha_plus_beta_arma[,4])[which.max(as.numeric(alpha_plus_beta_arma[,4]))]  #------  51.70068  max staes accuracy