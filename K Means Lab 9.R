df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54),
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
plot(df$age, df$spend)

#You will proceed as follow:
#.	Import data
#.	Preprocessing
#.	Train the model
#.	Evaluate the model
#K means is not suitable for factor variables because it is based on the distance and discrete values do not return meaningful values.

#.	Import data
getwd()
PATH = 'computers.csv'
df <- read.csv(PATH)
summary(df)

#.	Preprocessing
#install.packages("magrittr") 
#install.packages("dplyr")
library("dplyr") 
library("magrittr")
rescale_df = df %>%
  mutate(price_scal = scale(price),
         hd_scal = scale(hd),
         ram_scal = scale(ram),
         screen_scal = scale(screen),
         ads_scal = scale(ads),
         trend_scal = scale(trend)) %>%
  
select(-c(price, speed, hd, ram, screen, ads, trend))

#Training the model:
#R base has a function to run the k mean algorithm. The basic function of k mean is:
set.seed(2345)
#install.packages("animation")
library(animation)
kmeans.ani(rescale_df[2:3], 3)

kmeans(df, 3)
#arguments:
#-df: dataset used to run the algorithm
#-k: Number of clusters

pc_cluster <-kmeans(rescale_df, 5)


#You can construct the elbow graph and find the optimal k as follow:
#.	Step 1: Construct a function to compute the total within clusters sum of squares
#.	Step 2: Run the algorithm times
#.	Step 3: Create a data frame with the results of the algorithm
#.	Step 4: Plot the results
#Step 1) Construct a function to compute the total within clusters sum of squares
#You create the function that runs the k-mean algorithm and store the total within clusters sum of squares
kmean_withinss <- function(k) {
  cluster <- kmeans(rescale_df, k)
  return (cluster$tot.withinss)
}

## Try with 2 cluster
kmean_withinss(2)

#Step 2) Run the algorithm n times
#You will use the sapply() function to run the algorithm over a range of k. This technique is faster than creating a loop and store the value.
# Set maximum cluster 
max_k <-20 
# Run algorithm over a range of k 
wss <- sapply(2:max_k, kmean_withinss)


#Step 3) Create a data frame with the results of the algorithm
#Post creation and testing our function, you can run the k-mean algorithm over a range from 2 to 20, store the tot.withinss values.
# Create a data frame to plot the graph
elbow <-data.frame(2:max_k, wss)
#Code Explanation
#.	data.frame(2:max_k, wss): Create a data frame with the output of the algorithm store in wss

#Step 4) Plot the results
#You plot the graph to visualize where is the elbow point
# Plot the graph with gglop
library("ggplot2")
ggplot(elbow, aes(x = X2.max_k, y = wss)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 20, by = 1))

pc_cluster_2 <-kmeans(rescale_df, 7)
#As mention before, you can access the remaining interesting information in the list returned by kmean().
pc_cluster_2$cluster
pc_cluster_2$centers
pc_cluster_2$size	
