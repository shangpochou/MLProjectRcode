#library(ridge)
#library(parcor)
library(lars)
library(glmnet)

#setwd("D:/My_Documents/BerkeleyFall/ENG290A/Project/RawData")

InputData = read.csv("MLRegdataSet_Raw.csv")
#do not sample on linux
#InputData = InputData1[sample(nrow(InputData1),size=100,replace=FALSE),]

#View(InputData)
xMatrix=matrix(c(InputData[,1],InputData[,2],InputData[,3],InputData[,4],InputData[,5],InputData[,6],InputData[,7]), nrow=nrow(InputData))
#View(xMatrix)
yMatrix = matrix(c(InputData[,8]), nrow = nrow(InputData))
#View(yMatrix)

lambdaLar = seq(from = 0, to = 0.05, by = .001)
mylar = cv.glmnet(xMatrix, yMatrix, family = "gaussian",alpha = 1,lambda = lambdaLar)
mylar$cvm
mylar$lambda
beta  <- as.vector( t(coef(mylar,s="lambda.min"))) 
beta
jpeg("LassoFullModel.jpg")
plot(mylar$lambda, mylar$cvm, type = 'l')
dev.off()
mylar$lambda.min
