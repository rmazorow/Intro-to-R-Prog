# Rocky Mazorow
# April 4, 2022

# HOMEWORK PROBLEMS

# Problem 1: Medical research has shown that repeated interval for extensions beyond 20 degrees increases the risk of wrist and hand injuries. Each of 24 students at Cornell University used a proposed new computer mouse design, and while using the mouse, each student's wrist extension was recorded.
wrist <- data.frame(ID = 1:24, extension = c(27, 28, 24, 26, 27, 25, 25, 24, 24, 24, 25, 28, 22, 25, 24, 28, 27, 26, 31, 25, 28, 27, 27, 25))

# Part A: Compute the mean and standard deviation of the wrist extensions data above. Describe the sample using these summaries.  
xBar <- mean(wrist$extension)
sigma <- sd(wrist$extension)
# The mean is 25.92 with a standard deviation of 1.954. 

# Part B: Create a histogram of the wrist extensions. Is the normality assumption reasonable?  
hist(wrist$extension)  
# The normality assumption is not reasonable.

# Part C: Use the data to estimate the mean wrist extension for people using this new mouse design using a 97% confidence interval. Provide an interpretation of this interval.  
n <- 24
margin <- qnorm(0.985)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
# We are 97% confident that the mean wireless percentage is between 25.05 and 26.78.

# Part D: Use the data to test the hypothesis that the mean wrist extension for people using this new design is greater than 20 degrees. Use alpha = 0.01 (1%) level of significance. 
# Null  hypothesis is that µ ≤ 20
mu <- 20
t = (xBar - mu)/(sigma/sqrt(n))
pval <- pt(t, df=n-1, lower.tail=FALSE)
pval
# Since this p-value (1.447*10^-13) is less than our significance level (0.01), we reject the null hypothesis.




# Problem 2: Recall the Going Wireless data first mentioned Week 2 of this class. The article Going Wireless (AARP Bulletin, June 2009) reported the estimated percentage of house- holds with only wireless phone service (no land line) for the 50 U.S. states and the District of Columbia. In the accompanying data table, each state was also classified into one of three geographical regions—West (W), Middle states (M), and East (E). Consider only the variable `Wireless` in this data.
wireless.data <- read.csv("https://goo.gl/72BKSf", header = TRUE)
str(wireless.data)

# Part A: Compute the mean and standard deviation of the wireless data above. Describe the sample using these summaries.  
xBar <- mean(wireless.data$Wireless)
sigma <- sd(wireless.data$Wireless)
# The mean is 14.82 with a standard deviation of 5.344.

# Part B: Create a histogram of the wireless data. Is the normality assumption reasonable?  
hist(wireless.data$Wireless)  
# The normality assumption is not reasonable.

# Part C: Use the data to estimate the mean wireless percentage per state using a 90% confidence interval. Provide an interpretation of this interval.  
n <- 31
margin <- qnorm(0.95)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
# We are 90% confident that the mean wireless percentage is between 13.23 and 16.39.

# Part D: Use the data to test the hypothesis that the mean wireless percentage per state is less than 17. Use alpha = 0.05 (5%) level of significance. 
# Null  hypothesis is that µ ≥ 17
mu <- 17
t = (xBar - mu)/(sigma/sqrt(n))
pval <- pt(t, df=n-1)
pval
# Since this p-value (0.015) is less than our significance level (0.05), we reject the null hypothesis. Therefore, the mean wireless percentage per state is less than 17.
