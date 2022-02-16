# WORKSHEET 1 REVIEW

# Vector Recycling = repeat shorter vector to complete math (may not use all the same amount)
vec.a <- c(3, 8, 4)
vec.b <- c(4, 11, 7, 14)
vec.c <- c(5, 9)

vec.a + vec.c            # Warning message: longer object length is not a multiple of shorter object length

# If multiple, then all elements of shorter vector are used m times
vec.b + vec.c            # No warning

# length() returns the number of columns
length(vec.b)

# str() returns the data structure description 
str(vec.b)


# FACTOR COMMAND
# Nominal variables are data whose levels are labels or descriptions, and which cannot be ordered.
# factor() stores the nominal values as a vector of integers, which can be ordered.

# Used to convert characters into numerical
vec.char <- c("bad","neutral","good")
typeof(vec.char)       # Type character

fac <- factor(vec.char)
typeof(fac)            # Type integer

# Each level represents an integer, ordered from vec.char alphabetically
levels(fac)

# Integers show the level each elements belongs to
str(fac)

# You can set your own levels (remove alphabetical dependency)
order_fac <- factor(vec.char, levels=vec.char)
str(order_fac)


# LISTS
# Lists are an ordered collection of objects (components).
# Allows you to gather a variety of (possibly unrelated) objects under one name.

# Example of a list with 4 components: string, numeric vector, matrix, and scalar
a <- c(3, 3.1, 3.14, pi, -pi, cos(pi))
y <- matrix(1:20, nrow=5, ncol=4)
l <- list(name="Fred", mynumbers=a, mymatrix=y, age=22)
l                      # a will be sorted descending

# You can subset a list by index or component name (two ways)
l[[2]]
l[["mynumbers"]]
l$mynumbers


# MATRIX CONTINUED

# Generates a 5 x 4 numeric matrix
m1 <- matrix(1:20, nrow=5, ncol=4)
m1

# Generates a 2 x 2 numeric matrix with dimension names
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
m2 <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))
m2

# To subset matrix, use comma to separate row and column index of a matrix
# Element in 2nd row and 2nd column
m2[2, 2]
# Sub-matrix of all rows and 2nd column of matrix
m2[,2] 
# Sub-matrix of 1st row and all columns of matrix
m2[1,] 
# Sub-matrix of row 2, columns 1,2
m2[2, c(1,2)] 

# Binding Matrices
# cbind() - binds matrices by adding columns; requires same number of rows
# rbind() - binds matrices by adding rows; requires same number of columns
y1 <- matrix(1:20, nrow=5)

y2 <- matrix(1:10, nrow=5, ncol=2)
# Should have the same number of rows
y_col <- cbind(y1, y2)
y_col

y3 <- matrix(data = 21:32,nrow = 3,ncol = 4)
## Should have the same number of columns
y_row <- rbind(y1, y3)
y_row


# DATA FRAMES
# A data frame is of type list of equal-length vectors, having a 2-dimensional structure.
# Different columns can have different modes (numeric, character, factor, etc.). 

# Can be defined without column names
# Note all elements have same number of observations (4)
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
df <- data.frame(d,e,f)
df

# Column names can be included
# Realize that column names replace variable names and must match number (3)
names(df) <- c("ID","Color","Passed")
df

# Properties of data frames
# Display variales names
names(df) ## df as a list
colnames(df) ## df as a matrix

# Display number of columns
length(df) ## df as a list
ncol(df) ## df as a matrix

# Display dimensions
dim(df) ## df as a matrix

# rbind() and cbind() can be used on df
df_r <- data.frame(ID=5, Color="blue", Passed=TRUE)
df_rb <-rbind(df, df_r)
df_rb

df_c <- data.frame(Year = c("junior", "freshman","senior","sophomore"))
df_cb <- cbind(df, df_c)
df_cb

# Subsetting data frames is similar to matrices
# Select the row where Color == white
df[df$Color == "white",]

# columns 2 of data frame
df[2] 

# rows 1 and 3 
f[c(1, 3), ] 

# columns ID and Passed from data frame
df[c("ID","Passed")] 

# columns ID and Passed from data frame
df[, c("ID","Passed")] 

# variable Color in the data frame
df$Color 
