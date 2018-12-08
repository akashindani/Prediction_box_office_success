setwd("C:/Users/Akash/Documents/Twitter_R/actors")

library(XML)
library(stringi)
library(stringr)
library(httpuv)
library(httr)
library(reshape2)
melt(testactors)
#actor_f <- read.csv(file.choose(),header = TRUE,sep = ",") 
testactors <- read.csv("~/Twitter_R/testactors.csv", sep="")
str_list_actor<-str_replace_all(tolower(testactors$RT_cast1)," ","")

actor_data <- data.frame(name=character(0),Rating=integer(0))

for(item in str_list_actor[1:3])
{
  str1<-"http://www.rottentomatoes.com/celebrity/"
  str2<-item
  final_str<- paste(str1,str2,sep = "")
  srts<- htmlParse(final_str)
  srts.table<- readHTMLTable(srts,stringsAsFactors = FALSE)
  temp <- srts.table$'NULL'
  t1<-colnames(temp)[2]
  keep <- substr(t1,1,3)
  actor_data <- rbind(actor_data,cbind.data.frame(name=item,Rating=keep))
  print(keep)
}

write.table(file="data_actor_rating.csv",actor_data,sep=",",row.names = FALSE,append = TRUE)

