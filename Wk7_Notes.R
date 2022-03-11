# Rocky Mazorow
# March 9, 2022

# SAMPLING DISTRIBUTIONS

# Parameters:
#    Statistic - mean (mu), proportion, standard deviation (sigma)
#    Sampling variability - observed value of statistic depends on particular sample selected from population and will vary from sample to sample
#    Sampling distribution - probability distribution of a certain statistic based on random samples from a single population

# Example of variability: Age of students in the MSSC
#    10 ages collected with mean of 21
#    10 ages collected with mean of 20
#    10 ages collected with mean of 19
#    10 ages collected with mean of 25

# The data set CEO_Salary_2012.csv contains the annual salary (in $Million) information of 497 CEO’s in 2012
ceo.data <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/data/CEO_Salary_2012.csv", header = TRUE)
str(ceo.data)

#    Evaluate parameters of annual salary
mu <- mean(ceo.data$Annual.pay)          # 10.53906
sigma <- sd(ceo.data$Annual.pay)         # 11.46751
summary(ceo.data$Annual.pay)             # Min: 0.16, 1st: 3.91, Med: 6.97, Mean: 10.54, 3rd: 13.37, Max: 131.19 

#    Shape of population is skewed to the right (some CEO have very large salaries compared to others)
hist(ceo.data$Annual.pay, main="CEO Salary in 2012", xlab='Salary($Mil)')


# SAMPLING VARIABILITY
#    Select 3 random samples of 5 CEOs and collect mean and standard deviation
set.seed(123456)
s1 <- sample(ceo.data$Annual.pay,5)
xbar1 <- mean(s1)                        # 13.88
sd1 <- sd(s1)                            # 8.57

s2 <- sample(ceo.data$Annual.pay,5)
xbar2 <- mean(s2)                        # 8.16
sd2 <- sd(s2)                            # 0.92

s3 <- sample(ceo.data$Annual.pay,5)
xbar3 <- mean(s3)                        # 20.52
sd3 <- sd(s3)                            # 25.45


# SAMPLING DISTRIBUTION
#    Generate 1000 random samples each of size 5 and compute the sample means and sample standard deviations
nn <-  1000
ss <- matrix(NA, nrow=5, ncol=nn)
for (j in 1:nn) ss[,j] <- sample(ceo.data$Annual, 5)
sn5 <- apply(ss, 2, mean)

mu.xbar <- mean(sn5)
c(mu, mu.xbar)                          # True mean: 10.53906, Sample mean: 10.60135

std.xbar <- sd(sn5)
c(sigma, std.xbar)                      # True st: 11.467507, Sample st: 5.175263
sigma/sqrt(5)

#    The shape is skewed to the right similar to, although not as pronounced, as the histogram of the population salary
hist(sn5,main = "Sample Mean (Size n= 5) Salary Distribution ",xlab = "Sample Mean Salary ($Mil)")

# As you increase sample size, population starts to look more normal
#     Centered at the true population mean
#         average of the sample mean = true sample mean
#     The spread of the sampling distribution (width of the histograms) decreases with increasing sample size
#         standard deviation of the sample mean = standard deviation / sqrt (sample size)
# Central Limit Theorem: If the sample size n is sufficiently large, the sampling distribution of the sample mean can be approximated by the normal distribution
#     The usual cut-off for a large sample size is n=30

#    When a sample of 50 CEO’s is randomly selected from the data ceo_salary, we can compute the following:
#        probability that the sample mean salary is below $11 Mil =  61.19%
pnorm(q = 11, mean = mu, sd = sigma/sqrt(50))
#        probability that the sample mean salary is between $10 Mil and $11 Mil = 24.21%
pnorm(q = 11, mean = mu, sd = sigma/sqrt(50)) - pnorm(q = 10, mean = mu, sd = sigma/sqrt(50))


# SAMPLE PROPORTION
#    The distribution of sample proportions is known as the sampling distribution of the proportion and has the following properties:
#        μp = P
#        σp = sqrt( P(1−P) / n )
#    where p is sample proportion, P is population proportion, and n is the sample size

#    The properties stated above are valid if the sampling distribution is approximately normal.
#    The sampling distribution of a sample proportion is approximately normal if the expected number of successes and failures are both at least 10.
#    That is n∗P≥10 (success) and n∗(1−P)≥10 (failure)

# Again, we can compute sample standard deviations and visualize the distribution of the sampling distributions.
#     In general, when samples of size n are taken from a normal distribution with population variance σ2,
#     the sampling distribution of the (n−1)*S^2/σ^2 has a chi-square distribution with n−1 degrees of freedom.
#     We can then compute probabilities using qchisq()
draws = matrix(rnorm(1000 * 6, 0, 3), 6)        # 1000 samples each with size 6 (σ =3)
drawvar = apply(draws, 2, var)                  # Find variance of each column

draws = 5 * drawvar/9                           # Use formula to solve for draw (σ = 3, so σ^2 = 9)

# Take 200 samples from 1 to 20
hist(draws, breaks = 20, prob = TRUE, main = "standard distribution for sample variance")
v = seq(0, max(draws), length = 200)
lines(v, dchisq(v, 5), lty = 2, lwd = 2)

# Can use pchisq() to compute probabilites


