hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Meta-files http://hdr.undp.org/en/content/human-development-index-hdi and http://hdr.undp.org/sites/default/files/hdr2015_technical_notes.pdf

library(dplyr); library(ggplot2)
str(hd)
str(gii)
dim(hd)
dim(gii)
summary(hd)
summary(gii)

colnames(hd) <- c("hdirank","country","hdi","lifeexpbir","expyearedu","meanyearedu","gnipercap","gpcminhdirnk")
str(hd)

colnames(gii) <- c("giirank","country","gii","matmorrate","adlbirrat","perreppar","popsecedfem","popsecedmal","labparratefem","labparratemal")
str(gii)

gii <- mutate(gii, ratif2msecedu = (popsecedfem / popsecedmal))
gii <- mutate(gii, ratif2mlabpart = (labparratemal / labparratemal))

human <- inner_join(hd, gii, by = "country")
write.csv(human, file = "data/human.csv")

dim(human)
