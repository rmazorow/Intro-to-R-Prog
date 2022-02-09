# VECTOR INTRO
# Numeric vector
a <- c(3, 3.1, 3.14, pi, -pi, cos(pi))

# Character vector
b <- c("I", "Love", "Pie")

# Logical vector
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

# Display values
a
b
c

# With mixed vector with character, becomes character vector
d <- c(2, 3, "J", TRUE)
# can use typeof() to check
typeof(d)                                   # returns character
typeof(8)                                   # returns double
typeof(5L)                                  # returns integer
typeof(1 > 3)                               # returns logical
is.double(5L)                               # returns FALSE

# mode() will tell variable type: numerical, logical, or character
mode(5)                                     # returns numerical
mode(5L)                                    # returns numerical
mode(TRUE)                                  # returns logical
mode("Hello")                               # returns character

# Vectors can be created using sequences ( : or seq() )
e <- 1:15
f <- seq(from = 1, to = 15, by = 2)         # 1-15 increments of 2
g <- seq(from = 1, to = 15, length.out = 8) # 1-15 with length 8

# Calling vector elements
b[2]                                        # call 2nd element of b
a[ c(2,4) ]                                 # create numeric vector and call both elements
b[-3]                                       # displays sub-vector excluding 3rd entry

# Logical vectors can result from actions on numerical or character vectors
logic1 <- a > 2
logic1                                      # returns TRUE  TRUE  TRUE  TRUE FALSE FALSE

# MATRIX INTRO
# By default, matrix fills by columns
h <- matrix(1:20, nrow=5, ncol=4)
h

# To fill by rows, make byrow = TRUE
i <- matrix(1:20, nrow=5, ncol=4, byrow=TRUE)
i

# You can further specify values or dimension names
cells <- c(1, 26, 24, 68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
j <- matrix (cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames,cnames))
j

# elements can be called individually or by row or column
j[1,2]                                    # returns 26
j[,2]                                     # returns 2nd column
j[1,]                                     # returns 1st row