# Rocky Mazorow
# April 12, 2022

# HOMEWORK PROBLEMS

# Problem 1: While campaigning for higher political office during a recent election, a certain candidate claimed that "at
# least 75% of voters want the country to end all foreign aid to all countries." When a polling organization conducted a
# survey to investigate this claim, they found that 242 out of a sample of n = 346 expressed agreement with the statement. 
# At a level of alpha = 0.02, use the five-step framework to test H_0: p >= 0.75 against H_1: p < 0.75. What is the p-value? 

# Step 0: Gather sample data
x = 242
n = 346 
p0 = 0.75
p = x/n

# Step 1: H_0: p >= 0.75 and H_1: p < 0.75

# Step 2: Significance level
alpha = 0.02

# Step 3: Calculate test statistic z
z <- (p-p0)/(sqrt((p0*(1-p0))/n))
z                                # -2.172698

# Step 4: Calculate p-value of z
pval <- pnorm(z)
pval                             # 0.01490153

# Alternate way
ptest <- prop.test(x,n,conf.level = 0.95, p = p0,alternative ='l',correct = FALSE)
ptest                            # 0.01490153

# Step 5: Draw a conclusion
# Since p-value (0.015) < alpha (0.02), we reject H_0.
# There is sufficient evidence that at least 75% of voters want the country to end all foreign aid to all countries.



# Problem 2: After the 2012 US Presidential election in which Barack Obama was reelected for his second term in office, 
# there was considerable discussion about the "gender gap" that existed between male and female voters in terms of their 
# choice of candidate. A survey group explored this issue after the election by conducting a poll of voting behavior 
# among n=2551 voters. The results of their finding based on an exit poll is presented in the table below. At a level of 
# alpha = 0.05, use the five-step framework to test the null hypothesis that the proportion of women and men voting for 
# Obama in 2012 is the same. 
d <- cbind(Name = c("Obama","Romney","Totals"), Men = c(558,658,1214), Women = c(749,588,1337), Totals=c(1307,1244,2551))
# at most 4 decimal places
knitr::kable(d, digits = 4)

# Step 0: Gather sample data
n1 <- 1214                       # men
n2 <- 1337                       # women
x1 <- 558
x2 <- 749
p1 <- x1/n1
p2 <- x2/n2

# Step 1: H_0: p1 = p2, H_1: p1 != p2

# Step 2: Determine significance level
alpha = 0.05

# Step 3: Calculate test statistic z
p <- (p1*n1 + p2*n2)/(n1+n2)
z <- (p1-p2)/sqrt(p*(1-p)*(1/n1 + 1/n2))
z                                # -5.075266

# Step 4: Calculate p-value of z
pval <- pnorm(abs(z),lower.tail=FALSE)*2
pval                             # 3.869549e-07

# Alternate way
x <- c(x1,x2)
n <- c(n1,n2)
ttest <- prop.test(x,n,conf.level = 0.95,correct = FALSE)
ttest

# Step 5: Draw a conclusion
# Since p-value (3.87x10^-7) < alpha (0.05), we reject H_0.
# There is sufficient evidence that the proportions of women and men voting for Obama in 2012 is not the same. 
