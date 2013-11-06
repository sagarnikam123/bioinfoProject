#MY-truth writes potential values in phi_psi files


rm(list=ls())
brownie_fridge<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\pot_tamasha\\chocolate_potential.txt")

jadu_ya_nasha<-list()  #making connected list like hash

#making of hash
for( amul in seq_along(brownie_fridge$V2)  ){
camera_cinema<-  as.character(brownie_fridge[amul,1])  #key
navrang<-as.vector(c(brownie_fridge[amul,2],brownie_fridge[amul,3],brownie_fridge[amul,4])) #value
jadu_ya_nasha[[camera_cinema]]<-navrang
                           }    #for ends  (for hash)



hyphen<-list.files("K:\\Project_Data_Sagar\\my_truth\\chikni_phi_psi_truth\\")  #list of phi_psi files names

#for iterating files
for( jodi in hyphen) {
#1a0oa__c_128_phi_psi
pdb_id<-substr(jodi,1,(nchar(jodi)-12) )

munnabhai<-read.table(paste("K:\\Project_Data_Sagar\\my_truth\\chikni_phi_psi_truth\\",jodi,sep=""),skip=1)
q_300<-NULL  #for appending total edited file

for(i in seq_along(munnabhai$V1) ){

kahar<-as.character(munnabhai[i,4]) #single aa letter
zoobi_dubi<-as.numeric(munnabhai[i,7]) #state


krishna_mudra<-jadu_ya_nasha[[kahar]][zoobi_dubi]  #gives potential value
lecture<-cbind(as.numeric(munnabhai[i,3]),as.character(munnabhai[i,4]),as.numeric(munnabhai[i,7]),krishna_mudra,deparse.level=0)#making one row for writing
q_300<-rbind(q_300,lecture,deparse.level=0)
   
}  #for for all lines in single file

rewrite<-paste("K:\\Project_Data_Sagar\\my_truth\\recruit_truth\\",pdb_id,"_pot",".txt",sep="")
print("-->")
print("---------->")
#writing
write.table(q_300,rewrite,col.names=c("AA_Position","AA_single","State","Potential"),row.names=F)


   }               #for ends for file iterating









