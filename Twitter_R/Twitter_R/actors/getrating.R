setwd("C:/Users/Akash/Documents/Twitter_R/director")

library(XML)
library(stringi)
library(stringr)
library(httpuv)
library(httr)

director_f <- read.csv(file.choose(),header = TRUE,sep = ",") 

str_list_director<-str_replace_all(tolower(actor_f$RT_cast1)," ","")

director_data <- data.frame(name=character(0),Rating=integer(0))

for(item in str_list_director[6:7])
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

write.table(file="data_actor_rating.csv",actor_data,sep=",",row.names = FALSE)

