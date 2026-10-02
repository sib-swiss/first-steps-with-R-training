#1) Assign the values 6.7 and 56.3 to variables "a" and "b", respectively.
a <- 6.7
b <- 56.3

#2) Calculate (2*a)/b + (a*b) and assign the result to variable "x". Display the content of "x".
x <- (2*a)/b + a*b
x

#3) Find out how to compute the square root of variables. Compute the square roots of "a" and "b" and of the ratio "a/b".
sqrt(a) #using function sqrt()
b^0.5 # power 0.5 is the square root
(a/b)**0.5 # another way of specifying power

#4) a) Calculate the logarithm to the base 2 of "x".
#   b) Calculate the natural logarithm of "x".
log2(x) # Function specifically for Log 2. Alternatively: log(x, base=2)
log(x)  # If we don't specify the base, default is the natural logarithm. 

