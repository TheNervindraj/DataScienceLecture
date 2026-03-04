install.packages("dplyr")
library(dplyr)
library(readr)

student_data <- read.csv("D:/UNI FILES/DataScienceLecture/student_data.csv")

View(student_data)

summ <- summary(student_data)

head1 <- head(student_data, 15)

tail1 <- tail(student_data)

cat(summ)
cat("\n")
print(head1)
cat("\n")
print(tail1)
cat("\n")


#filter
student_fail <- student_data%>% filter(final_exam_mark < 40)
View(student_fail)

#arranged student data
mydata <- student_data%>% filter(final_exam_mark > 40) %>% arrange(final_exam_mark)
View(mydata)

#arranged descending
mydata1 <- student_data%>% filter(final_exam_mark > 40) %>% arrange(desc(final_exam_mark))
View(mydata1)

#select
mydata2 <- student_data%>% select(student_id,coursework_mark, final_exam_mark)
View(mydata2)
glimpse(mydata2)

#mutate
mydata3 = student_data%>% mutate(Total_Mark = (coursework_mark + final_exam_mark/200*100))
View(mydata3)

#mutate(cbind)
mydata4 <- cbind(student_data, Total_Mark = (student_data $coursework_mark + student_data$final_exam_mark/200*100))
View(mydata4)


#descriptive analytics
#iris
data(iris)
str(iris)
summary(iris)


#quantile
A <- c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
print(quantile(A))
print(IQR(A))


#histogram
hist(iris$Sepal.Length,
     main = "Histogram Sepal",
     xlab = "Sepal length(cm)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

#boxplot
boxplot(Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length(cm)",
        col = c("lightgreen", "lightpink", "lightyellow"))

#scatterplot
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Sepal Length vs Petal Length",
     xlab = "Sepal Length(cm)",
     ylab = "Petal Length(cm)",
     col = as.numeric(iris$Species),
     pch = 19)

legend("topleft",
       legend = levels(iris$Species),
       col = 1:3,
       pch =19)


#outliers
players <- read.csv("D:/UNI FILES/DataScienceLecture/players.csv")

is.na(players)

#if(players$Age == NA)
  #then playes$Age = median(players$Age)

random_data <- c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(random_data, main = "Boxplot")


#range/handling outlierrs
first_q<-quantile(random_data,0.25)
third_q<-quantile(random_data,0.75)

iqr<-IQR(random_data)
le<-first_q- 1.5 * iqr
ue<-third_q + 1.5*iqr

data_new<-random_data
data_new <- data_new[!data_new<le]
data_new <- data_new[!data_new>ue]
data_new

boxplot(data_new, main="boxplot")
                                 
                                 
                                 
                                 
                    
                                
