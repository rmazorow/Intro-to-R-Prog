# Rocky Mazorow
# Mar 1, 2022

# HOMEWORK PROBLEMS

# Problem 1

# Part A: Check the structure of the data using the function `str(iris)`.  
str(iris)

# Part B: Find the average (or mean) measurement of the variable `Sepal.Length`. 
mean(iris$Sepal.Length, na.rm = TRUE)

# Part C: Find the average `Sepal.Length` for the different flower `Species`.
tapply(iris$Sepal.Length, iris$Species, mean)

# Part D: Repeat (1.B) and (1.C) but use the summary standard deviation `sd()` 
#         which describes the spread of the variable.   
sd(iris$Sepal.Length, na.rm = TRUE)
tapply(iris$Sepal.Length, iris$Species, sd)

# Part E: Describe the shape of the variable `Sepal.Length` by creating a 
#         histogram using `histogram()`. 
hist(iris$Sepal.Length)

# Part F: Compare the `Sepal.Length` of the three species of flowers by creating 
#         a side-by-side boxplot using `boxplot()`.
boxplot(iris$Sepal.Length ~ iris$Species)

# Problem 2

# Load the data set `MLB-TeamBatting-S16.csv`
mlb16.data <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/data/mlb16.csv", header = TRUE)

str(mlb16.data) # check structure
head(mlb16.data)  # show first six rows

# Part A: Find the average measurement for the following variables:
#         `BatAge`, `RPG`, `R`, `H` and `BA`
mean(mlb16.data$BatAge, na.rm = TRUE)
mean(mlb16.data$RPG, na.rm = TRUE)
mean(mlb16.data$R, na.rm = TRUE)
mean(mlb16.data$H, na.rm = TRUE)
mean(mlb16.data$BA, na.rm = TRUE)

# Part B: Create histogram's for each variable in (2.A).     
hist(mlb16.data$BatAge)
hist(mlb16.data$RPG)
hist(mlb16.data$R)
hist(mlb16.data$H)
hist(mlb16.data$BA)

# Part C: Using your own words, describe the distribution of each variable in (2.A).


# Part D: Find the average and the standard deviation of the variables 
#         `RPG`, `H` and `BA` for each league. Use `tapply()`.    
tapply(mlb16.data$RPG, mlb16.data$Lg, mean)
tapply(mlb16.data$RPG, mlb16.data$Lg, sd)
tapply(mlb16.data$H, mlb16.data$Lg, mean)
tapply(mlb16.data$H, mlb16.data$Lg, sd)
tapply(mlb16.data$BA, mlb16.data$Lg, mean)
tapply(mlb16.data$BA, mlb16.data$Lg, sd)

# Part E: Describe any differences or similarities between the leagues. 

