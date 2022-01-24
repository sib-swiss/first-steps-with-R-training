# First Steps in R, Practice 8

# 1) Make boxplots of weights from WT and KO mice. Customise with title, labels, colours.

boxplot(weight ~ genotype, data= mice_data ,
        col=c('orange', 'blue'),
        main="Mouse Weight by Genotype"
)
points( weight ~ genotype, data= mice_data  )

# 2) Make a barplot of weights from WT and KO mice using the means returned by tapply().
#    Customise the barplot with title, labels, colours. 
#    Optional: Add number of observations to each bar.
#    Optional: add errors bars.

M  <- tapply(mice_data$weight, mice_data$genotype, mean)
SD <- tapply(mice_data$weight, mice_data$genotype, sd)
N  <- table(mice_data$genotype)

mids <- barplot(M,
                main="Mouse Mean Weight",
                col=c('orange', 'blue'),
                names.arg=levels(mice_data$genotype),
                ylim=c(0, max(M+SD))
)
# the ylim argument is set to ensure that the top of en error bars will be seen

# Add text at the midpoints(x) and at height 2 on the y-axis and write the number of observations
text(mids, 2, paste0("n=", N), col='white' , cex=1.5)

# Use arrows to put sd error bars on the plot
arrows(mids, M-( SD / sqrt(N) ),
       mids, M+( SD / sqrt(N) ),
       code=3, angle=90, length=0.1, lwd=2)



