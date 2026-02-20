names =c("Carrol","Mike","John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)
df = data.frame(names,gender,height,weight,age)
View(df)


#accessing data
df1 <- df[1,3]
print(df1)
cat("\n ")

df2 <- df[1:2, 1:3]
print(df2)
cat("\n ")

df3 <- df["height"]
print(df3)
cat("\n ")

df4 <- df["gender"] #returns data frame
print(df4)
cat("\n ")

df5 <- df$gender #returns vector
print(df5)
cat("\n ")

df6 <- df[1:2]
print(df6)
cat("\n ")

df7 <- df[c(1,2)]
print(df7)
cat("\n ")

df8 <- df[df$names == "Mike",]
print(df8)
cat("\n ")

df9 <- df[df$names == "fufu",]
print(df9)
cat("\n ")

#new data
newdf = rbind(df,data.frame(names = "Suuria", gender = "Female", height = 156, weight = 56, age = 23 ))
#print("After Added rows:")
cat("\n ")
print(newdf)

cat("\n ")
print("Before Adding:")
print(df)
newDf = rbind(df, data.frame(names = c("Suuria","Malik"),
                             gender = c("Female","Male"),
                             height = c(156,169),
                             weight = c(56,81),
                             age = c(23, 28)))
cat("\n ")
print("After Added rows:")
print(newDf)

#merging
gender = c("Female", "Male", "Male","Female","Male")
height = c(160, 175, 173,156,169)
weight = c(49, 89, 77,56,81)
age = c(35, 36, 41,23, 28)
names =c("Carrol","Mike","John","Suuria","Malik")
df1 = data.frame(names,gender,height,weight,age)

states = c("Selangor","Perak","Melaka")
names = c("Carrol","John","Malik")
df2 = data.frame(names, states)

#merge 2 data frames
dfMerge <- merge(df1, df2, by = "names", all= TRUE)
View(dfMerge)

#remove row 2
newDf2 = newDf[-2,]
View(newDf2)

#edit age in row 1, height in row 4
newDf3 = newDf
newDf3[1,"age"] <- 30
newDf3[4, "height"] <- 152
View(newDf3)

#to remove collumn 4
newDf4 = newDf
newDf4[,-4]
View(newDf4)

data_cv = read.csv("D:\UNI FILES\DataScienceLecture\DataScienceLecture\my_covid.csv")
data_cv2 = read.csv("D:\UNI FILES\DataScienceLecture\DataScienceLecture\NAexample.csv")

#creating a vector of integers having NAs.
a<-c(seq(1,10,3), rep(NA,4), seq(10,2,-2))
a
cat("\n ")
print(a)

#assigning 0 to NAs
a[is.na(a)]<-0
cat("\n ")
print(a)

#mean
a[is.na(a)]<-mean(a, na.rm = TRUE)
cat("\n ")
print(a)

#file1 cleaning
View(df_raw)
library(readr)
df_raw <- read.csv("file1.csv")
df_cleaned <- df_raw
df_logrm <- data.frame(TagsValue=character(), Definition=character(), Value=character())
rows_to_remove <- c()

for (i in 1:nrow(df_raw))
{
  if (df_raw[i, 2] == "Bad value" && df_raw[i, 3] == "Garbage")
  {
    rows_to_remove <- c(rows_to_remove, i)
    # Log the removed bad values
    df_logrm <- rbind(df_logrm, c(df_raw[i, 1], df_raw[i, 2],df_raw[i, 3]))
    # Save the index for the rows to be removed
  }
}
df_cleaned <- df_cleaned[-rows_to_remove, ]
View(df_cleaned)
View (df_logrm)


#data normalization
data(iris)
head(iris)
str(iris)
iris$Sepal.Length_norm <- (iris$Sepal.Length - min(iris$Sepal.Length)) / (max(iris$Sepal.Length) - min(iris$Sepal.Length))
head(iris)

#data standardization
iris$Sepal.Length
mean_value <- mean(iris$Sepal.Length)
mean_value
sd_value <- sd(iris$Sepal.Length)
sd_value
z_manual <- (iris$Sepal.Length - mean_value) / sd_value
z_manual
iris$Sepal.Length_z_manual <- (iris$Sepal.Length - mean_value) / sd_value
head(iris)
iris$Sepal.Length_z <- scale(iris$Sepal.Length)
head(iris)

#convert categorical to numerical
data(iris)
head(iris)
class(iris$Species)
levels(iris$Species)
iris$Species_numeric <- as.numeric(iris$Species)
head(iris)