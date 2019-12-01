hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Meta-files http://hdr.undp.org/en/content/human-development-index-hdi and http://hdr.undp.org/sites/default/files/hdr2015_technical_notes.pdf

#variable descriptions
#the variables have been derived from two datasets. First is the data used to create Human Devlopment Index (HDI). HDI was developed by the UNDP. The Gender Inequality Index is also devloped by the UNDP. According to the UNDP website, It measures gender inequalities in three important aspects of human development—reproductive health, measured by maternal mortality ratio and adolescent birth rates; empowerment, measured by proportion of parliamentary seats occupied by females; and economic status, expressed as labour market participation. The variables we will be using from these dataset are:
#country: The country being described
#hdirank: HDI rank, which tells what is the rank of the country in terms of Human development index
#hdi: The Human Devleopment Index score
#lifeexp: Life expectancy at birth
#eduexp: Expected years of schooling
#meanedu: Mean years of schooling
#gni: gross national income per capita
#gniminusrank: Gross national income per capita rank minus HDI rank
#giirank: Gender Inequality Index rank
#gii: The Gender Inequality Index score
#matmor: Maternal mortality ratio
#Adobir: Adolescent birth rate
#fparli: Percent representation of women in parliament
#secedf: Percent population (women) with secondary education
#secedm: Percent population (men) with secondary education
#labf: Percent participation (of women) in labor force
#labm: Percent participation (of men) in labor force

#Using the above variables, following additional variables were created

#secedfm: Ratio between % women and % men with secondary education
#labfm: Ratio between % women and % men in labor force

library(dplyr); library(ggplot2); library(stringr);library(tidyr)
str(hd)
str(gii)
dim(hd)
dim(gii)
summary(hd)
summary(gii)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

colnames(hd) <- c("hdirank","country","hdi","lifeexp","eduexp","meanedu","gni","gniminusrank")
str(hd)

colnames(gii) <- c("giirank","country","gii","matmor","adobir","fparli","secedf","secedm","labf","labm")
str(gii)

gii <- mutate(gii, secedfm = (secedf / secedm))
gii <- mutate(gii, labfm = (labf / labm))


human <- inner_join(hd, gii, by = "country")

write.csv(human, file = "data/human.csv")


dim(human)
