
# First Steps in R, Practice 11

# 1) Load the package MASS using library(). (You may need to install it first).
# Load the dataset Pima.tr using data(). Use ? to get an idea which variables it contains.

library(MASS)
data(Pima.tr)
?Pima.tr


#2) Hypothesis: Blood glucose level (glu) is associated with diastolic blood pressure (bp).
#   Run a linear model to test the hypothesis.

model_fit <- lm(bp~glu, data=Pima.tr)
summary(model_fit)


# the linear association between glucose and blood pressure is significant at the 0.05 alpha level
# (p = 0.000115)

# 3) Visualize the fit with a scatter plot and a trend line.
par(mfrow=c(1,1))
plot(Pima.tr$glu, Pima.tr$bp,  pch=20, xlab="blood glucose", ylab="blood pressure")
abline(model_fit, col='red' , lwd=3)

# 4) Check the assumption of normality of the residuals graphically.
par(mfrow=c(2,1))
plot(model_fit, which=1)
plot(model_fit, which=2)
# Looks quite ok
