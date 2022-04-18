# Rocky Mazorow
# 3/30/2022

# HYPOTHESIS TESTING

# A hypothesis test is a formal statistical test we use to reject or fail to reject a statistical hypothesis.

# To test whether a statistical hypothesis about a population parameter is true, we obtain a random sample from the 
# population and perform a hypothesis test on the sample data.
# There are two types of statistical hypotheses:
#    - The null hypothesis, denoted as H0, is the hypothesis that the sample data occurs purely from chance.
#    - The alternative hypothesis, denoted as H1 or Ha, is the hypothesis that the sample data is influenced by some 
#      non-random cause.

# There are 5 steps for testing:
#    0. Gather sample data. 
#    1. State the hypotheses: State the null and alternative hypotheses. These two hypotheses need to be mutually 
#       exclusive, so if one is true then the other must be false.
#    2. Determine a significance level to use for the hypothesis: Decide on a significance level. Common choices are 
#       .01, .05, and .1.
#    3. Find the test statistic: Find the test statistic and the corresponding p-value. Often we are analyzing a 
#       population mean or proportion and the general formula to find the test statistic is: 
#       (sample statistic – population parameter) / (standard deviation of statistic)
#    4. Reject or fail to reject the null hypothesis: Using the test statistic or the p-value, determine if you can 
#       reject or fail to reject the null hypothesis based on the significance level. The p-value tells us the 
#       strength of evidence in support of a null hypothesis. If the p-value is less than the significance level, we 
#       reject the null hypothesis.
#    5. Interpret the results: Interpret the results of the hypothesis test in the context of the question being asked.

# Rejection Region (RR): A rejection region specifies the range of values that the test statistic x might assume that 
# would lead to rejection of H_0.
#    Note: The “equal” sign is always included in the null hypothesis, whether it is =,≥, or ≤.

# A statistical hypothesis can be one-tailed or two-tailed.
#    - A two-tailed test is a hypothesis test where the rejection region lies in both the lower or upper tail of the 
#      sampling distribution. It involves making an “equal to” or “not equal to” statement.
#    - A one-tailed test is a hypothesis test where the rejection region lies either the lower or upper tail of the 
#      sampling distribution. It involves making a “greater than” or “less than” statement.
#          - A lower-tailed test is a hypothesis test where the rejection region lies in lower tail of the sampling 
#            distribution. It involves making a “greater than” statement.
#          - An upper-tailed test is a hypothesis test where the rejection region lies in upper tail of the sampling 
#            distribution. It involves making a “less than” statement.



# ONE SAMPLE T-TEST

# Step 1: State Hypothesis
#    H_0: µ = µ_0 (population mean is equal to some hypothesized value µ_0)
#    H_1(two−tailed): µ != µ_0 (population mean is not equal to some hypothesized value µ_0)
#    H_1(left−tailed): µ < µ_0 (population mean is less than some hypothesized value µ_0)
#    H_1(right−tailed): µ > µ_0 (population mean is greater than some hypothesized value µ_0)

# Step 2: Determine significance level (.01, .05, and .1)

# Step 3: Calculate Test Statistic
#    We use the following formula to calculate the test statistic t:
#        t = (x_bar − µ) / (s / sqrt(n))
#    where:
#        x_bar: sample mean
#        µ: hypothesized population mean
#        s: sample standard deviation
#        n: sample size

# Step 4: Reject or Fail to Reject Null Hypothesis
#    If the p-value that corresponds to the test statistic t with (n−1) degrees of freedom is less than your chosen 
#     significance level (common choices are 0.10, 0.05, and 0.01) then you can reject the null hypothesis.
  
# One Sample t-test: Assumptions
# For the results of a one sample t-test to be valid, the following assumptions should be met:
#    - The variable under study should be either an interval or ratio variable.
#    - The observations in the sample should be independent.
#    - The variable under study should be approximately normally distributed.
#    - You can check this assumption by creating a histogram and visually checking if the distribution has roughly a 
#      “bell shape.”
#    - The variable under study should have no outliers.
#    - You can check this assumption by creating a boxplot and visually checking for outliers.

# Example 1: Suppose we want to know whether or not the mean weight of a certain species of turtle is equal to 310 
# pounds. To test this, will perform a one-sample t-test at significance level alpha = 0.05.
# Step 0
n <- 40 
mu <- 310
xbar <- 300  
s <- 18.5
# Step 1: H_0: µ = 310  (population mean is equal to 310 lbs) H_1: µ != 310 (population mean is not equal to 310 lbs)
# Step 2: alpha = 0.05
# Step 3
t = (xbar - mu)/(s/sqrt(n))
t                                # -3.418679
# Step 4
#    We can make a decision using the Rejection Region
qt(0.975, n-1)                   # To determine quantile locations or two-tail with 95% CI: -2.022691, +2.022691
#    OR we can make a decision using the p-value
pval <- pt(t,n-1)*2              # multiply by 2 to get both tails (since symmetric)
pval                             # 0.001486611
# Step 5: 
# We have sufficient evidence to say that the mean weight of this species of turtle is not equal to 310 pounds.
#    Since t < lower quantile, we reject the null hypothesis.
#    Since this p-value is less than our significance level alpha = 0.05, we reject the null hypothesis.



# TWO SAMPLE T-TEST

# A two sample t-test is used to determine whether or not two population means are equal.
#    Suppose we want to know whether or not the mean weight between two different species of turtles is equal. Since 
#    there are thousands of turtles in each population, it would be too time-consuming and costly to go around and 
#    weigh each individual turtle.
#    Instead, we might take a simple random sample of 15 turtles from each population and use the mean weight in each
#    sample to determine if the mean weight is equal between the two populations:

# Step 1: State Hypothesis
#    H_0: µ = µ_0 (the two population means are equal)
#    H_1(two−tailed): µ != µ_0 (the two population means are not equal)
#    H_1(left−tailed): µ < µ_0 (population 1 mean is less than population 2 mean)
#    H_1(right−tailed): µ > µ_0 (population 1 mean is greater than population 2 mean)

# Step 2: Determine significance level (.01, .05, and .1)

# Step 3: Calculate Test Statistic
#    We use the following formula to calculate the test statistic t:
#        t = (x1_bar − x2_bar) / (s_p / sqrt(1/n1 + 1/n2))
#    where:
#        x1_bar and x2_bar are the sample means
#        n1 and n2 are the sample sizes
#        s_p = sqrt( ((n1−1)*s1^2 + (n2−1)*s2^2) / (n1+n2-2))
#        s1^2 and s2^2 are the sample variance

# Step 4: Reject or Fail to Reject Null Hypothesis
#    If the p-value that corresponds to the test statistic t with (n1+n2−1) degrees of freedom is less than your 
#    chosen significance level (common choices are 0.10, 0.05, and 0.01) then you can reject the null hypothesis.

# One Sample t-test: Assumptions
# For the results of a one sample t-test to be valid, the following assumptions should be met:
#    - The variable under study should be either an interval or ratio variable.
#    - The observations in the sample should be independent.
#    - The variable under study should be approximately normally distributed.
#    - You can check this assumption by creating a histogram and visually checking if the distribution has roughly a 
#      “bell shape.”
#    - The variable under study should have no outliers.
#    - You can check this assumption by creating a boxplot and visually checking for outliers.

# Example 2: Suppose we want to know whether or not the mean weight between two different species of turtles is equal. 
# To test this, will perform a two sample t-test at significance level alpha = 0.05.
# Step 0
#    sample 1
n1 <- 40
xbar1 <- 300
s1 <- 18.5
#    sample 2
n2 <- 38
xbar2 <- 305
s2 <- 16.7
# Step 1: H_ 0: µ_1 = µ_2 (the two population means are equal) and H_1: µ_1 != µ_2 (the two population means are not equal)
# Step 2: alpha = 0.05
# Step 3
sp <- sqrt(((n1-1)*s1^2 +  (n2-1)*s2^2)/(n1+n2-2))     # calculate the pooled standard deviation sp
sp                                                     # 17.64663
t <- (xbar1 - xbar2) / (sp* (sqrt(1/n1 + 1/n2)))
t                                                      # -1.250785
# Step 4
pval <- pt(t,n1+n2-2)*2
pval                                                   # 0.21485
# Step 5: 
# We do not have sufficient evidence to say that the mean weight of turtles between these two populations is different.
#    Since this p-value (0.21485) is not less than our significance level α=0.05, we fail to reject the null hypothesis.



# WELCH T-TEST

# When we want to compare the means of two independent groups, we can choose between using two different tests:
#    - Student’s t-test: this test assumes that both groups of data are sampled from populations that follow a normal
#      distribution and that both populations have the same variance.
#    - Welch’s t-test: this test assumes that both groups of data are sampled from populations that follow a normal 
#      distribution, but it does not assume that those two populations have the same variance.
# There are two differences in how the Student’s t-test and Welch’s t-test are carried out:
#    - The test statistic
#    - The degrees of freedom

# Example 3: Perform a Welch’s t-test on the following two samples to determine if their populations means differ 
# significantly at a significance level of 0.05:
#    - Sample 1: 14, 15, 15, 15, 16, 18, 22, 23, 24, 25, 25
#    - Sample 2: 10, 12, 14, 15, 18, 22, 24, 27, 31, 33, 34, 34, 34
# Step 0
#    sample 1
sample1 <- c(14, 15, 15, 15, 16, 18, 22, 23, 24, 25, 25)
n1 <- length(sample1)
xbar1 <- mean(sample1)
s1 <- sd(sample1)
#    sample 2
sample2 <- c(10, 12, 14, 15, 18, 22, 24, 27, 31, 33, 34, 34, 34)
n2 <- length(sample2)
xbar2 <- mean(sample2)
s2 <- sd(sample2)
# Step 1: H_ 0: µ_1 = µ_2 (the two population means are equal) and H_1: µ_1 != µ_2 (the two population means are not equal)
# Step 2: alpha = 0.05
# Step 3
df <- (s1^2/n1 + s2^2/n2)^2 / (((s1^2/n1)^2/(n1-1))+((s2^2/n2)^2/(n2-1)))     # calculate the pooled standard deviation sp
df                                                     # 18.13738
t <- (xbar1 - xbar2) /  sqrt(s1^2/n1 + s2^2/n2)
t                                                      # -1.537902
# Step 4
pval <- pt(t,df)*2
pval                                                   # 0.1413355
# Step 5: 
# We do not have sufficient evidence to say that the mean between these two populations is different.
#    Since this p-value: 0.1413355 is not less than our significance level alpha = 0.05, we fail to reject the null 
#    hypothesis.

# Alternative way
t.test(sample1, sample2)

