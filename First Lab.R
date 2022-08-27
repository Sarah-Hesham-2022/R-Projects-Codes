print("Hello world")

#you can assign variables using <- also
x<-45.89
print(x)
y=TRUE
print(y)

#you can assign variables using <- also except characters
z="Hello world"

#class() function shows data types of variables
print(class(x))
print(class(y))
print(class(z))

#you create a vector using the function c(), also you can simply print it
vec_num=c(1,10,49)
print(vec_num)

#To access a value in a vector you use [] be careful indices start at 1 not zero
print(vec_num[1])

#you can create a vector of a range using : sign directly
range_vec=c(1:20)
print(range_vec)

#You can slice a vector using : sign directly
print(range_vec[1:15])

#Power i.e. exponents are expressed by ** or ^ ,while modulus by %% ,two wild cards in a row
print(2**3)
print(2^4)
print(2%%10)

#The division / sign gives you always decimals even if given only integers
print(3/2)
print(3.0/2)

#Function isTRUE() 
print(isTRUE(y))

#Here we make a comparison and output the logical results of each element in the vector
print(range_vec >5)

#And is & only one
print(range_vec >5 & range_vec%%2==0)

#Sometimes instead we would want the true values so we make a vector using []
#Be careful here we use two range_vec as print() function doesn't take []
print(range_vec[(range_vec >5 & range_vec%%2==0)])
print(range_vec[(range_vec >9) &(range_vec %%2==0)])

#We create a matrix using matrix() function ,we pass our data,no.rows,no.cols,order we want of elements entry default is byrow=TRUE or FALSE
mymatrix=matrix(1:10,5,2,TRUE)
print(mymatrix)
#Different possible syntax
mymatrix2=matrix(10:19,nrow = 5,ncol = 2,byrow = TRUE)
print(mymatrix2)

#To print dimensions of a matrix we use function dim()
print(dim(mymatrix))
print(dim(mymatrix2))

#We can add a column to a matrix using cbind() function but we have to define a new matrix
mymatrix=cbind(mymatrix,c(1:5))
print(mymatrix)
print(dim(mymatrix))

#We can add a row to a matrix using rbind() function but we have to define a new matrix
mymatrix=rbind(mymatrix,c(1:3))
print(mymatrix)
print(dim(mymatrix))

# concatenate c(1:5) to the matrix_a
matrix_a1 <- cbind(mymatrix, c(1:6))
# Check the dimension
dim(matrix_a1)
matrix_c <-matrix(1:12, byrow = FALSE, ncol = 3)
# Create a vector of 3 columns
add_row <- c(1:3)
# Append to the matrix
matrix_c <- rbind(matrix_c, add_row)
# Check the dimension
dim(matrix_c)

#Slice a matrix
print(mymatrix[1,2]) #first row second column
print(mymatrix[3,2]) #third row second column
print(mymatrix[1:3,1:2]) #from 1 to 3 rows and from 1 to 2 columns
print(mymatrix[1:3,1:1]) #from 1 to 3 rows and from 1 to 1 columns
print(mymatrix[,1]) #selects elements of the first column
print(mymatrix[1,]) #selects elements of the first row

#Print() function can take a second argument to remove quotes as:
my_name="Sarah Hesham"
print(my_name, quote = FALSE)

