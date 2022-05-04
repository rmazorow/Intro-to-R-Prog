# Rocky Mazorow
# 4/20/2022

# SIMPLE LINEAR REGRESSION

# Simple linear regression is a statistical method you can use to understand the relationship between two variables, 
# x and y.
#    One variable, x, is known as the predictor (independent) variable.
#    The other variable, y, is known as the response (dependent) variable.

# Simple linear regression provides an equation between y and x.
#    y = b0 + b1*x + e
# where:
#   - y: dependent variable,
#   - x: independent variable,
#   - b0: y-intercept,
#   - b1: regression coefficient (slope of regression line),
#   - e: error term.

# Estimated simple linear regression equation
# Rearrange: y - e = b0 + b1*x
# Let y^ = y - e
#    y^ = b0 + b1*x
#    b1 = sum[(xi- xBar)(yi - yBar)] / sum[ (xi - xbar)^2 ]
#    b0 = yBar - b1* xBar


# Example 1: For example, suppose we are interested in understanding the relationship between weight and height.
# Let weight be the predictor variable and let height be the response variable.
# Height (y) = b0 + b1 * weight (xBar)
weight <- c(140,155,159,179,192,200,212)
height <- c(60,62,67,70,71,72,75)

# We graph these two variables using a scatterplot with weight on the x-axis and height on the y-axis.
plot(weight,height)
# We observe from the scatterplot that as weight increases, height tends to increase as well.

# We use linear regression to quantify this relationship between weight and height.
# We can find the line that best “fits” our data.
# This line is known as the least squares regression line and it can be used to help us understand the 
#    relationships between weight and height.
y <- height
x <- weight
ybar <- mean(y)
xbar <- mean(x)
b1 <- sum((x-xbar)*(y-ybar))/sum((x-xbar)^2)
b1                                             # 0.2000962
b0 <- ybar - b1*xbar
b0                                             # 32.78301
# Therefore, Height^ = 32.7830059 + (0.2000962 * weight)


# Assumptions of Linear Regression
# For the results of a linear regression model to be valid and reliable, we need to check that the following four 
# assumptions are met:
#    - Linear relationship: There exists a linear relationship between the independent variable, x, and the dependent 
#      variable, y.
#    - Independence: The residuals are independent. In particular, there is no correlation between consecutive 
#      residuals in time series data.
#    - Homoscedasticity: The residuals have constant variance at every level of x.
#    - Normality: The residuals of the model are normally distributed.
# If one or more of these assumptions are violated, then the results of our linear regression may be unreliable or 
# even misleading.


# The lm() function - linear model functions
# lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and 
# analysis of covariance (although aov may provide a more convenient interface for these).
# Usage
#    lm(formula, data, subset, weights, na.action,
#        method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
#        singular.ok = TRUE, contrasts = NULL, offset, …)
# Arguments
#    - formula: an object of class "formula" (or one that can be coerced to that class): a symbolic description of the 
#      model to be fitted. The details of model specification are given under ‘Details’.
#    - data: an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) 
#      containing the variables in the model. If not found in data, the variables are taken from environment(formula),
#      typically the environment from which lm is called.
#    - subset: an optional vector specifying a subset of observations to be used in the fitting process.
#    - weights: an optional vector of weights to be used in the fitting process. Should be NULL or a numeric vector. 
#      If non-NULL, weighted least squares is used with weights weights (that is, minimizing sum(w*e^2)); otherwise 
#      ordinary least squares is used. See also ‘Details’,
#    - na.action: a function which indicates what should happen when the data contain NAs. The default is set by the 
#      na.action setting of options, and is na.fail if that is unset. The ‘factory-fresh’ default is na.omit. Another 
#      possible value is NULL, no action. Value na.exclude can be useful.
#    - method: the method to be used; for fitting, currently only method = "qr" is supported; method = "model.frame" 
#      returns the model frame (the same as with model = TRUE, see below).
#    - model, x, y, qr: logicals. If TRUE the corresponding components of the fit (the model frame, the model matrix, 
#      the response, the QR decomposition) are returned.
#    - singular.ok: logical. If FALSE (the default in S but not in R) a singular fit is an error.
#    - contrasts: an optional list. See the contrasts.arg of model.matrix.default.
#    - offset: this can be used to specify an a priori known component to be included in the linear predictor during 
#      fitting. This should be NULL or a numeric vector or matrix of extents matching those of the response. One or 
#      more offset terms can be included in the formula instead or as well, and if more than one are specified their 
#      sum is used. See model.offset.


# Example 2: Using our height and weight data,  obtain the simple linear regression model using the lm() function.
# Use the summary() to obtain R2 and p-value from the model
lm1 <- lm(height~weight)
summary(lm1)
#    The first entry of the output of summary() is a repetition of the function call that created the model.
#    The second section of the output reports the residuals.
#    The third block is named Coefficients. It contains the estimates, standard error of the estimates, test 
#    statistics and p-value.
#    The last section contains more information. Residual standard error, Multiple R-squared, Adjusted R-squared, 
#    F-statistics and its associated p-value.
# Therefore, Height^ = 32.78301 + (0.020010 * weight)


# Goodness of Fit: Coefficient of Determination, R2
# The coefficient of determination, R2, is a measure of the strength of linear association between the two variables.
# R2 is the proportion of the variance in the response (dependent) variable y that can be explained by the variation 
# in the predictor (independent) variable.
# Its value varies between 0 and 1
#    A value of 0 indicates that the response variable cannot be explained by the predictor variable at all.
#    A value of 1 indicates that the response variable can be perfectly explained without error by the predictor variable.
# Example a: an R2 of 0.2 indicates that 20% of the variance in the response variable can be explained by the 
#    predictor variable
# Example b: An R2 of 0.77 indicates that 77% of the variance in the response variable can be explained by the 
#    predictor variable
# In our previous example of the height and weight data, Multiple R-squared is 0.9311. This indicates that 93.11% of 
# the variance in height can be explained by the weight.


# Example 3: Prediction
# First, we generate the predicted values y^ and call it predicted height. (from height^ = equation)
pred_height <- fitted(lm1)
resid_height <- lm1$residuals
cbind(height, pred_height, resid_height)
# We can predict heights given new weights by using the predict.
new_weight <- data.frame(weight <- c(156,165,180,205))
predict(lm1, new_weight)


# Example 4: Create regression model for winnipeg_apt.csv
# price = b0 + b1 * sqft
apt <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/data/winnipeg_apt.csv", header = TRUE)
str(apt)
price <- apt$price
sqft <- apt$sqft

# Determine relationship between price and sqft
plot(sqft, price)
# We observe from the scatterplot that as sqft increases, price tends to increase as well.

# Obtain the simple linear regression model using the lm() function.
lm2 <- lm(price~sqft)
summary(lm2)
# Therefore, price^ = 99384.55 + (138.37 * sqft)

# Generate the predicted values y^ and call it predicted price (from price^ = equation)
pred_price  <- fitted(lm2)
resid_price <- lm2$residuals
cbind(price, pred_price, resid_price)
# We can predict heights given new weights by using the predict.
new_sqft <- data.frame(sqft <- c(180000, 200000, 235000, 300000))
p = predict(lm2, new_sqft)
p

# Plot results
plot(lm2)
#    First plot gives you Residuals vs Fitted
#        plot(lm, which=1)
#        plot(winnipeg$sqft, resid(lm1), abline(h=0),xlab="Square Feet of Living Area",ylab="Residuals",main="Winnipeg Homes: Residuals Against the Independent Variable")
#    Second plot gives you Normality of the Residuals
#        plot(lm, which = 2)
#    Third plot gives you Scale-Location
#    Fourth plot gives you Residuals vs Leverage



# INFERENCES ON THE REGRESSION SLOPE (b1)
# The fitted regression line is given by:
#    y^ = b0 + (b1 * x)
# When the assumptions of the simple linear regression model are satisfied, a confidence interval for the slope b1 
# of the population regression line has the form:
#    (estimated slope) ± (t critical value) * (standard error)

confint(lm1)  # default 95% confidence interval
##                   2.5 %      97.5 %
## (Intercept) 13902.00376 184867.0930
## sqft           61.26066    215.4742
confint(lm1, level = 0.99)  # 99% confidence interval
##                    0.5 %      99.5 %
## (Intercept) -20455.85883 219224.9556
## sqft            30.26926    246.4656

# The 99% confidence interval for the slope is (30.26926, 246.4656).
# From this interval, we clearly see that say zero is not a plausible value for the population regression slope on 
# living area of apartment as predictor of price of apartment.
# Hence, the living area of apartment has an influence on the price of apartment.

# Hypothesis testing for the slope (b1)
# The model utility test for simple linear regression is the test of
#    H0: b1 = 0
#    Ha: b1 != 0
# The null hypothesis specifies that there is no useful linear relationship between the predictor x and the response y.
# If H0 is rejected in favor of Ha, we conclude that the simple linear regression model is useful for predicting the 
# response y.

#We can use the summary() functions to see the tests statistics and p-value for the testing the slope.
summary(lm1)                                  # p-value of interaction: 0.02627

# Using a 0.1% level of significance (alpha = 0.001), we fail to reject the null hypothesis that the population 
# slope is zero.
# Based on this simple regression model, there is insufficient evidence to conclude that the living area in square 
# feet of a condominium apartment in Winnipeg is useful in predicting the price of the price of the condominium.
