#Sarang Latif Qzi
#8.11.2019
#Chapter 2 excercise: Regression and model validation


lrn2014 <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
str(lrn14)
dim(lrn14)

#The data has 60 variables and 183 observations i.e. samples/subjects

#This activates the dplyr package
library(dplyr)

#here we create vectors that contain names of variables measuring depth?, surface and strategy

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#Now we create colums with only depth, surface or strategy data
#next we calculate mean of all these columns and create a new variable to store it

deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

colnames(lrn14)
str(lrn14)

#Keeping only 7 describe variables from the dataset

keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
lrn14 <- select(lrn14, one_of(keep_columns))

#changing names of 3 variables as instructed in datacamp (not required for excercise)
colnames(lrn14)

colnames(lrn14)[2] <- "age"
colnames(lrn14)[3] <- "attitude"
colnames(lrn14)[7] <- "points"

#only selecting those subjects with points > 0
lrn14 <- filter(lrn14, points> 0)

#Final data has 7 variables and 166 observations

str(lrn14)
dim(lrn14)

#Saving the data file
write.csv(lrn14, file = "data/lrn14.csv")

#reading the data file
read.csv(file = "data/lrn14.csv")

#Checked the structure of the data
head(lrn14)
