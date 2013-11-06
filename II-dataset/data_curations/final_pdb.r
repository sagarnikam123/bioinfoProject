#read pdb, finds no of chains,takes 100-120 lengths,checks for chain breaks & writes final pdb file

rm(list=ls())
library(bio3d)

#alpha by beta
#maya_puran<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\my_truth\\mand_ragada_petis\\alpha_by_beta_ungood_chain.txt","w+" ) #opening file for writing of failed pdb ids who not given any good chain
#noori_sheru<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\my_truth\\mand_ragada_petis\\alpha_by_beta_written_chain.txt","w+") #opening file for writing of good chain pdb
#charkha<-list.files("C:\\kindle_patrika\\my_truth\\haule_haule\\alpha-beta\\") #taking files
 
#for alpha+beta 
# maya_puran<-file("C:\\kindle_patrika\\my_truth\\recruit_truth\\nadan_parinde\\alpha_plus_beta_ungood_chain.txt","w+" ) #opening file for writing of failed pdb ids who not given any good chain
#noori_sheru<-file("C:\\kindle_patrika\\my_truth\\recruit_truth\\nadan_parinde\\alpha_plus_beta_written_chain.txt","w+") #opening file for writing of good chain pdb
#charkha<-list.files("C:\\kindle_patrika\\my_truth\\haule_haule\\alpha+beta\\") #taking files

#for all alpha
maya_puran<-file("C:\\kindle_patrika\\my_truth\\recruit_truth\\nadan_parinde\\all_alpha_ungood_chain.txt","w+" ) #opening file for writing of failed pdb ids who not given any good chain
noori_sheru<-file("C:\\kindle_patrika\\my_truth\\recruit_truth\\nadan_parinde\\all_alpha_written_chain.txt","w+") #opening file for writing of good chain pdb
charkha<-list.files("C:\\kindle_patrika\\my_truth\\haule_haule\\all_alpha\\") #taking files

#for all beta 
# maya_puran<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\my_truth\\mand_ragada_petis\\all_beta_ungood_chain.txt","w+" ) #opening file for writing of failed pdb ids who not given any good chain
#noori_sheru<-file("C:\\Users\\msc2\\Desktop\\Halwa\\BADMASHI\\my_truth\\mand_ragada_petis\\all_beta_written_chain.txt","w+") #opening file for writing of good chain pdb
#charkha<-list.files("C:\\kindle_patrika\\my_truth\\haule_haule\\all_beta\\") #taking files


for (bewasi in charkha){
hse<-NULL #takes chain ids who are not broken
pdb_name<-substr(bewasi,1,(nchar(bewasi)-4) )
#pdb<-read.pdb(paste("C:\\kindle_patrika\\my_truth\\haule_haule\\alpha-beta\\",bewasi,sep=""),maxlines=999999,verbose=FALSE)    #reading file
#pdb<-read.pdb(paste("C:\\kindle_patrika\\my_truth\\haule_haule\\alpha+beta\\",bewasi,sep=""),maxlines=999999,verbose=FALSE)    #reading file
pdb<-read.pdb(paste("C:\\kindle_patrika\\my_truth\\haule_haule\\all_alpha\\",bewasi,sep=""),maxlines=999999,verbose=FALSE)    #reading file
#pdb<-read.pdb(paste("C:\\kindle_patrika\\my_truth\\haule_haule\\all_beta\\",bewasi,sep=""),maxlines=999999,verbose=FALSE)    #reading file
karam_sarkar<-unique(pdb$atom[,5])        #takes no of chains with Alphabets


for(j in seq_along(karam_sarkar)){
vaishwakant<-atom.select(pdb,chain=karam_sarkar[j],verbose=FALSE) #takes integers of atoms
chalis_chor<-trim.pdb(pdb,vaishwakant)  #takes requied trimmed pdb for single chain
#print(paste("--->",karam_sarkar[j])) #printing which chain is iterating

#checking chain breaks
spartacus<-NULL #for taking first index of breaked(started)
show<-as.numeric(unique(chalis_chor$atom[,6]))  #taking unique resno only
awesome<-length(show) #no of residues for each chain
#shendi<-unique(chalis_chor$atom[,2])  #unique atom types N CA C O

#checking for no of residue =N=CA=C=O
bcud<-chalis_chor$atom[,2]      #atom types N CA C O
n_len<-length(which(bcud=="N"))
ca_len<-length(which(bcud=="CA"))
c_len<-length(which(bcud=="C"))                    
o_len<-length(which(bcud=="O"))

if(awesome!=1){
for(bond in 1:(length(show)-1)){
if(show[bond+1]-show[bond]!=1){
#print(show[bond+1])  #prints first atom starts after breaks
spartacus<-append(spartacus,bond+1) }  
}

# if break is not (small)
if(length(spartacus)==0 && awesome>=100 && awesome<=120 && n_len==awesome && ca_len==awesome && c_len==awesome && o_len==awesome ){  hse<-append(hse,karam_sarkar[j])    }
          } #if---awesome
          }  #for each chain iterating
          
#------------------------------------------------------------------------------------------------------------------------------------------------
#generating final single pdb_chain files
if(length(hse)!=0){
dosti<-atom.select(pdb,chain=hse[1],verbose=FALSE)    #index
zindgi<-trim.pdb(pdb,dosti) #whole required pdb
write.pdb(zindgi,xyz=zindgi$xyz,file=paste("C:\\kindle_patrika\\my_truth\\recruit_truth\\all_alpha_recruit\\",pdb_name,"_",hse[1],".pdb",sep="") ) #wriing ultimate file

 write(paste("all  alpha -->  ",pdb_name,"_",hse[1],sep=""),noori_sheru )  #writing to generated pdb ids
#write(paste("all   beta -->  ",pdb_name,"_",hse[1],sep=""),noori_sheru )  #writing to generated pdb ids
#write(paste("alpha+beta -->  ",pdb_name,"_",hse[1],sep=""),noori_sheru )  #writing to generated pdb ids
#write(paste("alpha/beta -->  ",pdb_name,"_",hse[1],sep=""),noori_sheru )  #writing to generated pdb ids
}
else{(write(paste(pdb_name,"-----> No-chain good----> ",paste(karam_sarkar,collapse=" "),sep=""),maya_puran))   } #else generating final single pdb_chain files
print(paste("-------------------> ",pdb_name))

} #last for 4 each file iterating

#-------------------------------------------------------------------------------------------------------------------------------------------------


#last closing of ungood chain's file & good pdb writtens
close(maya_puran)
close(noori_sheru)