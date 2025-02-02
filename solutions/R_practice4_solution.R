# 1) Create two vectors, "vector_a" and "vector_b", containing the values from −5 to 5 and from 10 down to 0, respectively.
vector_a <- -5:5
vector_b <- seq(0,1,0.1) # alternatively (0:10)*0.1

# 2) Calculate the (elementwise) sum, difference and product between the elements of "vector_a" and "vector_b". 
vector_a + vector_b #sum
vector_a - vector_b #difference
vector_a * vector_b #product

# 3) a) Calculate the sum of elements in "vector_a"
#    b) Calculate the overall sum of elements in both  "vector_a" and "vector_b".
sum(vector_a)
sum(vector_a, vector_b) # alternatively : sum(vector_a + vector_b)


# 4) Identify the smallest and the largest value among both "vector_a" and "vector_b".
min(vector_a, vector_b)
max(vector_a, vector_b)

# 5) Compute the overall mean of the values among both "vector_a" and "vector_b"
mean( c( vector_a, vector_b) ) # mean() works only on a single vector, unlike sum, min and max! 
# Concatenate both vectors (using c() ) before computing the mean

