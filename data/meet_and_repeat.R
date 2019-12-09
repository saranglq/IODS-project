library(dplyr)
library(tidyr)

BPRS <- read.csv("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep=" ")
RATS <- read.csv("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep='\t')

write.csv(BPRS, file = "data/BPRS.csv")

write.csv(RATS, file = "data/RATS.csv")

colnames(BPRS)
str(BPRS)
colnames(RATS)
str(RATS)

BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

BPRSL <-  BPRS %>% 
  gather(key = weeks, value = bprs, -treatment, -subject) %>% 
  mutate(week = as.integer(substr(weeks, 5,5)))
glimpse(BPRSL)

RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

#Let's take a look and try to find the difference between wide and long for data
BPRSL
RATSL
BPRS
RATS

#We can see that the wide form data is concise because it clusters all the information for each 
#subject and puts it in that column. #Long form data however is, as it is evident from its name, long.
#It has a single column for all the repeated measures and plots each observation for each individual in a seperate row.
#Therefore an individual might appear in multiple rows, but with different observations taken at different times. 

write.csv(BPRSL, file = "data/BPRSL.csv")

write.csv(RATSL, file = "data/RATSL.csv")
