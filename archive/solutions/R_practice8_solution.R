mice_data <- read.table("course_datasets/mice_data_mod.csv", header=TRUE, sep=",") # define classes for columns
mice_data$genotype <- factor(mice_data$genotype, levels=c("WT", "KO"))
mice_data$diet <- factor(mice_data$diet, levels=c("CHOW", "HFD"))


# 1) Plot an histogram of mouse weight and customize it with colours, labels, title and represent the density line on top.
hist(mice_data$weight,
     freq=FALSE, breaks=8,
     main="Mouse Weight",
     col="orange" ,
     xlab="weight")
lines(density(mice_data$weight), col='blue')
# Note: freq=FALSE makes the histogram density based, which makes it scale well with the density line

# 2) Make boxplots of weights from WT and KO mice. Customize with title, labels, colors.

boxplot(weight ~ genotype, data= mice_data,
        col=c("orange", "blue"),
        main="Mouse Weight by Genotype"
)
points(weight ~ genotype, data= mice_data)


# 3) Optional: Repeat 2 with diet instead of genotype.

boxplot(weight ~ diet, data= mice_data,
        col=c("darkred", "goldenrod"),
        main="Mouse Weight by Diet"
)
points(weight ~ diet, data= mice_data)