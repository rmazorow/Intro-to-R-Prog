# Rocky Mazorow
# 4/6/2022

# HYPOTHESIS TESTING CONTINUED

# Hypothesis Testing
#    - One sample test (mean/proportion)
#    - Two sample test
#        i) Independent samples
#            a) assumed equal variance
#            b) unequal variance (Welch)
#        ii) Paired


# ONE SAMPLE T-TEST
#    1) State hypothesis
#    2) Determine significance level
#    3) Calculate test statistics
#    4) Reject or fail to reject null hypothesis
#    5) Draw conclusion

# To test mean:
#    t = (xBar - ?_0) / (s / sqrt(n))
#    p-value = pt(t, df, lower.tail=False) * 2   <-for two-tail (reject if outside region)
#            = pt(t, df, lower.tail=False)       <-for left-tail (reject if greater than)
#            = pt(t, df)                         <-for right-tail (reject if less than)

# t.test R function
# The function t.test is available in R for performing t-tests. It is in the stats package.
# Use the command ?t.test() to find out details about the function.
# The function t.test returns the test-statistic, degrees of freedom (df), p-value, alternative Hypothesis: H1, 
# confidence interval, and sample estimates.

# The syntax of the function is:
#    t.test(x, y = NULL,
#        alternative = c("two.sided", "less", "greater"),
#        mu = 0, paired = FALSE, var.equal = FALSE,
#        conf.level = 0.95, ...)

# Example 4: Test the function using data simulated from a normal distribution (one sample t-test)
set.seed(123456)
x <- rnorm(10)
ttest <- t.test(x)
ttest

#    As observed from the output of the function on the simulated data:
#        - the test-statistic is 2.3908472
#        - the p-value for this test statistic with 9 degrees of freedom is 0.0405011
#        - H1: µ != 0, xBar = 0.7934014
#        - the 95% confidence interval for the mean is (0.0427057,1.5440971).
#    Thus, since our p-value 0.0405011 is less than our significance level of 0.05 we reject the null hypothesis that 
#    the mean of the sample is equal to 0.

# Example 5: Two sample t.test. (a) unequal variance, (b) equal variance
#    (a) As observed from the output of the function on the simulated data:
#        - the test-statistic is 0.1877944.
#        - the pvalue for this test statistic with 15.9680861 degrees of freedom is 0.8534035.
#        - H1: ?1 != ?2, xBar = 0.254283, yBar = 0.1838667.
#        - the 95% confidence interval for the mean is (-0.7246035,0.8654363).
#    Thus, since our p-value 0.8534035 is greater than our significance level of 0.05 we will fail to reject the null 
#    hypothesis that the two samples have statistically significant means.
x <- rnorm(10)
y <- rnorm(10)
ttest <- t.test(x,y)
ttest
#    (b) From the output of the function on the simulated data,
#        - the test-statistic is -0.3439992.
#        - the pvalue for this test statistic with 18 degrees of freedom is 0.7348328.
#        - H1: ?1 !=?2, xBar = -0.4069668, yBar = -0.2377716.
#        - the 95% confidence interval for the mean is (-1.2025292,0.8641387).
#    Thus, since our p-value 0.7348328 is greater than our significance level of 0.05 we will fail to reject the null 
#    hypothesis that the two samples have statistically significant means.
x <- rnorm(10)
y <- rnorm(10)
ttest <- t.test(x,y,var.equal = TRUE)
ttest



# PAIRED SAMPLES T-TEST
# A paired samples t-test is a statistical test that compares the means of two samples when each observation in one 
# sample can be paired with an observation in the other sample.

# A paired samples t-test is commonly used in two scenarios:
#    1) A measurement is taken on a subject before and after some treatment, e.g. the max vertical jump of college 
#       basketball players is measured before and after participating in a training program.
#    2) A measurement is taken under two different conditions,  e.g. the response time of a patient is measured on 
#       two different drugs.

# Step 1: State Hypothesis
#    H_0: ? = ?_0 (the two population means are equal)
#    H_1(two-tailed): ? != ?_0 (the two population means are not equal)
#    H_1(left-tailed): ? < ?_0 (population 1 mean is less than population 2 mean)
#    H_1(right-tailed): ? > ?_0 (population 1 mean is greater than population 2 mean)

# Step 2: Determine significance level (.01, .05, and .1)

# Step 3: Calculate Test Statistic
#    We use the following formula to calculate the test statistic t:
#        t = x_d / (s_d / sqrt(n))
#    where:
#        x_d: sample mean of the differences                  mean(xi - yi)
#        s_d: sample standard deviation of the differences    sd(xi-yi)
#        n: sample size (i.e. number of pairs)

# Step 4: Reject or Fail to Reject Null Hypothesis
#    If the p-value that corresponds to the test statistic t with (n-1) degrees of freedom is less than your 
#    chosen significance level (common choices are 0.10, 0.05, and 0.01) then you can reject the null hypothesis.

# Assumptions
# The following assumptions are necessary for the validity of the results of a paired samples t-test.
#    - The participants should be selected randomly from the population.
#    - The differences between the pairs should be approximately normally distributed.
#    - There should be no extreme outliers in the differences.

# Example 6: Paired sample t.test
#     From the output of the function on the simulated data,
#        - the test-statistic is -0.0397854.
#        - the pvalue for this test statistic with 9 degrees of freedom is 0.9691328.
#        - H1: ?_d != 0, x_d= -0.014298.
#        - the 95% confidence interval for the mean is (-0.82727,0.7986739).
#    Thus, since our p-value 0.9691328 is greater than our significance level of 0.05 we will fail to reject the null 
#    hypothesis that the two groups have statistically significant means.
x <- rnorm(10)
y <- rnorm(10)
ttest <- t.test(x,y,paired = TRUE)
ttest



# ONE PROPORTION Z-TEST
# A one proportion z-test is used to compare an observed proportion to a theoretical one.

# Step 1: State Hypothesis
#    H_0: p = p_0 (population proportion is equal to some hypothesized population proportion p_0)
#    H_1(two-tailed): p != p_0 (population proportion is not equal to some hypothesized value p_0)
#    H_1(left-tailed): p < p_0 (population proportion is less than some hypothesized value p_0)
#    H_1(right-tailed): p > p_0 (population proportion is greater than some hypothesized value p_0)

# Step 2: Determine significance level (.01, .05, and .1)

# Step 3: Calculate Test Statistic
#    We use the following formula to calculate the test statistic z (chi-squared):
#        z = (p - p_0) / sqrt( (p_0*(1-p_0)) / n)
#    where:
#        p: observed sample proportion
#        p_0: hypothesized population proportion
#        n: sample size

# Step 4: Reject or Fail to Reject Null Hypothesis
#    If the p-value that corresponds to the test statistic z is less than your chosen significance level (common 
#    choices are 0.10, 0.05, and 0.01) then you can reject the null hypothesis.

# prop.test R function
# The function prop.test is available in R for testing the null that the proportions (probabilities of success) in 
# several groups are the same, or that they equal certain given values. It is in the stats package.
# Use the command ?prop.test() to find out details about the function

# The syntax of the function is:
#    prop.test(x, n, p = NULL,
#        alternative = c("two.sided", "less", "greater"),
#        conf.level = 0.95, correct = TRUE)
# where:
#    x: a vector of counts of successes, a one-dimensional table with two entries, or a two-dimensional table (or 
#       matrix) with 2 columns, giving the counts of successes and failures, respectively.  
#    n: a vector of counts of trials; ignored if x is a matrix or a table.  
#    p: a vector of probabilities of success. The length of p must be the same as the number of groups specified by 
#       x, and its elements must be greater than 0 and less than 1.  
#    alternative: a character string specifying the alternative hypothesis, must be one of "two.sided" (default), 
#       "greater" or "less". You can specify just the initial letter.
#    conf.level: confidence level of the returned confidence interval.  
#    correct : a logical indicating whether Yates' continuity correction should be applied where possible.

# Example 7: The student newspaper at a large business school claims that 55% of graduating students have an offer of
# employment even before they graduate. The Office of Student Affairs decided to investigate this claim to see whether
# it is true. When they carried out the survey, they found that 321 of 535 graduating students reported that they have
# a job offer. At a level of alpha=0.10, test H_0: p=0.55 against H_a: p!=0.55.
# Step 0: Gather sample data
x <- 321
n <- 535 
p0 <- 0.55
p <- x/n
# Step 1: H_0: p = 0.55, H_1: p != 0.55
# Step 2: Determine significance level
alpha <- 0.10 
# Step 3: Calculate test statistic z
z <- (p-p0)/(sqrt((p0*(1-p0))/n))
z                                # 2.324659
# Step 4: Calculate p-vaue of z
#    We can make a decision using the Rejection Region
pval <- 2*pnorm(z,lower.tail = FALSE)
pval                             # 0.02009019
# Step 5: Since p-value = 0.0200902 < alpha (0.10), we reject H_0.
# There is sufficient evidence that 55% of graduating students do not have job offers before they graduate.

# Example 8: A survey of European Union nations has found that 70% of drivers admit to having used their cellphone 
# while driving. In light of this, several EU countries have introduced measures to combat the phenomenon now referred
# to as distracted driving. After an extensive public campaign in one country intended to dissuade drivers from 
# engaging in distracted driving, a survey has found that 1190 drivers in a sample of 1776 report using their 
# cellphones to speak or text while driving. Conduct a lower-tail test at alpha=0.05 level of significance to 
# determine if the public relations effort has been successful.
# Step 0: Gather sample data
x <- 1190
n <- 1776 
p0 <- 0.7
p <- x/n
# Step 1: H_0: p >= 70, H_1: p < 70
# Step 2: Determine significance level
alpha=0.05
# Step 3: Calculate test statistic z
z <- (p-p0)/(sqrt((p0*(1-p0))/n))
z                                # -2.754739
# Step 4: Calculate p-value of z
#    We can make a decision using the Rejection Region
pval <- pnorm(z)
pval                             # 0.002936946
# ALTERNATIVELY, can skip 3 and 4 by doing:
ptest <- prop.test(x,n, conf.level = 0.95, p = p0, alternative ='t', correct = FALSE)
ptest                            # 0.670045
# Step 5: Since p-value = 0.0029369 < alpha (0.05), we reject H_0.
# We conclude that there is enough evidence that the PR campaign is working.

# Example 9:Suppose we want to know if there is a difference in the proportion of residents who support a certain 
# law in Milwaukee compared to the proportion who support the law in Racine. To test this, will perform a two 
# proportion z-test at significance level alpha=0.05 In a random sample, 34 out of 50 Milwaukee residents supports the 
# law and 29 out of 50 Racine residents supports. Is the difference statistically significant?
# Step 0: Gather sample data
n1 <- 50
n2 <- 50
x1 <- 34
x2 <- 29
p1 <- x1/n1
p2 <- x2/n2
# Step 1: H_0: p1 = p2, H_1: p1 != p2
# Step 2: Determine significance level
alpha=0.05
# Step 3: Calculate test statistic z
p <- (p1*n1 + p2*n2)/(n1+n2) ## pooled proportion
z <- (p1-p2)/sqrt(p*(1-p)*(1/n1 + 1/n2))
z                                # 1.035616
# Step 4: Calculate p-value of z
pval <- pnorm(z,lower.tail=FALSE)*2
pval                             # 0.3003812
# Step 5: Since p-value=0.3003812 > alpha = 0.05, we fail to reject H_0.
# We do not have sufficient evidence to say that the proportion of residents who support this law is different 
# between the two counties.
x <- c(x1,x2)
n <- c(n1,n2)
ttest <- prop.test(x,n, conf.level = 0.95,correct = FALSE)
ttest
