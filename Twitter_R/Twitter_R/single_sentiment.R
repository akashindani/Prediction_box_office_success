  setwd("C:/Users/Akash/Documents/Twitter_R")
  
  
  library(twitteR)
  library(plyr)
  require(RCurl)
  require(base64enc)
  library(stringi)
  library(stringr)
  library(sentiment)
  
  consumer_key <- 'SROFJgvtUjFPK00Ue2yx0Qmp5'
  consumer_secret <- 'K62rg2y1YOPSLFOTRJW7yppeHEguHLMQArAovDOJyX0dZe5LdY'
  access_token <- '2356577120-LRSg7XomwsG0NsOs8Ah0mKq7fTR8R0Hi258pIYW'
  access_secret <- 'doknp4Svce9cExKgAQ69sHE7ujRyyw8oSCmluo8zenlb1'
  
  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  
  #str_list<-str_replace_all(trimws(tolower(numbers_RT_omdb_cleaned$RT_title))," ","")
  
  #weets_list<-vector("list")
  
  data_final<-data.frame(name=character(0),negative=integer(0),neutral=integer(0),positive=integer(0))
  
  #print(data_final)
  #for(item in str_list[70]){
    
    tweets <- searchTwitter('junglebook',100, lang = "en")
    temp<-sapply(tweets,function(x) x$text)
    polarities<-sapply(temp,function(y) sentiment(y)$polarity)
    data_final <- rbind(data_final,cbind.data.frame(name="jungle book",positive=length(which(polarities == "positive")),negative=length(which(polarities == "negative")),neutral=length(which(polarities == "neutral"))))
    #data_final[nrow(data_final)+1,]<-c(item,length(which(polarities == "negative")),length(which(polarities == "neutral")),length(which(polarities == "positive")))
    print(data_final)
    
  
  
  #write.table(file="data_sentiment.csv",data_final,sep=",",row.names = FALSE)
  
