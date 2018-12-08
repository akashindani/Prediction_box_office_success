setwd("C:/Users/Akash/Documents/Twitter_R/cluster")

require(graphics)
d1 <- reduced1

grp <- kmeans((reduced1$budget),centers = 10)

c1 <- data[grp$cluster==1,]
write.csv(c1,file = "c1.csv")

c2 <- data[grp$cluster==2,]
write.csv(c2,file = "c2.csv")

c3 <- data[grp$cluster==3,]
write.csv(c3,file = "c3.csv")

c4 <- data[grp$cluster==4,]
write.csv(c4,file = "c4.csv")

c5 <- data[grp$cluster==5,]
write.csv(c5,file = "c1.csv")

c6 <- data[grp$cluster==6,]
write.csv(c6,file = "c6.csv")

c7 <- data[grp$cluster==7,]
write.csv(c7,file = "c1.csv")

c8 <- data[grp$cluster==8,]
write.csv(c8,file = "c8.csv")

c9 <- data[grp$cluster==9,]
write.csv(c9,file = "c9.csv")

c10 <- data[grp$cluster==10,]
write.csv(c10,file = "c10.csv")

