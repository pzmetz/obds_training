#Generate a vector of 1000 normally distributed 
#values with mean 10 and standard deviation 5.

vector <- rnorm(n = 1E3, mean = 10, sd = 5)

#Inspect the output of the summary() function 
#for that vector.

summary(vector)


#Compute the mean and standard deviation for 
#those values.

mean(vector)
sd(vector)

#Compute the deciles (i.e. 10 evenly 
#spaced quantiles) for those values.

quantile(vector, probs = seq(0, 1, 0.1))

#Visualise the distribution of those values as a histogram.

hist(vector, breaks = 50)

#Visualise as vertical lines on the histogram: 
#the mean (red solid), median (red dashed), 
#one standard deviation from the mean 
#(blue solid), and one median absolute 
#deviation from the median (blue dashed)

abline(v = mean(vector), col = "red", lty = 1)
abline(v = median(vector), col = "red", lty = 2)

abline(v = mean(vector) + sd(vector), col = "blue", lty = 1)
abline(v = mean(vector) - sd(vector), col = "blue", lty = 1)

abline(v = median(vector) + mad(vector), col = "blue", lty = 2)
abline(v = median(vector) - mad(vector), col = "blue", lty = 2)


#Generate a new vector with a lot more 
#values (e.g., one million). Draw again 
#a histogram. How does the distribution 
#compare with more data points?

vector_2 <- rnorm(n = 1E6, mean = 10, sd = 5)
hist(vector_2, breaks = 50)

par(mfrow = c(2, 1))  # allows for showing two plots
hist(vector, breaks = 50)
hist(vector_2, breaks = 50)
par(mfrow = c(1, 1))

#-----------------------------------------------------------------------
#excersise 2

#Query distributions and probabilities

#For the standard normal distribution N(μ = 0, σ^2
# = 1) :

#Plot the cumulative distribution function 
#in the range [−5, 5].
q <- seq(-5, 5, by = 0.1)
vector_probability <- pnorm(q, mean = 0, sd = 1)

plot(x = q, y = vector_probability)

#Plot the inverse cumulative distribution 
#function for quantiles in 0.01 increment.

p <- seq(0, 1, by = 0.01)
p
vector_2 <- qnorm(p, mean = 0, sd = 1)
plot(x = p, y = vector_2)

#Plot the density function in the range .

vector_density <- dnorm(q, mean = 0, sd = 1)
plot(x = q, y = vector_density)

#What is the probability of observing a value 
#greater than 2?

vector_probability_2 <- 1- pnorm(2, mean = 0, sd = 1)
vector_probability_2


#What is the probability of observing a value between -2 and 2?

pnorm(2, mean = 0, sd = 1) - pnorm(-2, mean = 0, sd = 1)

#What is the probability of observing a value more extreme than -2 or 2?

1 - (pnorm(2, mean = 0, sd = 1) - pnorm(-2, mean = 0, sd = 1))


#-----------------------------------------------------------------------
#exercise 3

#Use the ecdf() function to compute the empirical 
#cumulative distribution function for the 
#variable Sepal.Length in the iris data set.

iris_ecdf <- ecdf(iris$Sepal.Length)

#Use the plot() function to visualise the 
#empirical cumulative distribution function.

plot(iris_ecdf)

#Use the knots() function on the ecdf output and 
#compare this with the list of unique values for 
#the variable Sepal.Length .

knots(iris_ecdf)
sort(unique(iris$Sepal.Length))

iris_ecdf(6)

#----------------------------------------------
#excercise 4

#The iris data set gives the measurements in 
#centimeters of the variables sepal length and width 
#and petal length and width, respectively, for 50 􀃙
#flowers from each of 3 species of iris.

#Use the summary() function to view some information 
#about each column.

summary(iris$Species)

#Visualise the distribution of Sepal.Length , 
#strati􀃘ed by species.

iris_ecdf <- ecdf(iris$Sepal.Length)

#histograms
par(mfrow = c(3, 1))  # allows for showing two plots
hist(iris[iris$Species == 'setosa',]$Sepal.Length, breaks = 10, labels = FALSE, main = FALSE, col = 'red')
hist(iris[iris$Species == 'versicolor',]$Sepal.Length, breaks = 10, labels = FALSE, main = FALSE, col = 'blue')
hist(iris[iris$Species == 'virginica',]$Sepal.Length, breaks = 10, labels = FALSE, main = FALSE, col = 'green')
par(mfrow = c(1, 1))

#using density function to plot lines
plot.new()
range(iris$Sepal.Length)
plot.window(xlim = c(4, 8), ylim = c(0, 2))
lines(density(iris[iris$Species == 'setosa',]$Sepal.Length), col = 'red')
lines(density(iris[iris$Species == 'versicolor',]$Sepal.Length), col = 'green')
lines(density(iris[iris$Species == 'virginica',]$Sepal.Length), col = 'blue')
axis(side = 1, at = seq(4,8))
axis(side = 2, at = seq(0,2,0.2))

#Is Sepal.Length length normally distributed? 
#? Within each species?

plot(density(iris$Sepal.Length))
shapiro.test(iris$Sepal.Length)

shapiro.test(iris[iris$Species == 'setosa',]$Sepal.Length)
shapiro.test(iris[iris$Species == 'versicolor',]$Sepal.Length)
shapiro.test(iris[iris$Species == 'virginica',]$Sepal.Length)

#Is there a signi􀃘cant variation of Sepal.Length 
#between the various species

anova_iris <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_iris)
kruskal.test(Sepal.Length ~ Species, data = iris)

#running tukeys test for multiple comparisons, p adj is the p value, which is basically 0.
tukey_test <- TukeyHSD(anova_iris)
View(tukey_test$Species)


