install.packages("tm")
install.packages("SnowballC")
install.packages("stringr")
install.packages("NLP")
#load the packages 
library(tm)
library(SnowballC)
library(stringr)
#print current working directory
getwd()
readLines("apple_reviews.txt")
text2<-paste(readLines("apple_reviews.txt"),collapse=" ")
text2
#create a corpus and pre process
docs <- Corpus(VectorSource(text2))
docs <- tm_map(docs,tolower)
docs <- tm_map(docs,removeWords,stopwords("english"))
docs <- tm_map(docs,removeNumbers)
docs <- tm_map(docs,removePunctuation)
docs <- tm_map(docs,stripWhitespace)
docs <- tm_map(docs,stemDocument) 
#split the document into words and put in a single basket
str_split(text2,pattern="\\s+")
textbag <- str_split(docs,pattern="\\s+")
class(textbag)
textbag <- unlist(textbag)
#process postive words
readLines("postive-words.txt")
scoreposwords <- sum(!is.na(match(textbag,poswords)))
scoreposwords
#process negative words
readLines("negative-words.txt")
scorenegwords <-sum(!is.na(match(textbag,negwords)))
scorenegwords
if (scoreposwords>scorenegwords)
{
  print("positive comments are more")
}else
{
  print("negative comments are more")
}
score <- abs(scoreposwords - scorenegwords)
score