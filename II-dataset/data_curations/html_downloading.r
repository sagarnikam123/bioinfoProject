#downloading from www,given domain names


marathi<-htmlTreeParse("http://scop.berkeley.edu/astral/pdbstyle/?id=d1fjgc2&output=html")  #download html page from www

kasam<-xmlValue(marathi$children$html)  #takes only pdb file

domain_name<-str_extract_all(kasam,"SCOP-sccs: [a-z].[.0-9]*")[[1]]

scop_id<-str_extract_all(kasam,"SCOP-sid: [a-z][a-z0-9]*")[[1]]  #scop id with domain
ori_scop_id<-substr(scop_id,12,nchar(scop_id))