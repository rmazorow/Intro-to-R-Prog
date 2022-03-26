# Rocky Mazorow
# March 25, 2022

# WORKSHEET PROBLEMS

# Problem 1: The sample mean weight of a random sample of 25 turtles is 300 with a population standard deviation of 18.5. 
# Investigate the effect of sample size on confidence interval by changing the sample size from...

# Original sample
n <- 25
xBar <- 300
sigma <- 18.5
margin <- qnorm(0.975)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound
uBound 

# Part A: 25 to 100 and finding a 95% confidence interval for the population mean.
n <- 100
margin <- qnorm(0.975)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound
uBound 

# Part B: 25 to 10 and finding a 95% confidence interval for the population mean.
n <- 10
margin <- qnorm(0.975)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound
uBound 

# As the sample size increases, the confidence interval narrows.
# As the sample size decreases, the confidence interval widens.

# Problem 2: For a class project, a political science student at a large university wants to estimate the percent of 
# students that are registered voters. He surveys 500 students and finds that 300 are registered voters. Compute a 90% 
# confidence interval for the true percent of students that are registered.
n <- 500
p <- 300/n
margin <- qnorm(0.95)*sqrt(p*(1-p)/n)
lBound <- p - margin
uBound <- p + margin
lBound * 100
uBound * 100

# We are 90% confidence that the population of registered voters is between 56.4% and 63.6%.

