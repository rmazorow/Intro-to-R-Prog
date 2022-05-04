# Rocky Mazorow
# 4/13/2022

# INTRODUCTION TO ANALYSIS OF VARIANCE (ANOVA)

# ANOVA is a statistical technique, used to study differences between two or more group means.
#    - Student t-test is used to compare 2 groups
#    - ANOVA generalizes the t-test beyond 2 groups, so it is used to compare 3 or more groups
# ANOVA test is centered on the different sources of variation in a typical variable.
# This statistical method is an extension of the t-test. It is used in a situation where the factor variable has more 
# than one group.
# ANOVA in R primarily provides evidence of the existence of the mean equality between the groups.

# Why “analysis of variance” if ANOVA is used to make inference about means of different groups?.
#    - It is called like this because it compares the “between” variance (the variance between the different groups)  
#      and the variance “within” (the variance within each group).
#    - If the between variance is significantly larger than the within variance, the group means are declared to be 
#      different. Otherwise, we cannot conclude one way or the other.
#    - The two variances are compared to each other by taking the ratio (variance_between / variance_within) and then 
#      by comparing this ratio to a threshold from the Fisher probability distribution (a threshold based on a 
#      specific significance level, usually 5%).

# Assumptions of ANOVA
#    - The observations are obtained independently and randomly from the population defined by the factor levels.
#    - The data of each factor level are normally distributed.
#    - These normal populations have a common variance. (Levene’s test can be used to check this.)

# One-way and Two-way ANOVA
#    - One-way ANOVA has one independent variable.
#      y = x1
#      Example: Testing the relationship between shoe brand (Nike, Adidas, Saucony, Hoka) and race finish times in a 
#      marathon.
#          y = race finish time
#          x1 = independent variable
#          x1 with 2 or more levels: Nike, Adidas, Saucony, Hoka
#    - Two-way ANOVA has two independent variables.
#      y = x1 + x2
#      Example: Testing the relationship between shoe brand (Nike, Adidas, Saucony, Hoka), runner age group (junior, 
#      senior, master’s), and race finishing times in a marathon.
#          y = race finish time
#          x1 and x2 = independent variables
#          x1 with 2 or more levels: Nike, Adidas, Saucony, Hoka
#          x2 with 2 or more levels: junior, senior, master’s

# Example 1: PlantGrowth Data
#    We will use the built-in R data set named PlantGrowth. 
#    It contains the weight of plants obtained under a control and two different treatment conditions.
mydata <- PlantGrowth
head(mydata)
str(mydata)
levels(mydata$group)
# If the levels are not automatically in the correct order, re-order them as follow:
mydata$group <- ordered(mydata$group,levels = c("ctrl", "trt1", "trt2"))

# Compute summary statistics by groups - count, mean, sd:
# install.packages("dplyr") for descriptive GROUP stats
library(dplyr)
# Create a table with the columns being level, count, mean, and sd
group_by(mydata, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),        # mean of each level
    sd = sd(weight, na.rm = TRUE)             # sd of each level
  )


# COMPUTE ONE-WAY ANOVA TEST
# We want to know if there is any significant difference between the average weights of plants in the 3 experimental 
# conditions.
# The R function aov() can be used to answer to this question.
# The function summary.aov() is used to summarize the analysis of variance model.

# Hypothesis Test
#    - H0: The means between groups are identical
#    - H1: At least, the mean of one group is different

# Compute the analysis of variance
# aov(independent ~ dependent, data = mydata)
res.aov <- aov(weight ~ group, data = mydata)
summary(res.aov)
# Summary of the analysis (F is group mean/residual mean; Pr(>F) is p-value)
#             Df Sum Sq Mean Sq F value Pr(>F)  
# group        2  3.766  1.8832   4.846 0.0159 *
# Residuals   27 10.492  0.3886                 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#    The p-value is less than the significance level 0.05, we reject the null hypothesis.
#    We can conclude that there are significant differences between the groups highlighted with “*" in the model summary.

# The one-way ANOVA test does not inform which group has a different mean.
# Instead, you can perform a Tukey test with the function TukeyHSD().
TukeyHSD(res.aov)
#   - The p-value for the test for difference in means between trt1-ctrl is 0.39087 which is greater than 0.05. 
#     We fail to reject H0.
#   - The p-value for the test for difference in means between trt2-ctrl is 0.1979960 which is greater than 0.05. 
#     We fail to reject H0.
#   - The p-value for the test for difference in means between trt1-trt2; 0.012<0.05. 
#     Hence we reject H0.

# Overall Summary
#    - ANOVA: We do not have sufficient evidence to conclude that averages are the same
#    - Tukey: H0: µ1 = µ0, H1: µ1 != µ0
#          trt1 - ctrl: We do not have enough evidence to reject H0
#          trt2 - ctrl: We do not have enough evidence to reject H0
#          trt1 - trt2: We have enough evidence to reject H0. There is sufficient evidence that the means are equal.

# Example 2: Poison Data
# The dataset contains 48 rows and 3 variables:
#    - Time: Survival time of the animal
#    - poison: Type of poison used: factor level: 1,2 and 3
#    - treat: Type of treatment used: factor level: 1,2 and 3
# The data is inspected and prepared before we compute the ANOVA test.
mydata1 <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv") %>%
  select(-X) %>% 
  mutate(poison=factor(poison,ordered=TRUE))
head(mydata1)
str(mydata1)
levels(mydata1$poison)
group_by(mydata1, poison) %>%
  summarise(
    count = n(),
    mean = mean(time, na.rm = TRUE),
    sd = sd(time, na.rm = TRUE)
  )
# Compute the analysis of variance
res.aov1 <- aov(time ~ poison, data = mydata1)
summary(res.aov1)
# The p-value (7.66e-05) is less than the significance level 0.05, we reject the null hypothesis.
# The averages between the poison is not the same.

# To see where difference occurs (why we fail to reject)
TukeyHSD(res.aov1)
#    - The p-value for the test for difference in means between 2-1 is 0.588 which is greater than 0.05. 
#      We fail to reject H0.
#    - The p-value for the test for difference in means between 3-1 is 0.0000971 which is less than 0.05. 
#      Hence we to reject H0.
#    - The p-value for the test for difference in means between 3-2;0.00209<0.05. 
#      Hence we reject H0
