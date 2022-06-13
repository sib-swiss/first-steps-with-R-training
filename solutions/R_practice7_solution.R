# First Steps in R, Practice 7

# Import the mouse data from the file mice_data_mod.csv. 
#


# 1) Check your data frame: did it load correctly? Make sure genotype and diet are factor variables.

getwd() # check where you are. If you didn't change anything, you will be in the folder with the .Rproj file (rpoject root)

mice_data <- read.table("course_datasets/mice_data_mod.csv", header=TRUE, sep=",") # define classes for columns

str(mice_data)


# 2) Convert genotype and diet to factor variables
# define the order of factor levels
mice_data$genotype <- factor(mice_data$genotype, levels=c("WT", "KO"))
mice_data$diet <- factor(mice_data$diet, levels=c("CHOW", "HFD"))

#

# 3) Plot an histogram of mouse weight and customize it with colours, labels, title and represent the density line on top.
hist(mice_data$weight,
     freq=FALSE, breaks=8,
     main="Mouse Weight",
     col="orange" ,
     xlab="weight")
lines(density(mice_data$weight), col='blue')
# Note: freq=FALSE makes the histogram density based, which makes it scale well with the density line


# 4) Make a scatter plot of respiratory rate against mouse weights using the function plot().
#    Function arguments:
#     - use solid circles as plotting symbol
#     - add a title
#     - customise the axis labels  (“Weight [g]”, “Respiratory Rate [bpm]”)
#     - colour the points by genotype. 
# Add a legend for the genotype.


plot(mice_data$weight,mice_data$respiratoryRate, 
     pch=19,
     main="Respiratory Rate vs Weight in Mice",
     xlab="Weight [g]", ylab="Respiratory Rate [bpm]",
     col=c("orange", "blue")[mice_data$genotype]
     )

legend("bottomright",
       legend=levels(mice_data$genotype),
       col=c("orange","blue"),
       pch=19)

abline(lm(mice_data$respiratoryRate ~ mice_data$weight),
       col="black", lwd=1.5)

# 5) Make boxplots of weights from WT and KO mice. Customize with title, labels, colors.

boxplot(weight ~ genotype, data= mice_data,
        col=c("orange", "blue"),
        main="Mouse Weight by Genotype"
)
points(weight ~ genotype, data= mice_data)


# 6) Optional: Repeat 4 with diet instead of genotype.


plot(mice_data$weight,mice_data$respiratoryRate, 
     pch=19,
     main="Respiratory Rate vs Weight in Mice",
     xlab="Weight [g]", ylab="Respiratory Rate [bpm]",
     col=c("darkred", "goldenrod")[mice_data$diet]
)

legend("bottomright",
       legend=levels(mice_data$diet),
       col=c("darkred","goldenrod"),
       pch=19)

abline(lm(mice_data$respiratoryRate ~ mice_data$weight),
       col="black", lwd=1.5)

# 7) Optional: Repeat 5 with diet instead of genotype.

boxplot(weight ~ diet, data= mice_data,
        col=c("darkred", "goldenrod"),
        main="Mouse Weight by Diet"
)
points(weight ~ diet, data= mice_data)