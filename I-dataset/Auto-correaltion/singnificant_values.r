#finds singificant values of autocorrealtion
rm(list=ls())

x<-read.table("C:\\Users\\msc2\\Desktop\\zara_t_val.txt")     #reading t-value file
pract<-list()       #declaring hash

#making hash for t-value
for( rahman in seq_along(x$V1)){
pract[rahman]=x[rahman,1]
}


kate<-read.table("C:\\Users\\msc2\\Desktop\\rajaRampool\\1A8V_B_2_phi_psi_pot_r_k.pdb",skip=1)
#kate<-read.table(file.choose(),skip=1)
badme<-kate[,2]
d_f<-length(badme)-2     #degree of freedom

for( medicine in seq_along(badme) ){
if(d_f<=75){
if(badme[medicine]>= pract[d_f] && badme[medicine]<= pract[d_f]  )print(paste(badme[medicine],medicine ) ) }
else{  if(badme[medicine]>= 1.645 )print(paste(badme[medicine],medicine ) ) }  }

   #for ends