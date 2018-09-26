fileLocation <- "http://stat.columbia.edu/~rachel/datasets/nyt1.csv"
data1 <- read.csv(url(fileLocation))
library("data.table")
library("RCurl")
library("tidyverse")
library("skimr")
library("ggplot2")
library("lubridate")
library("rjson")

x=as.data.table(data1)

x[["ageGroup"]]="0"
x[x[["Age"]]<18,][["ageGroup"]]="<18"
x[x[["Age"]]>=18 & x[["Age"]]<24,][["ageGroup"]]="18-24"
x[x[["Age"]]>=24 & x[["Age"]]<35,][["ageGroup"]]="24-35"
x[x[["Age"]]>=35 & x[["Age"]]<44,][["ageGroup"]]="35-44"
x[x[["Age"]]>=44 & x[["Age"]]<55,][["ageGroup"]]="44-45"
x[x[["Age"]]>=55 & x[["Age"]]<64,][["ageGroup"]]="55-65"
x[x[["Age"]]>=65,][["ageGroup"]]="65+"
x[["CTR"]]=x[["Clicks"]]/x[["Impressions"]]

# plot(x[["CTR"]])
# barplot(x[["CTR"]],)
# plot(table(paste(c(x[["CTR"]],x[["ageGroup"]]))))


# x %>% ggplot(aes(x=table(CTR))) + geom_bar()+xlab("Gender")+ylab("Count") + 
#   scale_y_continuous(name="Count", labels = scales::comma) +facet_grid(AgeGroup~.)+
#   ggtitle("Gender Count")
xt=x
x=x[x[["CTR"]]!=0,]


par(mfrow = c(2,2))
barplot(table(x[x[["ageGroup"]]=="<18",][["CTR"]]),main="<18")
barplot(table(x[x[["ageGroup"]]=="18-24",][["CTR"]]),main="18-24")
barplot(table(x[x[["ageGroup"]]=="24-35",][["CTR"]]),main="24-35")
barplot(table(x[x[["ageGroup"]]=="35-44",][["CTR"]]),main="35-44")


barplot(multistakeuserutil,col="darkgreen") 
barplot(reguserUtil,col="red")