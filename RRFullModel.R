library(ridge)
library(parcor)
#library(lars)
#library(glmnet)

#setwd("D:/My_Documents/BerkeleyFall/ENG290A/Project/RawData")

InputData = read.csv("MLRegdataSet_Raw.csv")
#InputData = InputData1[sample(nrow(InputData1),size=100,replace=FALSE),]


#View(InputData)
xMatrix=matrix(c(InputData[,1],InputData[,2],InputData[,3],InputData[,4],InputData[,5],InputData[,6],InputData[,7]), nrow=nrow(InputData))
#View(xMatrix)
yMatrix = matrix(c(InputData[,8]), nrow = nrow(InputData))
#View(yMatrix)

lambdaSeq = seq(from = 100, to = 1000, by = 10)

jpeg("RRFullModel.jpg")
ridge.object<-ridge.cv(xMatrix,yMatrix, lambdaSeq,plot = TRUE)
dev.off()
ridge.object

