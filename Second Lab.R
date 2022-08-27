# Create Ordinal categorical vector 
day_vector <- c('evening', 'morning', 'afternoon', 'midday', 'midnight', 'evening')

# Convert `day_vector` to a factor with ordered level
factor_day <- factor(day_vector, order = TRUE, levels =c('morning', 'midday', 'afternoon', 'evening', 'midnight'))

# Print the new variable
factor_day

#count the number of occurrences of each level
summary(factor_day)

# Vector with numeric from 1 up to 5
vect  <- 1:5

# A 2x 5 matrix
mat  <- matrix(1:10, ncol = 5)

# Construct list with these vec and mat:
my_list <- list(vect, mat)

my_list

# Print second element of the list
my_list[[2]]
my_list[2]

# Create a, b, c, d variables
a <- c(10,20,30,40)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
# Join the variables to create a data frame
df <- data.frame(a,b,c,d)
df

# Name the data frame
names(df) <- c('ID', 'items', 'store', 'price')
df

# Print the structure
str(df)


## Select Rows 1 to 2
df[1:2,]

# Slice with columns name
df[, c('ID', 'store')]

# Create a new vector
quantity <- c(10, 35, 40, 5)

# Add `quantity` to the `df` data frame
df$quantity <- quantity
df

# Select the column ID
df$ID
df[,c('ID')]

# Select price above 5
print(subset(df, subset= price > 5))

#To add a row to the data frame
vec=c(50,'Rubbergum',TRUE,3.5,20)
df[nrow(df) + 1,] = vec
df






