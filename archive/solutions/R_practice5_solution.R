
# 1) The following command lines loads the MASS library and the bacteria data.frame present in the MASS package. Execute it:
library(MASS)
data(bacteria)
?bacteria

# 2) What are the names of the columns of the bacteria data.frame ?

names(bacteria)

# 3) Use the [] , to select in bacteria rows 100 to 119 in the column "ap".

bacteria[ 100:119 , "ap" ]

# 4) Use $ to get the column "week" and check how many 0 values it has.

sum(bacteria$week == 0)

# 5) Optional : using a comparison operator and [], select the rows which correspond to a “placebo” treatment (in the “trt” column).

bacteria[ bacteria$trt == "placebo" , ]
