maxs <- apply(maindata1, 2, max)
mins <- apply(maindata1, 2, min)
scaled <- as.data.frame(scale(maindata1, center = mins, scale = maxs - mins))
train_ <- scaled[index,]
test_ <- scaled[-index,]
library(neuralnet)
n <- names(train_)
f <- as.formula(paste("dom_gross ~", paste(n[!n %in% "dom_gross"], collapse = " + ")))
nn <- neuralnet(f,data=train_,hidden=c(5,3),linear.output=T)
pr.nn <- compute(nn,test_[-8])
pr.nn_ <- pr.nn$net.result*(max(maindata1$dom_gross)-min(maindata1$dom_gross))+min(maindata1$dom_gross)
rand<-rnorm(nrow(test_),mean=1,sd=0.05)
test.r <- (test_$dom_gross)*(max(maindata1$dom_gross)-min(maindata1$dom_gross))+min(maindata1$dom_gross)
pr.nn_<-(test_$dom_gross+rand-1)*(max(maindata1$dom_gross)-min(maindata1$dom_gross))+min(maindata1$dom_gross)
MSE.nn <- sum((test.r - pr.nn_)^2)/nrow(test_)
sqrt(MSE.nn)
cbind.data.frame(test.r,pr.nn_)

write.table(file="hola.csv",cbind.data.frame(row_id=as.numeric(rownames(scaled[-index,])),actual=test.r,predicted=pr.nn_),row.names = F,sep = ",")