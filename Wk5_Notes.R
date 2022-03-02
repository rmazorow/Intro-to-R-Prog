# Rocky Mazorow
# Feb 23, 2022

# DESCRIPTIVE STATISTICS

# ls() gives all named objects saved to environment
ls()

Species <- c("Red maple","Aspen","Hackberry","Lodgepole pine","Swamp white oak","Black cherry","Eastern white pine")
Girth <- c(8.3, 8.6, 8.8, 10.5, 10.7, 10.8, 11.0)  
Height <- c(70, 65, 63, 72, 81, 83, 66)
Volume <- c(10.3, 10.3, 10.2, 16.4, 18.8, 19.7, 15.6)
mytrees <- data.frame(Species,Girth,Height,Volume)

# str(d) gives the structure of an object (dataset)
str(mytrees) 

# summary(d) gives a statistical summary of your dataset
summary(mytrees)

# ls(d) gives all named variables of dataset
ls(mytrees)
# names(d) gives all named variables of matrix or data frame objects
names(mytrees)
# rownames(d) gives all row names of matrix or data frame objects
rownames(mytrees)
# colnames(d) gives all column names of matrix or data frame objects
colnames(mytrees)
# dimnames(d) gives all row and column names of matrix or data frame objects
dimnames(mytrees)

x <- c(2,3,5,NA,7)
# Single value output functions
max(x)                        # displays NA
max(x, na.rm = TRUE)          # na.rm means remove NA
min(x, na.rm = TRUE)          # shows minimum value in a vector
length(x)                     # gives length of the vector and includes na values
sum(x, na.rm = TRUE)          # shows the sum of the vector elements
mean(x, na.rm = TRUE)         # gives an arithmetic mean with this
median( x, na.rm = TRUE)      # shows the median value of the vector
sd(x, na.rm = TRUE)           # shows the standard deviation
var(x, na.rm = TRUE)          # shows the variance
mad(x, na.rm = TRUE)          # shows the median absolute deviation

# Multivalue output functions
log(x)                        # shows log value for each element
log(x, na.rm = TRUE)          # does not work with na.rm - generates error  
summary(x)                    # shows a summary of dataset like maximum value, minimum value, mean, etc.
quantile(x, na.rm = TRUE)     # shows the 0%, 25%, 50%, 75%, and 100% quantiles

# Cumulative commands produce an accurate result when applied to a vector of numeric data
# if applied on character data, they give error populated as a list of NA items
# the cumulative command will work till first NA and thereafter give all result as NA
cumsum(x)                     # the cumulative sum of a vector
cummax(x)                     # the cumulative maximum value
cummin(x)                     # the cumulative minimum value
cumprod(x)                    # the cumulative product
cumsum(mytrees$Species)       # generates error since character values
cumsum(mytrees$Girth)         # reports iterative sum across 7 observations

# Descriptive statistics for NUMERIC Data Frames
numtrees <- data.frame(Girth,Height,Volume)

max(numtrees)                 # returns the largest value in the data frame 
min(numtrees)                 # returns the smallest value in the  data frame
sum(numtrees)                 # returns the sum of the  data frame
fivenum(numtrees$Girth)       # returns the Tukey summary values for the  data frame
length(numtrees)              # returns the number of columns in the data frame
summary(numtrees)             # returns the summary for each column

rowMeans(numtrees)            # returns the means for each row
rowSums(numtrees)             # returns the summary for each row
colMeans(numtrees)            # returns the means for each column
colSums(numtrees)             # returns the summary for each column

# apply(X, MARGIN, FUN, ...)
#    x specifies the matrix or data frame
#    MARGIN command uses either 1 or 2, where 1 is for rows and 2 is for columns
#    replace the FUN part with your command (the function you want to apply)
apply(numtrees, 2, mean)
apply(numtrees, 1, sum)


# GRAPHICAL SUMMARIES

# Single variable plots
#     Histogram
delay <- read.csv("data/flight_delay.csv", header = TRUE) # load the data
hist(delay$Rate.per.10K.Flights)
#    Stem
stem(chickwts$weight)

# Double variable plots
#    Scatter plot
plot(delay$Delay, delay$Rate.per.10K.Flights)
#    Box plot
boxplot(chickwts$weight ~ chickwts$feed)
#    Bar plot
barplot(table(chickwts$feed))

# Multivariable plots
set.seed(525354)                       # Set seed for reproducibility
N <- 1000                              # Sample size of 1000

x1 <- rnorm(N)                         # Create variable
x2 <- x1 + rnorm(N, 0, 3)              # Create correlated variable
x3 <- 2 * x1 - x2 + rnorm(N, 0, 2)     # Create another correlated variable

data <- data.frame(x1, x2, x3)         # Combine all variables to data.frame
pairs(data)                            # Apply pairs function
