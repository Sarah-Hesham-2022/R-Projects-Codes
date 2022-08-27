#Normalization (x-xmin)/(xmax-xmin)
age <- c(21, 15, 44, 18, 50)
income <- c(5000, 1000, 10000, 3000, 20000)
df = data.frame(age, income)
#implementing it from scratch
df_min = apply(df, 2, min)
df_max = apply(df, 2, max)
for( j in 1:ncol(df) ){
  for(I in 1:nrow(df) ){
    df[I,j] = ( df[I,j] - df_min[j] ) / ( df_max[j] - df_min[j] )
  }
}
print(df)


#using library caret
#install.packages("caret")
library(caret)
age <- c(21, 15, 44, 18, 50)
income <- c(5000, 1000, 10000, 3000, 20000)
df = data.frame(age, income)
pre1 = preProcess(df, method = c("range") )
norm1 = predict(pre1, df)
print(norm1)

#Standardization  x = (x-mean)/std
age <- c(21, 15, 44, 18, 50)
income <- c(5000, 1000, 10000, 3000, 20000)
df = data.frame(age, income)
df_mean = apply(df, 2, mean)
df_std = apply(df, 2, sd)
for( j in 1:ncol(df) ){
  for(I in 1:nrow(df) ){
    df[I,j] = ( df[I,j] -df_mean[j] ) / df_std[j]
  }
}
print(df)


#using library caret
library(caret)
age <- c(21, 15, 44, 18, 50)
income <- c(5000, 1000, 10000, 3000, 20000)
df = data.frame(age, income)
pre2 = preProcess(df, method = c("center", "scale") )
norm2 = predict(pre2, df)
print(norm2)
