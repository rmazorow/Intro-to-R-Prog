# WORKSHEET PROBLEMS

# Problem 1
# Part A: Create vectors A and B with 3 elements. Store their sum in vector C  
vec.a <- c(2,5,3)
vec.b <- c(1,3,5)
vec.c <- vec.a + vec.b

# Part B: Create vector D with 2 elements. Add D to A. Report warning.
vec.d <- c(5,7)
vec.a + vec.d
# Generates warning "longer object length is not a multiple of shorter object length"
# R needs the same number of elements or multiples to evenly add across longer

# Part C: Add 5 to A. Report result and explain why there isn't a warning.
vec.a + 5
# Result: [1]  7 10  8
# Since 5 is only one element, it can be added to each element

# Problem 2
# Part A: Generate vector of even numbers using seq()
vec.e1 <- seq(from = 2, to = 20, by = 2)

# Part B: Generate vector of even numbers using : and algebra
vec.e2 <- 1:10 * 2

# Problem 3
# Part A: 9th element of built in 'letters' vector
letters[9]

# Part B: sub-vector of 'letters' vector containing the 9th, 11th, and 19th elements
letters[ c(9,11,19) ]

# Part C: sub-vector of 'letters' vector containing everything but last two elements
letters[ c(-25, -26)]            # or letters[1:(length(letters)-2)]
