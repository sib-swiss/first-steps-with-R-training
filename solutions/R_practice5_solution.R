
# 1)Install and load the package MASS (or other CRAN packages).
# install.packages("MASS")
library(MASS)


# 2) The following command line loads the bacteria data.frame present in the MASS package. Execute it:

data(bacteria)

# 3) What are the names of the columns of the bacteria data.frame ?

names(bacteria)

# 4) Use the [] , to select in bacteria rows 100 to 119 in the column "ap".

bacteria[ 100:119 , "ap" ]

# 5) Use $ to get the column "week" and check how many missing values it has.

sum(is.na(bacteria$week))

#Optional : 6) use comparison operators to count how many rows correspond to a “placebo” treatment (“trt” column).

sum(bacteria$trt == "placebo")

