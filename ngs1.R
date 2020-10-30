rm(list=ls())

library(readxl)
MyData1 =read_excel(file.choose())
Mydf1=as.data.frame(MyData1 )
Mydf1
length(Mydf1$Merge)
head(Mydf1)

Action1=unique(Mydf1$Merge)
Action2=c()
j=1
for (i in 1:length(Action1)){
if (length(table(Mydf1$CRA[Mydf1$Merge==Action1[i]]))>2 )
{
Action2[j]=Action1[i]
i=i+1
j=j+1
}
}
Action2


================================


df_one=data.frame(Action2)
names(df_one)[1] <- "Merge"
attach(df_one)

FinalData=merge(x = df_one , y = Mydf1, by = "Merge", all.x = TRUE)
haad(FinalData,30)
length(FinalData$X)
attach(FinalData)
FinalData1=data.frame(X,CRA,Number,CHROM,POS,REF,ALT)
head(FinalData1,30)
library("xlsx")
write.csv(FinalData1, file = "C:/Users/hezardastan/Desktop/Sara/Remove_Unique/FinalCode.csv" , row.names = F)

write.csv(df_one, file = "C:/Users/hezardastan/Desktop/Sara/Remove_Unique/Action2.csv" , row.names = F)

