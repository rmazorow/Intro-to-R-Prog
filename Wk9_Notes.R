# Rocky Mazorow
# 3/23/2022

# CONFIDENCE INTERVAL

# Previously we discussed point estimates: sample mean, proportion, and standard deviation
# A Confidence Interval is an interval estimate (range of values likely (by error) to contain a population parameter)
#    interval estimate = point estimate +- margin of error
#    margin of error = critical value * standard error
#    confidence interval = [lower bound, upper bound]

# How to calculate:
#    1) Compute point estimate (sample mean = xBar)
#    2) Compute sample deviation (s) or population deviation (sigma)
#    3) Find critical value that corresponds to confidence level = z or t
#    4) Compute margin of error
#    5) Construct confidence interval
#    6) Interpret the estimate in context of the situation

# Z-Scores for Commonly Used Confidence Intervals
#    Desired Confidence Interval    Z Score
#              90%                   1.645
#              95%                   1.96
#              99%                   2.576



# CI for when sigma is known (know population sd)
#   CI = xBar +- z_(1-alpha/2) * (sigma/sqrt(n))

# Example 1: Suppose scores on exams in statistics are normally distributed with an unknown population mean and 
# a population standard deviation of 3 points. A random sample of 36 scores is taken and gives a sample mean 
# (sample mean score) of 68. Find a 90% confidence interval for the true (population) mean exam score (the mean score
# on all exams).
n <- 36
xBar <- 68
sigma <- 3
margin <- qnorm(0.95)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound                               # 67.17757
uBound                               # 68.82243

# Example 2: The sample mean weight of a random sample of 25 turtles is 300 with a population standard deviation of 
# 18.5. Find a 95% confidence interval for the population mean.
n <- 25
xBar <- 300
sigma <- 18.5
margin <- qnorm(0.975)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound                               # 292.7481
uBound                               # 307.2519



# CI for when sigma is unknown (only know sample sd)
#   CI = xBar +- t_(n-1),(1-alpha/2) * (s/sqrt(n))

# Example 3: The sample mean and sample standard deviation of a random sample of 25 turtles are 300 and 20.5,
# respectively. Find a 95% confidence interval for the population mean.
n <- 25
xBar <- 300
s <- 20.5
margin <- qt(0.975,df=n-1)*s/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound                               # 291.538
uBound                               # 308.462
 
 
 
# Changing the CI or sample size
#    If we increase the percent confidence, the interval will get wider
#    If we increase the sample size, the error bound decreases (denominator), making the interval narrower
 
 # Example 4: Suppose we change Example 1 by using 95% confidence level.

n <- 36
xBar <- 68
sigma <- 3
margin <- qnorm(0.975)*sigma/sqrt(n)
lBound <- xBar - margin
uBound <- xBar + margin
lBound                               # 67.02002 compared to 67.17757
uBound                               # 68.97998 compared to 68.82243



# CI for difference in means
#   CI = (xBar1 - xBar2) +- t_(n1+n2-2),(1-alpha/2) * sqrt( (sp/n1) + (sp/n2) )
#   Where sp = ((n-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2)

# Example 4: The sample means and sample standard deviations of a random sample of 15 turtles each from 2 
# different species are 310 and 18.5 respectively for species 1 and 300 and 16.4 respectively for specie 2. 
# We want to estimate the difference in mean weight between the two different species. Find a 95% confidence 
# interval for the difference in mean weight.
n1 <- 15
xBar1 <- 310
s1 <- 18.5

n2 <- 15
xBar2 <- 300
s2 <- 16.4

# pooled variance
sp <- ((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2)

margin <- qt(0.975,df=n1+n2-2)*sqrt(sp/n1 + sp/n2)
lBound <- (xBar1-xBar2) - margin
uBound <- (xBar1-xBar2) - margin
lBound                               # 50.26355
uBound                               # 85.73645



# Determining sample size required to obtain specific margin of error (always round up)
#    EM = z_(1?????/2) ??? (??/ sqrt(n))
#    n = (z^2*??^2) / EM^2

# Example 5: The population standard deviation for the age of Foothill College students is 15 years. If we 
# want to be 95% confident that the sample mean age is within 2 years of the true population mean age of 
# Foothill College students , how many randomly selected Foothill College students must be surveyed?
sigma <- 15
EM <- 2
z <- qnorm(0.975)
n <- (z^2 * sigma^2) / EM^2
n                                    # 216.0821



# CI for proportion
#   CI = p +- z*( sqrt(p(1-p)/n) )

# Example 6: In a study, it was established that 56 out of 100 randomly selected residents in Milwaukee 
# county were in support of a certain law. Find a 95% confidence interval for the true proportion of 
# residents in the county who are in favor of the law.
n <- 100
p <- 56/n
margin <- qnorm(0.975)*sqrt(p*(1-p)/n)
lBound <- p - margin
uBound <- p + margin
lBound                               # 0.4627099
uBound                               # 0.6572901



# CI for difference in proportion
#   CI = (p1-p2) += z * sqrt( (p1*(1-p1)/n1) + (p2*(1-p2)/n2) )

# Example 7: We randomly sampled 100 residents each from Milwaukee county and Racine county to estimate 
# the difference in the proportion of residents that support a certain law. In Milwaukee, 55 out of the 
# 100 residents supports the law while in Racine, 46 out of the 100 sampled residents supports the law. 
# Find a 95% confidence interval for the true proportion of residents who support the law between the counties.
n1 <- 100
p1 <- 55/n1

n2 <- 100
p2 <- 46/n2

# Calculate margin of error
margin <- qnorm(0.975)*sqrt(p1*(1-p1)/n1 + p2*(1-p2)/n2)
lBound <- (p1-p2) - margin
uBound <- (p1-p2) + margin
lBound                               # -0.04802099
uBound                               # 0.228021



# Determining sample size in case of proportion (always round up)
#    EM = z_(1-alpha/2) ??? sqrt( p*(1-p) / n)
#    n = (z^2*p*(1-p)) / EM^2

# Example 8: Suppose a mobile phone company wants to determine the current percentage of customers aged
# 50+ that use text messaging on their cell phone. How many customers aged 50+ should the company survey 
# in order to be 90% confident that the estimated (sample) proportion is within 3 percentage points of 
# the true population proportion of customers aged 50+ that use text messaging on their cell phone.
EM <- 0.03
z <- qnorm(0.95)
p <- 0.5                             # not explicitly states, but gives the largest possible product
n <- (z^2 * p*(1-p)) / EM^2
n                                    # 751.5398
