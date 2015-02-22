
##We will use some functionality from dplyr
library(dplyr)

##we will also be using melt
library(reshape2)

##bring in the activity names table
activity <- read.table(paste(getwd(),"/activity_labels.txt",sep=""),col.names=c("status","status.desc"))

##Bring in the column names
features <- read.table(paste(getwd(),"/features.txt",sep=""))

##Create a vector of column names to be applied
feat.str <- as.vector(features$V2)

##Create a list of only the columns we wish to keep
##This includes those which have "mean()" or "ste()" in them
keep.str <- c(grep("mean()",feat.str,fixed=TRUE),grep("std()",feat.str,fixed=TRUE))
sort(keep.str)

##Bring in the training data and apply the names
train.set <- read.table(paste(getwd(),"/train/x_train.txt",sep=""),col.names=feat.str)
##Limit to just the columns we want
train.set1 <- train.set[ , keep.str]
##bring in the state and subject sets
train.state <- read.table(paste(getwd(),"/train/y_train.txt",sep=""),col.names="status")
train.sub <- read.table(paste(getwd(),"/train/subject_train.txt",sep=""),col.names="ID")

##combine all the training data
train <- cbind(train.state,train.sub,train.set1)
train <- mutate(train,train.test="train")



##Bring in the test data and apply the names
test.set <- read.table(paste(getwd(),"/test/x_test.txt",sep=""),col.names=feat.str)
##Limit to just the columns we want
test.set1 <- test.set[ , keep.str]
##bring in the state and subject sets
test.state <- read.table(paste(getwd(),"/test/y_test.txt",sep=""),col.names="status")
test.sub <- read.table(paste(getwd(),"/test/subject_test.txt",sep=""),col.names="ID")

##combine all the test data
test <- cbind(test.state,test.sub,test.set1)
test <- mutate(test,train.test="test")

##Stack the training and test data
full.set <- rbind(train,test)

tidy.set <- merge(activity,full.set)

##melting this tidy set will make it easier to summarize
tidy.melt <- melt(tidy.set,id=c("ID","status.desc"),measure.vars=names(tidy.set[4:69]))

Grouping <- group_by(tidy.melt,ID, status.desc,variable)

sum.tidy <- summarize(Grouping,mean(value, na.rm=TRUE))

write.table(sum.tidy,file=paste(getwd(),"/Proj3Results.txt",sep=""),row.name=FALSE)

