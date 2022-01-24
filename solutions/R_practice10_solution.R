# First Steps in R, Practice 10

# Come back to the mice data-set stored in the "mice_data" data frame.

getwd() # check where you are
# set you working directory to an appropriate destination. note : yours will be different from mine

# by looking at the file, we can see there is a header, and the separator between fields is ","
mice_data <- read.table( "course_datasets/mice_data.csv" , header=T , sep=",",
                         colClasses=c("factor", "factor", "numeric")) # define classes for columns  )

mice_data$genotype <- factor(mice_data$genotype, levels=c("WT", "KO"))


# 1)  Considering WT mice weight and KO mice weight separately, check the assumption of normality graphically.


KO_weights = mice_data$weight[ mice_data$genotype=="KO"]
WT_weights = mice_data$weight[ mice_data$genotype=="WT"]

par(mfrow=c(2,2))

hist(KO_weights, freq=FALSE,
     xlab="KO", main="weights of KO mice")
qqnorm(KO_weights)
qqline(KO_weights)

hist(WT_weights, freq=FALSE,
     xlab="WT", main="weights of WT mice")
qqnorm(WT_weights)
qqline(WT_weights)

par(mfrow=c(1,1)) # removes setting in par


# KO mice: normality assumption seems ok

# WT mice:
# histogram - suggests no normality (but small sample size for this)
# QQ Plot - quite ok



# Welch's t-test is fairly robust if the deviation from normality is not extreme,
# so let's continue

# 2) Make an appropriate plot to visualize the mouse weights grouped by genotype.

boxplot(weight ~ genotype, data=mice_data , 
        col=c('orange','blue'),
        main="mice weight by genotype")

# 3) Perform a test to see whether the mouse weight is different between the two genotypes.
t.test(KO_weights, WT_weights) #NB : here the data is not paired : WT and KO mice are different individuals
# we do not reject HO : the is no significant difference between WT and KO mice mean weights for any reasonable significance level
# (p=0.8514)


# Alternative: Use non-parametric test
# Does not assume normally distributed data
# However, assumes the same standard deviation in all groups (while Welch's t test does not)
# Therefore, probably not better

wilcox.test(weight ~ genotype, data=mice_data)
# no significative difference between the mean weights of WT and KO mice




# 4) Repeat step 1 to 3 for the diet variable.

HFD_weights = mice_data$weight[mice_data$diet=="HFD"]
CHOW_weights = mice_data$weight[mice_data$diet=="CHOW"]

par(mfrow=c(2,2))

hist(HFD_weights, freq=FALSE,
     xlab="HFD", main="weights of HFD mice")
qqnorm(HFD_weights)
qqline(HFD_weights)

hist(CHOW_weights, freq=FALSE,
     xlab="CHOW", main="weights of CHOW mice")
qqnorm(CHOW_weights)
qqline(CHOW_weights)

par(mfrow=c(1,1))
# all seems OK

boxplot(weight ~ diet, data=mice_data, col=c('orange','blue'), main="Mouse Weight by Diet")

t.test(HFD_weights, CHOW_weights ) #NB : here the data is not paired : HFD and CHOW mice are different individuals
# we can reject HO : there is a significant difference between HFD and CHOW mice mean weights at significance level p=0.05
# (CHOW weight are on average lower)


# Out of curiosity, let's see what result we would get with the non-parametric Whitney Mann U test (implemented in wilcox.test)
wilcox.test(weight ~ diet, data=mice_data)

