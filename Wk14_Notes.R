# Rocky Mazorow
# 4/27/2022

# MULTIPLE LINEAR REGRESSION
# Regression describes a plane, not a line

# Review of Simple Linear Regression
# It provides a linear equation that describes the relationship of one variable y, the dependent variable, to another 
# variable x, the independent variable.
# The following steps of the simple linear regression procedure: 
#    1) Describe the research question in clear unambiguous terms.
#    2) Define the variables and describe the sample being used in the analysis.
#    3) Verify tentatively that the two variables are linearly related.
#    4) Make and inspect a residual plot.
#    5) Use the summary() function to unpack the important information from the model object.
#    6) Description, prediction, and conclusion.


# Introduction of Multiple Linear Regression

# Multiple regression is a statistical method used to understand the relationship between one dependent variable y and
# more than one independent variables x1,x2,...,xn.
# The analysis and interpretation of multiple regression are in large part the same as they are in the case of simple 
# linear regression.
# One of the differences between the two method is that in multiple regression, we no longer refer to the regression 
# line but rather the regression plane, since there are always at least two independent variables.

# The multiple regression model with k independent variable takes the form;
#    y = B0 + (B1*x1) + (B2*x2) + ... + (Bk*xk) + e
# where
#    - y is the dependent variable
#    - x1,x2,...,xk are the independent or predictor variables
#    - B0 is the y-intercept
#    - B1,B2,⋯,Bk are the partial regression coefficients
#    - e is the error term
# The estimated multiple regression equation is given by
#    y^ = b0 + (b1*x1) + (b2*x2) + ... + (bk*xk)

# We go through the six steps mentioned earlier.
#    1) Describe the research question in clear unambiguous terms.
#    2) Define the variables and describe the sample being used in the analysis.
#    3) Verify tentatively that the two variables are linearly related.
#    4) Make and inspect a residual plot.
#    5) Use the summary() function to unpack the important information from the model object.
#    6) Description, prediction, and conclusion.

# Example 1: The supervisor at Brisbane office of Meals on Wheels (MOW) would like to understand the factors 
# associated wwith the the time MOW vehicles spend on the road each day conducting client visits.
# The supervisor collects data on 18 randomly selected daily schedules in terms of;
#    - the total time a vehicle is on the road during a day of clients visits,
#    - the total distance travelled during that time,
#    - the number of clients visited.

# Step 1: We want to understand the relationship (If any) between the total daily time a MOW vehicle is on the road, 
# the total daily distance it must cover, and the number of clients visited daily.

# Step 2: Each of the 18 randomly selected schedules is drawn from the record of recently scheduled daily client 
# visits by the Brisbane MOW organization amd is specified in terms of the three variables.
#    - The variable minutes has been converted from hours for ease of analysis and subsequent interpretation.
#    - The variable kilometers is expressed in kilometers.
#    - The variable visits assumes only 3 values: 12,13,14.
brisbane <- read.csv("/Users/rmazorow/Library/CloudStorage/OneDrive-MarquetteUniversity/School Work/MSSC 5931/Intro-to-R-Prog/data/brisbane.csv", header = TRUE)
str(brisbane)

# Step 3: Here we construct and inspect a scatter plot. We can use the plot() function and do a pairwise plot. An 
# easier way will be to use the pairs() function to provide all three scatter plots simultaneously.
#    - The plot in the upper right-hand corner is a plot of the variable minutes against kilometers which appears to 
#      be positively related.
#    - The plot in the center column of the top row is a plot of the variable minutes against visits, which also 
#      appears to be positively related.
#    - Finally the plot in the second row of the right-hand column is a plot of the variable visits against kilometers,
#      which appears not related in any symmetric way.
# The extent to which independent variables are related can lead to a problem in the multiple regression formulation 
# known as multicollinearity.
#    Multicollinearity is a condition characterizing multiple regression models when some of the independent variables 
#    are correlated with one another.
#    Calculating correlation coefficients, and creating and examining scatter plots are some of the ways of checking 
#    for correlation.
pairs(brisbane, pch=19, lower.panel=NULL)
cor(brisbane$kilometers, brisbane$visits)
#    r≈−0.04  is an indication that visits and kilometers are very weakly correlated, if they are correlated at all.

# Step 4: We use the lm() to obtain the model and plot() with option which=1 to obtain the residual plot (y).
mr <- lm(minutes ~ kilometers + visits, data=brisbane)
plot(mr, which=1)
# An inspection of the residual plot confirms;
#    - there is no evidence of a nonlinear relationships (no bens, no curves, no kinks) between the residuals and 
#      predicted values of y,
#    - the variance of the residual terms around ŷ  seems to be relatively constant,
#    - there appears to be no conspicuous outliers.
# Next, we observe the QQ-plot for normality.
plot(mr, which=2)
#    Quite a number of point do not line on the line but are not veryu far from the line either. 
#    We connclude the residuals are normally distributed.

# Step 5: Use summary()
summary(mr)
# The estimated regression equation is y^ = −518.7481 + 2.8067*x1 + 43.1148*x2
#    - The intercept b0=−514.7481
#    - The partial regression coefficients on the independent variable x1=kilometers is 2.8067.
#    - The partial regression coefficients on the independent variable x2=visits is 43.1148.
#    - The multiple R-squared is reported as 0.8172. That is 81.72% of the variation in the dependent variable y can 
#      be accounted for by the variation in the two independent variables, x1 and x2.

# Step 6: Analyze
# The p-value 0.000002914 is less than α=0.05. We reject the null hypothesis and conclude the model is significant.
