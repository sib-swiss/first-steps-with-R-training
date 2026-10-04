# Ex.8 extra
data(airquality)

str(airquality)
airquality$Month <- as.factor(airquality$Month)
boxplot(Temp ~ Month, data= airquality,
        col=c("orange", "blue", "brown", "pink", "darkgreen"),
        main="Temperature per month"
)
points(Temp ~ Month, data= airquality)



boxplot(Wind ~ Month, data= airquality,
        col=c("orange", "blue", "brown", "pink", "darkgreen"),
        main="Temperature per month"
)
points(Wind ~ Month, data= airquality)

