# Rocky Mazorow
# Mar 2, 2022

# PROBABILITY DISTRIBUTIONS

# Random number generator
rnorm(1)

# DENSITY OF STANDARD NORMAL DISTRIBUTION
# The probability density function for the standard normal distribution
1/sqrt(2*pi) *exp((-(-4:4)^2/2))

# dnorm(x) function returns the density of the standard normal distribution (mean=0, standard deviation=1) at x.
# Should return the same as the above equation
dnorm(-4:4)

# We can change the mean and standard distribution
dnorm(-8:8, mean=1, sd=2)

# You can plot these distributions using curve
# x is defined in xlim in order to make multiple points
curve(dnorm(x), xlim=c(-8,8))
# add=TRUE means combine into one graph
curve(dnorm(x, mean=1, sd=2), col="red", add=TRUE)


# CUMULATIVE PROBABILITY OF STANDARD NORMAL DISTRIBUTION
# pnorm(z) function returns the cumulative probability of the standard normal distribution at Z score z.
# (the area under the standard normal curve to the left of z)
pnorm(1.65)                     # The probability of getting a Z score smaller than 1.65 is  95% (left-side tail)

# Multiple ways to find right side since curve is symmetrical (same on the left)
pnorm(-1.65)                    # The probability of getting a Z score greater than 1.65 is  4.9% (right-side tail)
1-pnorm(1.65)
pnorm(1.65,lower.tail=FALSE)


# QUANTILES OF STANDARD NORMAL DISTRIBUTION
# The qnorm() function is the inverse of the pnorm() function
# qnorm(y) returns the value x so that pnorm(x)=y.
qnorm(0.95)                     # The Z score corresponding to the 95th percentile
pnorm( qnorm(0.95) )            # To double check, should return 0.95
-qnorm(0.05)                    # Can also get right-side tail


# CHI SQUARED DISTRIBUTION

# DENSITY OF CHI SQUARED
# dchisq() requires at least 2 arguments: the value of x we want to compute the density and the degree of freedom k
# To visualize the χ2 distribution, we plot the density function using dchisq() at different degrees of freedom.
#     ylim is used to set the y-range of the plot;
#     ylab is used to change the y-axis label;
#     lty is used to change the line type (1=solid, 2=dashed, 3=dotted, 4=dash-dotted, 5=long-dashed);
#     legend() is used to display the legend.
curve(dchisq(x,1),xlim=c(0,15),ylim=c(0,0.6),ylab="Chi Square Density")
curve(dchisq(x,2),col="red",lty=2,add=TRUE)
curve(dchisq(x,3),col="blue",lty=3,add=TRUE)
curve(dchisq(x,5),col="dark green",lty=4,add=TRUE)
curve(dchisq(x,10),col="brown",lty=5,add=TRUE)
legend(12,0.55,c("k=1","k=2","k=3","k=5","k=10"),
       col=c("black","red","blue","dark green","brown"),lty=1:5)


# CUMULATIVE PROBABILITY OF CHI SQUARED
# Again, requires two arguments
# Not symmetrical, so cannot just add negative to get right-side tail
pchisq(21.78,10)                     # Left-side
1-pchisq(21.78,10)                   # Right-side
pchisq(21.78,10,lower.tail=FALSE)    # Right-side


# QUANTILES OF CHI SQUARED
qchisq(0.05,10)
qchisq(0.05,10,lower.tail=FALSE)


# STUDENT'S T DISTRIBUTION
# The probability density function for the t distribution
# Generate 105 random numbers following the t distribution with 5 df
Z <- rnorm(1e5)
W <- rchisq(1e5,5)
T <- Z/sqrt(W/5)
# Plot a histogram for the data
hist(T,breaks=100,freq=FALSE)


# DENSITY T DISTRIBUTION
hist(T, breaks=c(min(T), seq(-5,5,length.out=100), max(T)), freq=FALSE, xlim=c(-5,5))
curve(dt(x,5),col="red",add=TRUE)

# Plots the t curves with various degrees of freedom
curve(dt(x,1),xlim=c(-5,5),ylim=c(0,0.4),ylab="Student's t Density")
curve(dt(x,2),col="red",lty=2,add=TRUE)
curve(dt(x,5),col="blue",lty=3,add=TRUE)
curve(dt(x,20),col="dark green",lty=4,add=TRUE)
curve(dnorm(x),col="brown",lty=5,add=TRUE)
legend(2,0.38,c("k=1","k=2","k=5","k=20","normal curve"),
       col=c("black","red","blue","dark green","brown"),lty=1:5)



# SIMULATION
# rnorm(n, mean = 0, sd = 1): generates n standard Normal random numbers with mean 0 and standard deviation 1.
# rchisq(n,df): generates n random numbers following the χ2 distribution with df degrees of freedom.
# rt(n,df): generates n random numbers following the t distribution with df degrees of freedom.
# set.seed() ensures reproducibility of the sequence of random numbers
rnorm(10)
rnorm(10)                     # Different values because seed wasn't used

set.seed(1234)
rnorm(10)
set.seed(1234)
rnorm(10)                     # Same values because seed was used

set.seed(2819237)
x <- rnorm(1e6)
mean(x)
sd(x)
hist(x)

# sample() function draws randomly from a specified set of (scalar) objects allowing you to sample from arbitrary distributions of numbers
set.seed(12345)
sample(1:10, 4)
sample(1:10, 4)

## Doesn't have to be numbers
sample(letters, 5)

## Sample w/replacement (allows for repeating draws)
sample(1:10, replace = TRUE)
