f.files.cross = function(x){
  read.csv(paste(path2results, X[x], sep=""))
}

X = nms.cross.city.recreo
C0 = lapply(1:length(X), f.files.cross)
C.recreo = do.call(rbind, C0)

C.recreo[,2][is.na(C.recreo[,2])]<-0
C.recreo[,3][is.na(C.recreo[,3])]<-0
C.recreo[,4][is.na(C.recreo[,4])]<-0
C.recreo[,5][is.na(C.recreo[,5])]<-0
C.recreo[,6][is.na(C.recreo[,6])]<-0
C.recreo[,7][is.na(C.recreo[,7])]<-0
C.recreo[,8][is.na(C.recreo[,8])]<-0

X = nms.cross.city.work
C0 = lapply(1:length(X), f.files.cross)
C.work = do.call(rbind, C0)

C.work[,2][is.na(C.work[,2])]<-0
C.work[,3][is.na(C.work[,3])]<-0
C.work[,4][is.na(C.work[,4])]<-0
C.work[,5][is.na(C.work[,5])]<-0
C.work[,6][is.na(C.work[,6])]<-0
C.work[,7][is.na(C.work[,7])]<-0
C.work[,8][is.na(C.work[,8])]<-0

index.work=sort(as.Date(C.work$origin))
C.work = C.work[match(index.work, as.Date(C.work$origin)),]

index.recreo=sort(as.Date(C.recreo$origin))
C.recreo = C.recreo[match(index.work, as.Date(C.recreo$origin)),]

y.recreo = C.recreo$si_C_1/(C.recreo$si_C_1+C.recreo$si_noC_1)
y.work = C.work$si_C_1/(C.work$si_C_1+C.work$si_noC_1)

x.work = C.work$origin
x.recreo = C.recreo$origin
