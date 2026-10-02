
## 1. read the csv file course_datasets/Ruhland2016.DESeq2.results.csv
## as a data.frame, using the first row as row names.
df = read.csv("course_datasets/Ruhland2016.DESeq2.results.csv" , row.name = 1)
head( df )

## 2. Create a new column named "significant" 
## which contains the text "yes" if the adjusted p-value (column padj) is 
## below the significance threshold 0.05, and "no" otherwise
threshold = 0.05
df$significant = "no"
df$significant[ df$padj < threshold ] = 'yes'

## 3. how many genes have a significant adjusted p-value?

table( df$significant )
## 846 genes have an adjusted p-value < 0.05

## 4. What is the average of the absolute value of log-fold change? (nb: you may have to google the function to compute the absolute value)

##     a. For all genes?

mean( abs( df$log2FoldChange ) )

##     b. For significant genes only?

mean( abs( df$log2FoldChange[df$significant == 'yes'] ) )


## 5. creating a volcano plot

## a. Create a new column containing  -log10( adjusted p-value ) (it will be used for the y-axis)

df$logpajd = -log10( df$padj )

## b. basic plot: plot the log-fold change (x-axis) with -log10( adjusted p-value ) (y-axis)
plot( df$log2FoldChange , df$logpajd )

## c. adding colors: adapt the previous plot to change the pch to 19, and color in grey non-significant genes and in reed significant ones (you can use the "significant" column we created earlier)

colormap = c( 'no' = 'grey' , 'yes' = 'red' )
plot( df$log2FoldChange , df$logpajd , pch = 19 , col = colormap[ df$significant ])

## d. adding threshold line: add an horizontal dashed black line to visualize the 0.05 threshold on adjusted p-value

abline(h = -log10(threshold) , col = 'black' , lty = 'dashed') #remember to transform it into -log10

## e. beautify: add a title, axis labels, and legend

plot( df$log2FoldChange , df$logpajd , pch = 19 , col = colormap[ df$significant ],
      main = 'volcano plot',
      xlab = 'log2 Fold-Change',
      ylab = '-log10( adjusted p-value )')

abline(h = -log10(threshold) , col = 'black' , lty = 'dashed') #remember to transform it into -log10
legend( "topright" , c("no",'yes') , pch = 19 , col = c('grey','red') )



