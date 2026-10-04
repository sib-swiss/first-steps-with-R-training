# Ex.4 extra:

x <- seq(from = 0, to = 5, length.out = 100)   # 100 values equally spaced from 0 to 5
y <- exp(x)                                     # exponential of each value of x


# Check it:
length(x)   # 100
head(x)     # 0.0000 0.0505 0.1010 ...
range(y)    # 1.0000 148.4132  (exp(0) = 1, exp(5) ≈ 148.4)
plot(x, y)  # the exponential curve

# mean and sd
mean(x)
mean(y)

sd(x)
sd(y)