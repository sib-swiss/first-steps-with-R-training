##  basic plot

x <- 1:100
y <- log(x) + (x/100)^5
plot(x,y) # equivalent to plot(x, y, type="p")

## add elements

x <- seq(0,100, by=10)
y <- log(x) + (x/100)^5
plot(x,y)
lines(x,y+1)
points(x,y-1, type="b")

## add color and styles

plot(x, y, type="l", col="red",lwd=7)
lines(x, y+1, col="blue",lty="dashed")
points(x, y-1, type="b", pch=19)

## labels

x <- seq(0, 100, length.out=10)
y <- log(x) + (x/100)^5

plot(x,y, type="l", col="red", ylim=c(1,7), 
     xlab="The variable x", main ="x vs. y" )

lines(x, y+1, lwd=3,lty="dashed", col="blue")
points(x, y-1, type="b", pch=15)

## legend
legend(x="bottomright", 
       legend=c("red line",
                "blue line", "black line"), 
       lty=c(1,2,1), pch=c(NA,NA,19), 
       col=c("red", "blue", "black"),
       bg="gray90")


## aparte - get data for practice

## iris dataset
data(iris)
head(iris)

## generating random numbers
rnorm(10)
rnorm(10 , mean=10 , sd=2)

## histogram
x <- rnorm(10000)

hist(x, breaks=20,
       freq=FALSE,
       main="Hist",
       col="pink")


## hist + density
x <- rnorm(10000)

hist(x, freq=FALSE, 
       main="Hist", 
       col ="pink")
lines(density(x),
        col="blue", lwd=3)


library(MASS)
data(Melanoma)
head(Melanoma)

boxplot(Melanoma$thickness)


## boxplot I
boxplot(Melanoma$thickness[Melanoma$status=="1"],
        Melanoma$thickness[Melanoma$status=="2"],
        Melanoma$thickness[Melanoma$status=="3"],
        main="Thickness of melanoma per patient status",
        xlab="status", ylab="Tumour thickness",  
        names=c("1","2","3")) 
points(Melanoma$status, Melanoma$thickness,
        col="blue",pch=19) #adds the actual data points to the plot

## boxplot II
boxplot(thickness ~ status, data=Melanoma,
         main="Thickness of melanoma per patient status",
         xlab="status", ylab="Tumour thickness")
points(thickness ~ status, data=Melanoma, 
        col="blue", pch=19) #adds the actual data points to the plot


## lines
data(airquality)
plot(airquality$Wind, airquality$Ozone, pch=20,
     xlab="Wind (mph)",ylab="Ozone (ppb)")

## horizontal and vertical lines
abline(h=60, col="red", lty="dashed")
abline(v=seq(3,21,3), col="grey", lty="dotdash")

## tendency line
abline(lm(airquality$Ozone ~ airquality$Wind),
       col=2, lwd=2)

legend("topright", legend= c("measures","fitted line"),
       pch= c(20, NA), lty = c(0, 1), lwd=c(NA, 2),
       col = c(1, 2), bg = "gray90")


## pairplot
data(iris) #contains 4 measurements for 150 flowers from 3   species of iris (Iris setosa, versicolor and virginica)​
pairs(iris[,1:4], main="Edgar Anderson's Iris Data", 
        pch=21, bg=c("red", "green3", "blue")[iris$Species]) 

iris$Species
as.numeric(iris$Species)

c('red','green','blue')[ c(1,1,1,2,2,2,3,3,3) ]

c('red','green','blue')[iris$Species]

## barplot

course_data <- c(25, 35, 50, 100)
barplot(course_data, main="Number of requests for R courses", 
        names.arg=c("2011", "2012","2013", "2014"), 
        col=c("yellow", "orange","red", "blue"))


## more complex barplot
df <- data.frame(year = c("2011","2012","2013","2014", 
                          "2011","2012","2013","2014", 
                          "2011","2012","2013","2014", 
                          "2011","2012","2013","2014"),
                 city =  c("A","A","A","A", "B","B","B","B", 
                           "C","C","C","C", "D","D","D","D"),
                 nb_requests_courses = c(30,36,50,98, 26,35,54,101,
                                         28,38,51,105, 29,40,55,125))

# Check what is inside
df

mean_nb  <- tapply(df$nb_requests_courses, df$year, mean)
sd_nb    <- tapply(df$nb_requests_courses, df$year, sd)
n_values <- tapply(df$nb_requests_courses, df$year, length)
mean_nb
sd_nb
n_values


mids <- barplot(mean_nb, 
                xlab="year",ylab="Number of requests for courses", 
                ylim=c(0,120),
                col=c("yellow", "orange","red", "blue"),
                cex=1.5, cex.axis=1.5, cex.main=1.5, cex.names=1.5,
                main= "Number of requests for R")
mids

arrows(mids, mean_nb-sd_nb, # coordinates of lower point
       mids, mean_nb+sd_nb, # coordinates of upper point
       code=3,      # type of arrow: "head at both ends"
       angle=90,    # angle between shaft and head of arrow
       length=0.1,  # length of edges of arrow head
       lwd=2)       # line width


# Add text at the midpoints and at height 5 on the y-axis: number of observations​
text(x=mids, y=5, paste("n =",n_values), cex=2)





plot( rnorm(10) , rnorm(10) )
par(col="red", pch=15)
plot( rnorm(10) , rnorm(10) )

par(mar=c(5.1,4.1,4.1,5.1))     #set margins in lines
plot( rnorm(10) , rnorm(10) )
par(mai=c(2.02,0.82,0.82,0.42)) #set margins in inches
plot( rnorm(10) , rnorm(10) )

dev.off() # reset graphical changes
plot( rnorm(10) , rnorm(10) )

## multiple plot
par(mfrow=c(1,2))
x <- seq(-100, 100, 0.1)
plot(x, y=x^2, ylim = c(-10000,10000), main="quadratic")
plot(x, y=x^3, ylim = c(-10000,10000), main="cubic")

## saving to file

pdf(file="quadratic_cubic.pdf", width=7, height=4, 
    paper="a4")
par(mfrow=c(1,2),col="firebrick", pch=19)
x <- seq(-100, 100, 0.1)
plot(x, y=x^2, ylim=c(-10000,10000), main="quadratic")
plot(x, y=x^3, ylim=c(-10000,10000), main="cubic")
dev.off()


### stats ###

data(sleep)
head(sleep)

summary(sleep)

par(mfrow=c(2,2))
hist(sleep$extra[sleep$group==1],
      freq=FALSE, xlab="Drug 1",
      main=" Extra sleep on drug 1")
qqnorm(sleep$extra[sleep$group==1])
qqline(sleep$extra[sleep$group==1])

hist(sleep$extra[sleep$group==2],
      freq=FALSE, xlab="Drug 2",
      main=" Extra sleep on drug 2")
qqnorm(sleep$extra[sleep$group==2])
qqline(sleep$extra[sleep$group==2])

dev.off()

boxplot(extra ~ group, data=sleep, col=c("orange", "pink"), ylab="Extra sleep", xlab="Drug received") 
points(extra ~ group, data = sleep, col="black",pch = 19)

t.test(sleep$extra[sleep$group==1],
       sleep$extra[sleep$group==2])

t.test(extra ~ group, data=sleep) #equivalent to the above 


test_res = t.test(sleep$extra[sleep$group==1],
                  sleep$extra[sleep$group==2])
names(test_res)
test_res[['p.value']]

interaction.plot(response=sleep$extra, x.factor=sleep$group, 
                 trace.factor=sleep$ID, legend=FALSE, type="b", lty=1, pch=16, 
                 xlab="Drug received", ylab="Extra sleep")


## plotting differences 
ordered_idx_1 = order( sleep$ID[ sleep$group == 1 ] )
ordered_idx_2 = order( sleep$ID[ sleep$group == 2 ] )
extra_sleep1_ordered = sleep$extra[sleep$group==1][ordered_idx_1]
extra_sleep2_ordered = sleep$extra[sleep$group==2][ordered_idx_2]

difference = extra_sleep2_ordered - extra_sleep1_ordered

par(mfrow=c(1,2))
hist(difference, freq=FALSE,
     xlab="Difference Drug 2 - Drug 1", main="Difference in extra sleep", col="white")

qqnorm(difference, xlim=c(-5, 2), ylim=c(-5, 2))
qqline(difference)

dev.off()

t.test(extra_sleep2_ordered,
       extra_sleep1_ordered, paired=TRUE)
# equivalent to 
t.test(difference)

## non parametric alternatives

# mann Whitney U test
wilcox.test(extra~group, data=sleep) 
# for paired data : Wilcoxon Signed Rank test, 
wilcox.test(extra_sleep2_ordered,
            extra_sleep1_ordered, paired=TRUE)


## correlation and regression 

plot(iris$Petal.Length, iris$Petal.Width,
     col="red", pch=20,
     xlab="Petal Length", ylab="Petal Width")
abline(lm(iris$Petal.Width~iris$Petal.Length),
       col="black", lwd=2)

cor( iris$Petal.Length, iris$Petal.Width )
cor.test( iris$Petal.Length, iris$Petal.Width )


summary(Cnorm)
quantile(Cnorm , c(0.025,0.975))
hist(Cnorm)


## regression data
class_data <- read.csv("course_datasets/class.csv")
class_data$Gender = as.factor(class_data$Gender)
#dataset* of 19 students' measurements
summary(class_data)
pairs(class_data)

model_height_age <- lm(Height~Age, data=class_data)
model_height_age

## check model assumptions
par(mfrow=c(1,2))
plot(model_height_age, which=1)
plot(model_height_age, which=2)

dev.off()
## plot model
plot(Height~Age,data=class_data)
abline(model_height_age, col="red", lwd=2)


## when a model have >1 parameter, you may want to just plot 
## the prediction of the model vs observed values
plot( model_height_age$fitted.values , class_data$Height , 
      xlab='Height - model prediction',
      ylab ='Height - observed values')
abline(a=0,b=1,lty=2)

summary( model_height_age )

