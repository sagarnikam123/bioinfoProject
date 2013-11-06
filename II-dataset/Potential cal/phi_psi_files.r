#writes category_phi_psi pdb files
rm(list=ls())

library(bio3d)


kyun<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\dressed_data\\my_truth_good_written.txt","w")  #writes good chain
hum_dono<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\dressed_data\\my_truth_ungood.txt","w")   #writes ungood chiain


duba<-list.files("K:\\Project_Data_Sagar\\my_truth\\scop_pdb_domain\\")


#for-->1 for whole file reading
for(daman in duba ){

pdb_id<-substr(daman,1,(nchar(daman)-4))  #takes PDB name

khilti_kali<-capture.output(pdb<-read.pdb(paste("K:\\Project_Data_Sagar\\my_truth\\scop_pdb_domain\\",daman,sep=""),maxlines=1000000,verbose=FALSE) )  #reading fiel & capturing header line

show<-as.numeric(unique(pdb$atom[,6]))  #taking unique resno only
awesome<-length(show) #no of residues for each chain

#checking for no of residue =N=CA=C=O
bcud<-pdb$atom[,2]      #atom types N CA C O
n_len<-length(which(bcud=="N"))
ca_len<-length(which(bcud=="CA"))
c_len<-length(which(bcud=="C"))
o_len<-length(which(bcud=="O"))

#checking chain breaks
spartacus<-NULL #for taking first index of breaked(started)
for(bond in 1:(length(show)-1)){
if(show[bond+1]-show[bond]!=1){
#print(show[bond+1])  #prints first atom starts after breaks
spartacus<-append(spartacus,bond+1) }
}

# breaks  if (small)
# awesome>=100 && awesome<=120
if(length(spartacus)==0 && n_len==awesome && ca_len==awesome && c_len==awesome && o_len==awesome){

seq<-seq.pdb(pdb)  #converts to one letter code seq

#torsion angle
ttr<-torsion.pdb(pdb)
phi<-ttr$phi
psi<-ttr$psi

  #writing original pdb' result----> 2
  aa_no<-attributes(seq)
  sr_no<-(1:length(seq))
  aa_no=aa_no$names
  aa=seq
  # checkes for NA
  phi[which(is.na(phi))]=0

  psi[which(is.na(psi))]=0

  banarasi_pan<-NULL
  #main condition ---> 2
  for (z in 1:length(phi)){

  if(  ( (phi[z]<=0)&(phi[z]>= -140) ) & ( (psi[z]<=0)&(psi[z]>= -100)  ) ){banarasi_pan<-append(banarasi_pan,1)}
  else if( ( (phi[z]<=0)&(phi[z]>= -180) ) & ( (psi[z]<=180)&(psi[z]>=80) ) ){banarasi_pan<-append(banarasi_pan,2)}
  else {banarasi_pan<-append(banarasi_pan,3)}   }  #phi psi checking finish

 pdb_id_4<-rep(pdb_id,,length(phi))
 last<-cbind(sr_no,pdb_id_4,aa_no,aa,phi,psi,banarasi_pan)
 
 #checking length of seq
 if(length(seq)<=99){jarurat<-paste("0",length(seq),sep="")}else{jarurat<-paste(length(seq))}

  write.table(last,file=paste("K:\\Project_Data_Sagar\\my_truth\\chikni_phi_psi_truth\\",pdb_id,"_",jarurat,"_phi_psi.pdb",sep=""),col.names=TRUE,row.names=FALSE)     #writing _phi_psi pdb files
  write(paste(pdb_id," -Written- ",jarurat),kyun )  #writing  good chain

}else{
   write(paste(pdb_id,"Not---Written","seq_length:-",length(seq)),hum_dono)                     #writing ungood chain

              } #is for CA checking --->1
              


   }  #last for 4 file ending
   
   
   
#closing ununsed connections
close(kyun)
close(hum_dono)