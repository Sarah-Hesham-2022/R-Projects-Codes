#Read CSV
#You can have an online path
path='https://raw.githubusercontent.com/guru99-edu/R-Programming/master/mtcars.csv'                
df=read.csv(path,header=TRUE,sep=',',stringsAsFactors = TRUE)

#Length() prints the length of the columns not the rows
print(length(df))
print(df)

#It will print factor not character because stringsAsFactors is TRUE if you make it false it will return character
print(class(df$X))

#Read Excel
install.packages("readxl")
library(readxl)
print(readxl_example())

#To check the location of the spreadsheet named clippy.xls, simple use
print(readxl_example("geometry.xls"))

#arguments:
#-PATH: Path where the excel is located
#-sheet: Select the sheet to import. By default, all
#-range: Select the range to import. By default, all non-null cells
#-col_names: Select the columns to import. By default, all non-null columns

file=read_excel(readxl_example("datasets.xlsx"), sheet = NULL, range= NULL, col_names = TRUE)
print(file)

print(length(file))

#The file datasets.xlsx is composed of 4 sheets. We can find out which sheets are available in the workbook by using excel_sheets() function
print(excel_sheets(readxl_example("datasets.xlsx")))

#If a worksheet includes many sheets, it is easy to select a particular sheet by using the sheet arguments. 
#We can specify the name of the sheet or the sheet index. We can verify if both function returns the same output with identical().
file2=read_excel(readxl_example("datasets.xlsx"), sheet = 4, range= NULL, col_names = TRUE)
file3=read_excel(readxl_example("datasets.xlsx"), sheet = "quakes", range= NULL, col_names = TRUE)
print(identical(file2,file3))

#We can control what cells to read in 2 ways
#1.	Use n_max argument to return n rows
#2.	Use range argument combined with cell_rows or cell_cols
file4=read_excel(readxl_example("datasets.xlsx"),n_max=5,col_names=TRUE)
print(file4)

#If we change col_names to FALSE, R creates the headers automatically.
file5=read_excel(readxl_example("datasets.xlsx"),n_max=5,col_names=FALSE)
print(file5)

#We can also use the argument range to select rows and columns in the spreadsheet. In the code below, we use the excel style to select the range A1 to B5
print(read_excel(readxl_example("datasets.xlsx"), range = "A1:B5", col_names =TRUE))
print(read_excel(readxl_example("datasets.xlsx"), range = cell_rows(1:5), col_names =TRUE))

#Correct Header Names
print(read_excel(readxl_example("datasets.xlsx"), range = cell_rows(2:5), col_names =FALSE))

#INCorrect Header Names
print(read_excel(readxl_example("datasets.xlsx"), range = cell_rows(2:5), col_names =TRUE))

#We can select the columns with the letter, like in Excel.
print(read_excel(readxl_example("datasets.xlsx"), range = cell_cols("A:B"), col_names =TRUE))

#Note : range = cell_cols("A:B"), returns output all cells with non-null value. The dataset contains 150 rows, therefore, read_excel() returns rows up to 150. 
#This is verified with the dim() function.
#read_excel() returns NA when a symbol without numerical value appears in the cell. We can count the number of missing values with the combination of two functions
iris_na =read_excel(readxl_example("datasets.xlsx"), na ="setosa")
print(sum(is.na(iris_na)))

#Export to Hard drive
#To begin with, you can save the data directly into the working directory. The following code prints the path of your working directory:
#By default, the file will be saved in the below path.
directory=getwd()
print(directory)

v1<-c(1,2,3,4)
v2<-c("ss","pp","ff","ww")
v3<-c(20:23)
df<-data.frame(v1,v2,v3,stringsAsFactors=FALSE)
write.csv(df, "table_car.csv")
print(read.csv('table_car.csv'))
#You can use the function write.csv2() to separate the rows with a semicolon.
write.csv2(df, "table_car.csv")
print(read.csv('table_car.csv'))

#Export to Excel file
install.packages("xlsx")
library(xlsx)
write.xlsx(df, "table_car.xlsx")

#Scatter Plot in R using ggplot2 
#ggplot(data, mapping=aes()) + 
#geometric object 
#arguments: 
#data: Dataset used to plot the graph
#mapping: Control the x and y-axis 
#geometric object: The type of plot you want to show. The most common object are:
#- Point: `geom_point()` 
#- Bar: `geom_bar()`
#- Line: `geom_line()` 
#- Histogram: `geom_histogram()

install.packages("ggplot2")
library(ggplot2)
ggplot(mtcars, aes(x = drat, y = mpg)) +
  geom_point()
#.	You first pass the dataset mtcars to ggplot.
#.	Inside the aes() argument, you add the x-axis and y-axis.
#.	The + sign means you want R to keep reading the code. It makes the code more readable by breaking it.
#.	Use geom_point() for the geometric object.

ggplot(mtcars, aes(x = mpg, y = drat)) +
  geom_point(aes(color = factor(gear)))

#.	The aes() inside the geom_point() controls the color of the group.
#The group should be a factor variable. Thus, you convert the variable gear in a factor.
#.	Altogether, you have the code aes(color = factor(gear)) that change the color of the dots.

#Rescale the data is a big part of the data scientist job. In rare occasion data comes in a nice bell shape. One solution to make your data less sensitive to outliers is to rescale them.
ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color = factor(gear)))
#Code Explanation
#.	You transform the x and y variables in log() directly inside the aes() mapping.
#Note that any other transformation can be applied such as standardization or normalization.

#You can add another level of information to the graph. You can plot the fitted value of a linear regression.
my_graph <- ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color = factor(gear))) +
  stat_smooth(method = "lm",
              col = "#C42126",
              se = FALSE,
              size = 1)
print(my_graph)
#Code Explanation
#.	graph: You store your graph into the variable graph. It is helpful for further use or avoid too complex line of codes
#.	The argument stat_smooth() controls for the smoothing method
#.	method = "lm": Linear regression
#.	col = "#C42126": Code for the red color of the line
#.	se = FALSE: Don't display the standard error
#.	size = 1: the size of the line is 1

#Add information to the graph

#lab(title = "Hello Guru99")
#argument:
#- title: Control the title. It is possible to change or add title with:			
#- subtitle: Add subtitle below title			
#- caption: Add caption below the graph			
#- x: rename x-axis			
#- y: rename y-axis			
#Example:lab(title = "Hello Guru99", subtitle = "My first plot")	
my_graph=my_graph +
  labs(
    title = "Plot Mile per hours and drat, in log"
  )
print(my_graph)

#You can add a dynamic name to our graph, namely the average of mpg.
mean_mpg <- mean(mtcars$mpg)
my_graph=my_graph + labs(
  title = paste("Plot Mile per hours and drat, in log. Average mpg is", mean_mpg)
)
print(my_graph)
#Code Explanation
#.	You create the average of mpg with mean(mtcars$mpg) stored in mean_mpg variable
#.	You use the paste() with mean_mpg to create a dynamic title returning the mean value of mpg


#Finally, R allows us to customize out plot with different themes. The library ggplot2 includes eights themes:
#theme_bw()
#.	theme_light()
#.	theme_classis()
#.	theme_linedraw()
#.	theme_dark()
#.	theme_minimal()
#.	theme_gray()
#.	theme_void()
my_graph=my_graph +
  theme_dark() +
  labs(
    x = "Drat definition, in log",
    y = "Mile per hours, in log",
    color = "Gear",
    title = "Relation between Mile per hours and drat",
    subtitle = "Relationship break down by gear class",
    caption = "Authors own computation"
  )
print(my_graph)

#Save Plots
ggsave("my_fantastic_plot.png")

# Most basic bar chart
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar()

#Change the color of the bars
#You can change the color of the bars. Note that the colors of the bars are all similar.
# Change the color of the bars
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "coral") +
  theme_classic()

#You can use this code:
print(grDevices::colors())		
#to see all the colors available in R. There are around 650 colors.

#Bar chart in percentage
#You can visualize the bar in percentage instead of the raw count.
# Bar chart in percentage
ggplot(mtcars, aes(x =factor(cyl), fill = am)) +
  geom_bar(position = "fill") +
  theme_classic()

#Scatter Plots
#The basic syntax for creating scatterplot in R is ???
#plot(x, y, main, xlab, ylab, xlim, ylim, axes)
#Following is the description of the parameters used ???
#.	x is the data set whose values are the horizontal coordinates.
#.	y is the data set whose values are the vertical coordinates.
#.	main is the tile of the graph.
#.	xlab is the label in the horizontal axis.
#.	ylab is the label in the vertical axis.
#.	xlim is the limits of the values of x used for plotting.
#.	ylim is the limits of the values of y used for plotting.
#.	axes indicates whether both axes should be drawn on the plot.

# Get the input values.
input <- mtcars[,c('wt','mpg')]

# Give the chart file a name.
png(file = "scatterplot.png")

# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)

# Save the file.
dev.off()

#The basic syntax to create a bar-chart in R is ???
#barplot(H,xlab,ylab,main, names.arg,col)
#Following is the description of the parameters used ???
#.	H is a vector or matrix containing numeric values used in bar chart.
#.	xlab is the label for x axis.
#.	ylab is the label for y axis.
#.	main is the title of the bar chart.
#.	names.arg is a vector of names appearing under each bar.
#.	col is used to give colors to the bars in the graph.

# Create the data for the chart
H <- c(7,12,28,3,41)

# Give the chart file a name
png(file = "barchart.png")

# Plot the bar chart 
barplot(H)

# Save the file
dev.off()

#The features of the bar chart can be expanded by adding more parameters. 
#The main parameter is used to add title. The col parameter is used to add colors to the bars. 
#The args.name is a vector having same number of values as the input vector to describe the meaning of each bar.

