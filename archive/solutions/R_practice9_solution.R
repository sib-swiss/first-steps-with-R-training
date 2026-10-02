# First Steps in R, Practice 9

# 1) Make a multi-panel figure with the four graphics on one page, exporting the figure to a png file.
#    Set width and height arguments in the call to png() to make it look nice.

pdf("mice_data_plots_by_genotype.pdf", width=7, height=7, paper="a4") 

# we want to make 4 plots on the same panel -> 2 rows and 2 columns
par(mfrow=c(2,2))

# Plot 1
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

# Plot 2
boxplot(weight ~ genotype, data= mice_data,
        col=c("orange", "blue"),
        main="Mouse Weight by Genotype"
)
points(weight ~ genotype, data= mice_data)


# Plot 3
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

# Plot4
boxplot(weight ~ diet, data= mice_data,
        col=c("darkred", "goldenrod"),
        main="Mouse Weight by Diet"
)
points(weight ~ diet, data= mice_data)

dev.off()


# 2) Optional: Export the histogram (3 from previous exercise) to a png file. 
# Set width and height arguments in the call to png() to make it look nice.

# png: width and height are in pixels by default

png("hist_weight.png", width=800, height=600)
hist(mice_data$weight,
     freq=FALSE, breaks=8,
     main="Mouse Weight",
     col="orange" ,
     xlab="weight")
lines(density(mice_data$weight), col='blue')
dev.off()

# 3) Look at the multi-panel figure. Are your impressions about mouse weight from yesterday's exploration of data summaries confirmed by today's visualizations?
# Yes.
# Genotpye: The two genotypes (KO v WT) have very similar mean weights.
# Diet: Mice on HFD are heavier on average than mice on CHOW diet, and their weights are more variable.






