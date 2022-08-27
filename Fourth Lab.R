#We use apply() over a matrice. This function takes 5 arguments
m1=matrix(c(1:10),nrow=5,ncol=6)
m2=apply(m1,2,sum)
print(m2)
print(class(m2)) #Integer not a list and that is what we say about vectors

#l in lapply() stands for list. The difference between lapply() and apply() lies between the output return. The output of lapply() is a list. lapply() can be used for other objects like data frames and lists.
#lapply() function does not need MARGIN.
m1=matrix(c("Spiderman","Superman","Batman","Antman"),nrow=2,ncol=2,byrow = TRUE)
m2=lapply(m1,toupper)
print(str(m2))
print(class(m2))

#We can use unlist() to convert the list into a vector.
m2=(unlist(m2))
print(class(m2))  #Character not a list and that is what we say about vectors

#The sapply() function works like lapply(), but it tries to simplify the output to the most elementary data structure that is possible
m1=matrix(c("Spiderman","Superman","Batman","Antman"),nrow=2,ncol=2,byrow = TRUE)
m2=sapply(m1,toupper)
print(m2)
print(class(m2))
m2=str(m2)
print(class(m2))

#The function tapply() computes a measure (mean, median, min, max, etc..) or a function for each factor variable in a vector.
data("iris")
print(tapply(iris$Sepal.Width,iris$Species,median))

#Use Function length()
print(length(iris[,1])) #Number of rows
print(length(iris)) #Number of columns


# sequence of number from 44 to 55 both including incremented by 1
x_vector <- seq(45,55, by = 1)
#logarithm
print(log(x_vector))
#exponential
exp(x_vector)
#squared root
print(sqrt(x_vector))   
#factorial
print(factorial(x_vector))


#Statistical Function
print(mean(iris$Sepal.Length))
print(median(iris$Sepal.Length))
print(var(iris$Sepal.Length))
print(sd(iris$Sepal.Length))
print(summary(iris$Sepal.Length)) #Box Plot Values


#R does not have a standard in-built function to calculate mode. So we create a user function to calculate mode of a data set in R. This function takes the vector as input and gives the mode value as output.
# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
print(getmode(iris$Sepal.Length))

#Functions built by programmer square_function receives an argument "n". We didn't specify the type of variable so that the user can pass an integer, a vector or a matrix. We don't write a "return" keyword to return a value of a function
squareNumber=function(n)
{
   n*n
}
print(squareNumber(4))

#When you are done using the function, we can remove it with the rm() function.
rm(squareNumber)

Normalization=function(n)
{
    n=(n-min(n))/(max(n)-min(n))
}
v1=Normalization(iris$Sepal.Length)
print(v1)

Price <- c(1:10)
Number_of_orders <- c(2, 4, 1, 10, 3, 5, 9, 8, 1, 3)
df <- data.frame(Price, Number_of_orders, stringsAsFactors = FALSE)
x=sapply(df,Normalization)
print(x)
