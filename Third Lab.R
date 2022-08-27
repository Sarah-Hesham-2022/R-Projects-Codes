# Create vector quantity
quantity <-  25
# Set the is-else statement
if (quantity > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')  
}

# Create vector quantity
quantity <-  10
# Create multiple condition statement
if (quantity <20) {
  print('Not enough for today')
} else if (quantity > 20  &quantity <= 30) {
  print('Average day')
} else {
  print('What a great day!')
}


# cat function in R with two arguments
cat(1:10,sep="\t")

category <- 'A'
price <- 10
if (category =='A'){
  cat('A vat rate of 8% is applied.','The total price is',price *1.08)  
} else if (category =='B'){
  cat('A vat rate of 10% is applied.','The total price is',price *1.10)  
} else {
  cat('A vat rate of 20% is applied.','The total price is',price *1.20)  
}

# Create fruit vector
fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
# Create the for statement
for ( i in fruit){ 
  print(i)
}

# Create an empty list
list <- c()
# Create a for statement to populate the list
for (i in seq(1, 4, by=1)) {
  list[i] <- i*i
}
print(list)



# Create a list with three vectors
fruit <- list(Basket = c('Apple', 'Orange', 'Passion fruit', 'Banana'), 
              Money = c(10, 12, 15), purchase = FALSE)
for (p  in fruit) 
{ 
  print(p)
}

# Create a matrix
mat <- matrix(data = seq(10, 21, by=1), nrow = 6, ncol =2)
# Create the loop with r and c to iterate over the matrix
for (r in 1:nrow(mat))   
  for (c in 1:ncol(mat))  
    print(paste("Row", r, "and column",c, "have values of", mat[r,c]))  


#Create a variable with value 1
begin <- 1

#Create the loop
while (begin <= 10){
  
  #See which we are  
  cat('This is loop number',begin)
  
  #add 1 to the variable begin after each loop
  begin <- begin+1
  print(begin)
}


