# Ex.7 extra
data(airquality)

str(airquality)
airquality$Month <- as.factor(airquality$Month)
plot(airquality$Temp,airquality$Wind, 
     pch=19,
     main="Wind speed vs Temperature",
     xlab="Temperature", ylab="Wind speed",
     col=c("orange", "blue", "brown", "pink", "darkgreen")[airquality$Month] # there are 5 months analysed here so we need 5 colors
)


# Add a legend for the months.
legend("bottomright",
       legend=levels(airquality$Month),
       col=c("orange", "blue", "brown", "pink", "darkgreen"),
       pch=19)

