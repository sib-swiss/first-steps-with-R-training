# First Steps in R, Practice 7

# Let's come back to the mice dataset stored in the "mice_data" data frame (Let’s practice – 3).
#


# 1) Check your data frame: did it load correctly? Make sure genotype and diet are factor variables.

getwd() # check where you are. If you didn't change anything, you will be in the folder with the .Rproj file (rpoject root)

mice_data <- read.table("course_datasets/mice_data.csv", header=TRUE, sep=",",
                        colClasses=c("factor", "factor", "numeric")) # define classes for columns

str(mice_data)


# genotype and diet are factor variables
# by default, factor levels are in alphabetical order
# change the order of factor levels for the genotype: put WT first, it is probably the reference
mice_data$genotype <- factor(mice_data$genotype, levels=c("WT", "KO"))

#

# 2) Plot an histogram of mouse weight and customize it with colours, labels, title and represent the density line on top.
hist(mice_data$weight,
     freq=FALSE, breaks=8,
     main="Mouse Weight",
     col='orange' ,
     xlab='weight')
lines(density(mice_data$weight), col='blue')
# freq=FALSE makes the histogram density based, which makes it scale well with the density line

# 3) Make a scatter plot of mouse weights using the function plot(), with no additional arguments.

#    Then re-do the plot by adding function arguments: Use solid circles as plotting symbol,
#    add a title, customise the y-axis label, and colour the points by genotype. Add a legend.

plot(mice_data$weight)

plot(mice_data$weight,
     main="Mouse Weight",
     ylab='weight',
     pch=19,
     col=c("orange", "blue")[mice_data$genotype]
)
legend('topright',
       legend=levels(mice_data$genotype),
       col=c('orange','blue'),
       pch=19)

