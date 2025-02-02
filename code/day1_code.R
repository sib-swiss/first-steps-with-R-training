## creating vectors I

## c() stands from concatenate. you can use it to group vectors
height_in_cm <- c(180, 167, 199)
height_in_cm

height_in_cm <- c(Mia=180, Paul=167, Ed=199)
height_in_cm

height_in_cm[1]       # get the first element
height_in_cm["Paul"]  # get the element named "Paul"

height_in_cm[c(1,3)]  # get the 1st and 3rd element

## creating vectors II


a <- 1:10
a

s <-seq(0,2,0.5) # from 0 to 2, by steps of 0.5
s

genotypes <- rep( c('WT','KO') , 3 )​
genotypes


c(a,s)


## vector manipulation
a <- 1:4
a*2
a + c(12,10,12,10)

## vector manipulation II

# some functions take a vector, and apply a transformation on each element
log(a)
exp(a)

# other functions take a vector, and compute a single value from it
mean(a)
sum(a)

# coercion : vector contain a single types
vec <- c(12, "twelve", TRUE)
vec

class(vec)

## coercion II
x <- c(FALSE, FALSE, TRUE)
class(x)

y = as.numeric(x)
y

## some function "auto-coerce"
sum(x)	# number that are true
mean(x) # proportion that are true



## logical operator

## == -> check equality
c(1,3,2) == 2

c(1,3,2) < 2

## ! inverses TRUE and FALSE
! (c(1,3,2) < 2)

## table counts occurences
table(!(c(1,3,2) < 2))

## %in% -> checks presence
c("Fred", "Marc", "Dan", "Ali") %in% c("Dan", "Geoff", "Ali")

## using logical vectors to subset
a <- 1:4
a[ c(FALSE,FALSE,TRUE,TRUE) ]
a[ a>2 ]


## missing values
y <- c(1,2,3,4,5,NA,NA)

mean(y)

mean(y, na.rm=TRUE) 

# Alternatively, use na.omit() to remove NAs from the data
y_cleaned <- na.omit(y)
y_cleaned

mean(y_cleaned)

x <- c(1, NA, 0/0) ; x # a vector to play withis.na(x) #detects NAs and NaNs from x

is.nan(x) # detects only NaNs from x

x > 2  # what if we try to compare NA and NaN to a number?

x[!is.na(x)]  # removes NAs and NaNs from x

is.na( 33/0 )


# # Matrix
# 
# mat <- matrix(1:12, nrow=3, ncol=4)  # 3x4 matrix
# mat
# 
# # cbind():  bind columns together
# mat1 <- cbind(c(1,0), c(0,1), c(1,0)) # 2x3 matrix
# mat1
# 
# # rbind():  bind rows together
# mat2 <- rbind(c(1,0), c(0,1), c(1,0))  # 3x2 matrix
# mat2

# Dataframe
name <- c("Joyce", "Chaucer", "Homer")
status <- c("dead", "deader", "deadest")
reader_rating <- c(55, 22, 100)

poets <- data.frame(name, status, reader_rating)
poets


poets[2, 2]      # gets the element on row 2 in column 2
poets[, c(1,3)]  # gets columns 1 and 3
poets[, c("name", "reader_rating")] # gets columns "name" and "reader_rating"
poets$name       # gets column "name"

## names
rownames(poets) # gets the row names
colnames(poets) # gets the column names

rownames(poets) <- c("J", "C", "H") # overwrites row names
poets

## list
vec <- c(0.4, 0.9, 0.6)
mat <- cbind(c(1,1), c(2,1))
df <- data.frame(name=c("Ed", "Lisa"), age=c(61, 71))

l <- list(vec, mat, df)
l

l_with_names <- list(myvector=vec, mymatrix=mat, mydata=df)
l_with_names

# access elements:
l
l[[1]]                 # gets the first object
l_with_names[["myvec"]]# gets the object named "myvec"
l_with_names$myvec     # gets the object named "myvec", too


## names
names(l_with_names) # gets the list elements' names
names(l_with_names) <- c("A", "B", "C") # overwrites names






### File 

file.path("C:", "Users", "Leo", "courses", "data", "snp.csv")
file.path("..", "..", "snp.csv")

read.csv("snp.csv")
read.csv("course_datasets/snp.csv")


snps <- read.table("course_datasets/snp.csv", header=TRUE, sep=",")

snps

head( snps )
dim( snps )
nrow( snps )
ncol( snps )
colnames( snps )
rownames( snps )
str( snps )
summary( snps )


# Factors --> not here anymore
genotype <- factor(c("WT", "WT", "Mut2", "Mut1", "Mut2"))
genotype
levels(genotype)

geno <- as.character(genotype)
geno

# Factors II
genotype <- factor(c("WT", "WT", "Mut2", "Mut1", "Mut2"),levels=c("WT","Mut1","Mut2"))

genotype <- c("WT", "WT", "Mut2", "Mut1", "Mut2")
genotype
levels(genotype)


snps$chr <-factor(snps$chr)
snps$minor <-factor(snps$minor)
snps$major <-factor(snps$major)

str( snps )
summary( snps )

snps[2,]
snps[,"minor"]
snps$minor
snps[ 1:3 , c(1,3) ]
snps$chr 
snps$chr[40] 


table( snps$chr  )
table( snps$minor , snps$major  )
table( snps$minor , snps$major  , dnn = c("minor","major"))

## subset:
subset(snps, chr==1)
subset(snps, chr==1 & major=="A")
subset(snps, chr==1 & (major=="A" | major=="T"))

## tapply
data(sleep)
head(sleep)
tapply(X=sleep$extra, INDEX=sleep$group, FUN=mean)

## table
table(snps$chr)
table(snps$minor, snps$major)

##  adding rows
snps_updated <- rbind(snps,
                      data.frame(chr=22, pos=1723369, minor="A", major="T"))
snps_updated

## adding columns
majorGC <- snps$major %in% c("G","C")
majorGC
snps_mod <- cbind(snps, majorGC)
snps_mod

snps$majorGC <- snps$major %in% c("G","C")


## reshaping dataframe
snps_orig <- snps_mod[,-1] 
head(snps_orig) 
##equivalent to
snps_orig <- snps_mod[,2:dim(snps_mod)[2]] 
snps_orig <- snps_mod[,2:ncol(snps_mod)] 
head(snps_orig) 

#exporting data
write.table(snps_updated, file="snps_updated.csv",quote=FALSE, sep=",",row.names=FALSE)







