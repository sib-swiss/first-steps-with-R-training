
#10)Install and load the package MASS (or other CRAN packages).
install.packages("MASS")
library(MASS)


#2) The following command line loads the bacteria data.frame present in the MASS package. Execute it:

data(bacteria)

#4) What are the names of the columns of the bacteria data.frame ?

names(bacteria)

#5) Use the [] , to select in bacteria rows 100 to 119 in the “trt” column.

bacteria[ 100:119 , 'trt' ]

#Optional : 5) use comparison operators to count how many rows correspond to a “placebo” treatment (“trt” column).

sum( bacteria$trt == 'placebo' )
