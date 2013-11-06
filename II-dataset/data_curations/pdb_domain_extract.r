#my-truth---writes pdb_domain name.pdb
rm(list=ls())

today<-file("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\my_truth\\dressed_data\\my_truth_file_not_found.txt","w")  #writes not found files

delhi<-list.files("K:\\Project_Data_Sagar\\my_truth\\scop_truth\\")  #where all pdb files are
nikamma<-read.table("K:\\Project_Data_Sagar\\Halwa\\BADMASHI\\SCOP\\scop_clf_june_2009.txt")
what_i_have<-substr(nikamma$V1,2,7) #all scop clf ids without  d

#for-->1 for whole file reading
for(daman in delhi ){

pdb_id<-substr(daman,1,(nchar(daman)-4))  #pdb id of available file
diwana<-pmatch(pdb_id,what_i_have)   #line no of matched ids

if(is.na(diwana)){ write(paste("File Not Found-->",pdb_id),today)  }    #checking if file not found
else{
domain_ladki<-substr(as.character(nikamma[diwana,]$V4),1,1) #taking first domain id(i.e. a/b/c/d)
file.copy(paste("K:\\Project_Data_Sagar\\my_truth\\scop_truth\\",daman,sep=""),paste("K:\\Project_Data_Sagar\\my_truth\\scop_pdb_domain\\",pdb_id,"_",domain_ladki,".pdb",sep="")   )
print("------>")
              } #else file not found

   }  #last for 4 file ending



#closing ununsed connections
close(today)