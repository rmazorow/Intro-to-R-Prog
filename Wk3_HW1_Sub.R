# Rocky Mazorow
# Feb 8, 2022

# HOMEWORK PROBLEMS

# Problem 1
 
# Part A: Create a matrix P whose entries are all prime numbers below 30.   
cells <- c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29)
P <- matrix(cells, nrow=5, ncol=2)
dim(P)

# Part B: Extract the second and third row out of `P`.
P[ c(2,3), ]

# Part C: Extract the entry in the fourth row and first column of `P`.
P[4,1]

# Part D: Generate the transpose of the matrix using the function `t()`. 
#         What is the new dimension of this matrix?
T <- t(P)
dim(T)


# Problem 2

# Part A: Create a data.frame named `my.trees` that has the following columns:  
#         Girth = c(8.3, 8.6, 8.8, 10.5, 10.7, 10.8, 11.0) 
#         Height = c(70, 65, 63, 72, 81, 83, 66) 
#         Volume = c(10.3, 10.3, 10.2, 16.4, 18.8, 19.7, 15.6)
Girth <- c(8.3, 8.6, 8.8, 10.5, 10.7, 10.8, 11.0) 
Height <- c(70, 65, 63, 72, 81, 83, 66) 
Volume <- c(10.3, 10.3, 10.2, 16.4, 18.8, 19.7, 15.6)
my.trees <- data.frame(Girth, Height, Volume)

# Part B: Extract the fifth observational unit.  
my.trees[5,]

# Part C: Extract the `Girth` column referring to it by name. 
my.trees["Girth"]

# Part D: Print out a data frame of all the observations except for the last observation.
my.trees[1:(nrow(my.trees)-1),]


# Problem 3
# The popular `iris` data set gives the measurements in centimeters of the 
# variables sepal length and width and petal length and width, respectively, 
# for 50 flowers from each of 3 species of iris. The species are Iris setosa, 
# versicolor, and virginica. The `iris` data set is included with every R installation.  

# Part A: Check the structure of the`iris` data.   
str(iris)

# Part B: How many variables and observations are in the data set?   
#     There are 5 variables and 150 observations

# Part C: Which variables are `numeric` type?  
#     The numeric variables are Sepal.Length, Sepal.Width, Petal.Length, Petal.Width

# Part D: Display the first 4 rows of the data. 
iris[1:4,]


# Problem 4

# Part A: Read Titanic data directly from the web: <https://goo.gl/NHb1Pg> 
titanic.data1 <- read.csv("https://goo.gl/NHb1Pg", header = TRUE)

# Part B: Read this data by saving it first into your working directory. 
#         Check your working directory using `getwd()` or change its location using the steps covered in the lesson.  
getwd()
titanic.data2 <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/Titanic_Data.csv", header = TRUE)

# Part C: How many passengers and what variables are in the data set?   
str(titanic.data1)
#   There are 1316 passengers
#   The variables are X, class, age, sex, and survived

# Part D: Display the first 5 rows of the data.  
titanic.data1[1:5, ]
