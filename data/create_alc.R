#Sarang Latif Qazi
#14.11.2019
#Syntax file created for exercise 3 in order to create data using original database from (data source https://archive.ics.uci.edu/ml/machine-learning-databases/00320/ )
library(dplyr)

student_mat <- read.table("data/student-mat.csv", sep=";", header=TRUE)
student_por <- read.table("data/student-por.csv", sep=";", header=TRUE)

structure (student_mat)
structure (student_por)
dim (student_mat)
dim (student_por)

join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

math_por <- inner_join(student_mat, student_por, by = join_by)

notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_by]

alc <- select(math_por, one_of("school","sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet"))

for(column_name in notjoined_columns) {
  two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]

    if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else 
    alc[column_name] <- first_column
  }

alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

alc <- mutate(alc, high_use = alc_use > 2)

glimpse(alc)
dim(alc)

write.csv(alc, file = "data/alc.csv")


