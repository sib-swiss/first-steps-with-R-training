# First Steps in R, Practice 6

#A dataset from mice experiments at 18 weeks is available in the file mice_data_mod.csv
# (courtesy of F Schutz and F. Preitner). Let's explore a bit the dataset to see what it contains.

# 1) Open a new script file in R studio, comment it and save it.

# 2) Have look at the csv file in R studio's file explorer. What do you need to check in order to be able to read in the file correctly?

# file > open ...
# By looking at the file, we can see there is a header, and the separator between fields is ",".
# There are no row names.

# 3) Read the file, assign it to object "mice_data". Examine the object.

getwd() # check where you are. If you didn't change anything, you will be in the folder with the .Rproj file (rpoject root)

# If you are not at your project root, set the directory to where you want to be
# for example : setwd("D:/docs/R_Oct2020_exercises_live")

mice_data <- read.table( "course_datasets/mice_data_mod.csv" , header=T , sep="," ) # read in data with header and , separator

# 4) How many observations and variables does the dataset have?
D = dim(mice_data)
D[1] #number of observations.
D[2] #number of variables.

# alternatively:
nrow(mice_data)
ncol(mice_data)


# 5) What is the structure of the dataset?
str(mice_data)

# What are the names and classes of the variables?
#'data.frame':	50 obs. of  3 variables:
# $ diet    : chr  "HFD" "HFD" "HFD" "HFD" ...
# $ genotype: chr  "WT" "WT" "WT" "WT" ...
# $ weight  : num  31.2 32.1 30.3 45 39.2 38.8 41.8 46.2 35.8 35.4 ...
# $ heartRate      : num  500 500 502 501 501 ...
# $ respiratoryRate: num  110 112 109 125 117 ...

# 6) Which variables appear to be categorical? Convert them to factors.
mice_data$diet <- factor(mice_data$diet)
mice_data$genotype <- factor(mice_data$genotype)

# 7) Get the summary statistics of  "mice_data"
summary(mice_data)

# 8) Use the function table() to compute the number of observations in different mouse groups. 
 # a) How many mice are included of each genotype (WT, KO)? 
 # b) How many mice are included per diet (HFD, CHOW)? 
 # c) Make a 2x2 table by genotype and diet crossed.

table(mice_data$genotype)# by genotype (WT/KO)
table(mice_data$diet)# by diet (CHOW/HFD)

table(mice_data$genotype, mice_data$diet ) # table crossing both


# 9) Compute means and standard deviations for WT and KO mouse weights 
# using tapply(). 
# Then do the same for CHOW and HFD mice. Then do it for diet/genotype combinations.

tapply(mice_data$weight, mice_data$genotype, mean)# mean: by genotype (WT/KO)
tapply(mice_data$weight, mice_data$genotype, sd)# by genotype (WT/KO)

tapply(mice_data$weight, mice_data$diet, mean)# by diet (CHOW/HFD)
tapply(mice_data$weight, mice_data$diet, sd)# sd: by diet (CHOW/HFD)

tapply(mice_data$weight, list(mice_data$genotype, mice_data$diet), mean)# by genotype/diet (CHOW/HFD)
tapply(mice_data$weight, list(mice_data$genotype, mice_data$diet), sd)# sd: by genotype/diet (CHOW/HFD)

# 10) Isolate the observations for the mice on high fat diet (HFD) 
# using subset(). 
# Compute a summary statistics just for the weights of the subset.
# Then do the same for the mice on regular chow diet (CHOW).
# Export the data of each subgroup to a csv file.

mice_data_HFD <- subset(mice_data , diet == "HFD") # OR, mice_data[ mice_data$diet == "HFD",]

summary(mice_data_HFD$weight)
write.csv(mice_data_HFD,"mice_data_HFD.csv",row.names=F,quote=F)

mice_data_CHOW <- subset(mice_data, diet == "CHOW")
summary(mice_data_CHOW$weight)

write.csv(mice_data_CHOW, "mice_data_CHOW.csv", row.names=F,quote=F)

#11) Look at the results from the two previous exercises. What does this initial exploration of the data suggest about mouse weights?

# Genotype (KO v WT) does not seem to have a big effect on mouse weight.
# Mice on HFD are heavier on average than mice on CHOW diet, and their weights are more variable.

# Open question, not explored yet: Is the diet effect on weight influenced by the genotype? I.e., do KO and WT mice respond differently to HFD?
