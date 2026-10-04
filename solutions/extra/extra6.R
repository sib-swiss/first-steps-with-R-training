# Ex.6 extra

#### 6b
library(MASS) # loads the library MASS
data(bacteria) # loads the bacteria data set (from MASS)

str(bacteria)
table(bacteria$y, bacteria$ap)
table(bacteria$y, bacteria$trt)


####6c

y_yes <- bacteria$y =="y"
bacteria <- cbind(bacteria, y_yes)
tapply(X=bacteria$y_yes, INDEX=bacteria$week, FUN=mean)


#### Tretament by treatment
bacteria_placebo <- subset(bacteria, trt=="placebo")
bacteria_drug <- subset(bacteria, trt=="drug")
bacteria_drug_plus <- subset(bacteria, trt=="drug+")

tapply(X=bacteria_placebo$y_yes, INDEX=bacteria_placebo$week, FUN=mean)
tapply(X=bacteria_drug$y_yes, INDEX=bacteria_drug$week, FUN=mean)
tapply(X=bacteria_drug_plus$y_yes, INDEX=bacteria_drug_plus$week, FUN=mean)


### You could also use a for loop:
trt_effects <- list()
for(t in bacteria$trt){
  dftemp <- subset(bacteria, trt==t)
  res <- tapply(dftemp$y_yes, INDEX=dftemp$week, FUN=mean)
  trt_effects[[t]] <- res
}
trt_effects

