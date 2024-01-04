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



## coloring 
data(iris)

plot(iris$Sepal.Length, 
     iris$Sepal.Width , 
     col = c('red','green','blue')[ iris$Species ] , 
     pch=19)


## coloring trick 
iris$Species
as.numeric(iris$Species)
c('red','green','blue')[ c(1,1,1,2,2,2,3,3,3) ]

c('red','green','blue')[ iris$Species ]

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



## pairplot
data(iris) #contains 4 measurements for 150 flowers from 3   species of iris (Iris setosa, versicolor and virginica)​
pairs(iris[,1:4], main="Edgar Anderson's Iris Data", 
        pch=19, col=c("red", "green3", "blue")[iris$Species]) 

iris$Species
as.numeric(iris$Species)

c('red','green','blue')[ c(1,1,1,2,2,2,3,3,3) ]

c('red','green','blue')[iris$Species]



## par

par(mfrow=c(1,2))
plot(-90:90 , (-90:90)**2 )
plot(-90:90 , (-90:90)**3 )

par(mfrow=c(2,2))
plot(-90:90 , (-90:90)**1 )
plot(-90:90 , (-90:90)**2 )
plot(-90:90 , (-90:90)**3 )
plot(-90:90 , (-90:90)**4 )

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

data(iris)
# we limit the data to 2 species
iris_f = iris[ iris$Species %in% c('versicolor','virginica') , ]
iris_f$Species = factor(iris_f$Species)

tapply( iris_f$Petal.Length ,iris_f$Species , mean )

plen_versicolor = iris_f$Petal.Length[iris_f$Species=='versicolor']
plen_virginica  = iris_f$Petal.Length[iris_f$Species=='virginica']


par(mfrow=c(2,2))
hist(plen_versicolor,
     xlab="versicolor",
     main="petal length - versicolor")
qqnorm(plen_versicolor)
qqline(plen_versicolor)

hist(plen_virginica,
     xlab="virginica",
     main="petal length - virginica")
qqnorm(plen_virginica)
qqline(plen_virginica)

dev.off()

shapiro.test( plen_versicolor )
shapiro.test( plen_virginica )


boxplot(Petal.Length ~ Species, data=iris_f, col=c("cornflowerblue", "pink"), 
        ylab="petal length", xlab="species") 
points( Petal.Length ~ Species, data=iris_f, col="black",pch = 19)

t.test(plen_versicolor,
       plen_virginica)

t.test(Petal.Length ~ Species, data=iris_f) #equivalent to the above 


test_res = t.test(Petal.Length ~ Species, 
                  data=iris_f)
names(test_res)
test_res[['p.value']]


## paired t-test

data(sleep)
head(sleep)

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
pairs(class_data[2:4] , col = class_data$Gender, pch=19 )

# create model
model_height_age <- lm(Height~Age, data=class_data)
model_height_age

plot(Height~Age, data=class_data)
abline(model_height_age , col='red')

residuals(model_height_age)

## check model assumptions
par(mfrow=c(2,2))
plot(model_height_age)

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


## model with 2 parameters


# create model
model2 <- lm(Height~Age+Gender, data=class_data)

par(mfrow=c(2,2))
plot(model2)
dev.off()
summary(model2)

plot( Height~Age, col=c('turquoise','purple')[Gender], pch=19, data=class_data  )
C = coef( model2 )
abline(a=C[1],b=C[2] , col='turquoise',lwd=2)
abline(a=C[1]+C[3],b=C[2] , col='purple',lwd=2)
legend('bottomright',c('female','male'),pch=19,lwd=2,col=c('turquoise','purple'))
