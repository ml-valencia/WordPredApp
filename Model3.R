
blogs <- readLines("en_US.blogs.txt", encoding = "UTF-8", skipNul = TRUE, warn=FALSE)
news <- readLines("en_US.news.txt", encoding = "UTF-8", skipNul = TRUE, warn=FALSE)
tweets <- readLines("en_US.twitter.txt", encoding = "UTF-8", skipNul = TRUE, warn=FALSE)

library(tm)
library(quanteda) 
set.seed(212)
data.sample<-c(sample(blogs,length(blogs)*0.01),
               sample(news,length(news)*0.01),
               sample(tweets,length(tweets)*0.01))

#BiGrams
Tokens2<-tokens(data.sample,remove_numbers = TRUE,  remove_punct = TRUE, remove_hyphens = TRUE, remove_twitter=TRUE, remove_url=TRUE,ngrams=2,verbose=TRUE,concatenator=" ")
Tokens2<-tokens_tolower(Tokens2) 
bigrams1 <- dfm(Tokens2)
n2 <- textstat_frequency(bigrams1)

#Trigrams
Tokens3 <- tokens(data.sample, remove_numbers = TRUE,  remove_punct = TRUE, remove_hyphens = TRUE, remove_twitter=TRUE, remove_url=TRUE, ngrams=3,verbose=TRUE,concatenator=" ")
Tokens3<-tokens_tolower(Tokens3) 
trigrams1<- dfm(Tokens3)
n3 <- textstat_frequency(trigrams1)


saveRDS(n2,file="bigram.rds")
saveRDS(n3,file="trigram.rds")
