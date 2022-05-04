# Rocky Mazorow
# May 1, 2022

# HOMEWORK PROBLEMS

# Problem 1: Data from the US Federal Reserve Board (2002) on the percentage of disposable personal income required to 
# meet consumer load payments and mortgage payments for selected years are found in the data below.
debt <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/data/debt.csv", header = TRUE)

# Part A: Construct a scatterplot with a simple regression for this data set.   
# Let consumer debt be the predictor variable (xBar) and let household debt be the response variable (y).
#    y = b0 + (b1 * xBar)
consumerDebt  <- debt$Consumer_Debt
householdDebt <- debt$Household_Debt
plot(consumerDebt,householdDebt)
lm <- lm(householdDebt~consumerDebt)
abline(lm,col="red")
# An observable trend is not seen from the scatterplot.

lm
# householdDebt = 5.70386 + (0.03316 * consumerDebt)

# Part B: Check the error model assumption visually by constructing a residual plot and QQplot of the residuals. 
# Interpret what you see.  
plot(lm, which=1)
plot(lm, which=2)
# The residuals vs fitted plot reveals no obvious linear or curvilinear relationship. The variance of the residual 
# terms does not seem to be constant. Outliers are hard to detect with variance.
# The QQplot reveals most values off the line and do not appear to be normally distributed.

# Part C: Estimate the population regression slope by constructing 95% confidence interval. Give a brief 
# interpretation of the estimated slope in the context of the problem.  
confint(lm)
# The 95% confidence interval for the slope is (-0.1343205, 0.2006446). Zero is a plausible value for the population 
# regression slope on consumer debt as predictor of household debt. Hence, consumer debt has no  influence on household debt.

# Part D: Perform a hypothesis test on the regression slope, use a 5% level of significance. Given an appropriate 
# conclusion.
#    H0: b1 = 0
#    Ha: b1 != 0
summary(lm)   
# Since p-value (0.6758) > alpha (0.05), we fail to reject the null hypothesis that the population slope is zero.
# Based on this simple regression model, there is insufficient evidence to conclude that the consumer debt is useful 
# in predicting household debt.


# Problem 2: The data below contains sale price, size, and land-to-building ratio for 10 large industrial properties
saleprice <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/data/saleprice.csv", header = TRUE)

# Part A: Construct a scatterpot for `sale price versus size` and `sale price versus land-to-building ratio`. Be sure 
# to fit regression lines on the scatterplots. 
# Let sale price be the predictor variable. Let size and land-to-building ratio be the response variables.
# For this reason, I plotted sale price on the x-axis instead of sale price versus size.
price  <- saleprice$price...M.
size <- saleprice$Size..k.sq.ft.
ratio <- saleprice$Ratio
lm1 <- lm(size~price)
lm2 <- lm(ratio~price)
plot(price,size)
abline(lm1,col="red")
# We roughly observe from the first scatterplot that as price increases, size increases.
plot(price,ratio)
abline(lm2,col="red")
# We observe from the second scatterplot that as price increases, land-to-building ratio decreases.

# Part B: Use the `lm` function to estimate the equations of each regression model for `sale price versus size` and 
# `sale price versus land-to-building ratio`.  
lm1
# size = 722.34 + (93.33 * price)
lm2
# ratio = 6.7872 + (-0.1729 * price)

# Part C: Check the error model assumption visually by constructing a residual plot and QQplot of the residuals for 
# the two models.  
plot(lm1, which=1)
plot(lm1, which=2)
# The residuals vs fitted plot reveals no obvious linear or curvilinear relationship. The variance of the residual 
# terms seems to be relatively constant. There may be outliers.
# The QQplot reveals a few values off the line but mostly appears to be normally distributed.
plot(lm2, which=1)
plot(lm2, which=2)
# The residuals vs fitted plot reveals no obvious linear or curvilinear relationship. The variance of the residual 
# terms seems to be relatively constant and there appears to be one outlier.
# The QQplot reveals a few values off the line but mostly appears to be normally distributed.

# Part D: Estimate the population regression slope of each model (line) by constructing 95% confidence interval. Give 
# a brief interpretation of the estimated slope in the context of the problem.   
confint(lm1)
# The 95% confidence interval for the slope is (15.74399, 170.915). Zero is not a plausible value for the population
# regression slope on price as predictor of size.
confint(lm2)
# The 95% confidence interval for the slope is (-0.5726689, 0.2269614). Zero is a plausible value for the population 
# regression slope on price as predictor of land-to-building ratio. 
# Hence, price may have an influence on size, but not on land-to-building ratio.

# Part E: Perform a hypothesis test on the regression slope of each model (line), use a 5% level of significance. 
# Give an appropriate conclusion.
#    H0: b1 = 0
#    Ha: b1 != 0
summary(lm1)   
# Since p-value (0.02415) < alpha (0.05), we reject the null hypothesis that the population slope is zero.
# Based on this simple regression model, there is sufficient evidence to conclude that the price is useful 
# in predicting property size.
summary(lm2)   
# Since p-value (0.348) > alpha (0.05), we fail to reject the null hypothesis that the population slope is zero.
# Based on this simple regression model, there is insufficient evidence to conclude that the price is useful 
# in predicting land-to-building ratio.

