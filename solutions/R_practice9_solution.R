# First Steps in R, Practice 9

# 1) Make a multi-panel figure with the four graphics on one page, exporting the figure to a png file.
#    Set width and height arguments in the call to png() to make it look nice.





png("mice_data_plots_by_genotype.png", width=800, height=600) # png: width and height are in pixels

# we want to make 4 plots on the same panel -> 2 rows and 2 columns
par(mfrow=c(2,2))

#plot 1
hist(mice_data$weight, freq=FALSE, breaks=10, main="Mouse Weight", col='orange', xlab='weight')
lines(density(mice_data$weight), col='blue')

#plot 2
plot(mice_data$weight, main="Mouse Weight", ylab='weight', pch=19,
     col=c("orange", "blue")[mice_data$genotype])
legend('topright', legend=levels(mice_data$genotype), col=c('orange','blue'), pch=19)

#plot 3
boxplot(weight ~ genotype, data= mice_data, col=c('orange', 'blue'),
        main="Mouse Weight by Genotype"
)

#plot 4
mids <- barplot(M, main="Mouse Mean Weight", col=c('orange', 'blue'),
                names.arg=levels(mice_data$genotype), ylim=c(0, max(M+SD)))
text(mids, 2, paste0("n=", N))
arrows(mids, M-SD, mids, M+SD, code=3, angle=90, length=0.1, lwd=2)


dev.off()



# 2) Optional: Perform steps 2-5 for diet in place of genotype. (Step 2 will not change).
#    This time, make a pdf with two pages and two graphics on each page. Again, set width and height
#     arguments in the call to pdf() to make it look nice.


#another way of setting colors : use their hex value
col1='#d8b365'
col2='#1b9e77'
# got those from http://colorbrewer2.org/#type=qualitative&scheme=Dark2&n=3
# which is neat because it has colorblind safe options!


pdf("mice_data_plot_by_diet.pdf", width=6, height=10,  # pdf: size is in inches
    paper="a4")                                       # setting paper size is optional. Convenient when you want to make paper print-outs.

# we want 2 plots on the same panel
par(mfrow=c(2,1))

#plot 1
hist(mice_data$weight, freq=F, breaks=10, main="Mouse Weight", col=col1 , xlab='weight')
lines(density(mice_data$weight), col=col2)

#plot 2
plot( mice_data$weight, main="Mouse Weight" , col= c(col1,col2)[mice_data$diet], ylab='weight' , pch=19)
legend('topright', c('CHOW','HFD'), col=c(col1,col2), pch=19)

#plot 3
boxplot(weight ~ diet, data=mice_data, col=c(col1,col2), main="Mouse Weight by Diet")

#plot 4
M <- tapply(mice_data$weight, mice_data$diet, mean)
SD <- tapply(mice_data$weight, mice_data$diet, sd)
SD <- tapply(mice_data$weight, mice_data$diet, length)
mids <- barplot(M, main="Mouse Mean Weights", col= c(col1,col2), names.arg = c("CHOW","HFD"), ylim=c(0, max(M+SD) ))
arrows(mids, M-SD, mids,M+SD, code=3, angle=90, length=0.1, lwd=2)
text(mids, 3, paste0("n=", N))

dev.off()


# 3) Look at the multi-panel figures. Are your impressions about mouse weight from yesterday's exploration of data summaries confirmed by today's visualizations?
# Yes.
# Genotpye: The two genotypes (KO v WT) have very similar mean weights.
# Diet: Mice on HFD are heavier on average than mice on CHOW diet, and their weights are more variable.






