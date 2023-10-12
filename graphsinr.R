

?par
par()

par(bty="u")
plot(lynx)


### GRAPHS IN R


# 1. Boxplots

# are a perfect way to compare distributions of different groups
# allow a good overview: min, max, median,
  # quartiles 1 and 3, outliers
# they often come together with ANOVA
# standard tool for scientific publications

?sleep

sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Change in sleep duration",
        col.main = "red", ylab = "change in hrs", xlab="drug")

# what do we see on the boxplot?

attach(sleep)
means = by(extra, group, mean)
points(means, col = "red")

# to change the orientation of the boxplot : horizontal=T

horixontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab="", xlab="", horizontal = T)

# to integrate different colours for the boxplots
### watch the character vector

horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab="", xlab="", horizontal = T,
                            col = c("blue", "red"))


par (bty='o')
plot(c(4,6,7), c(8,3,5), las=0, pch =20 , col=c("blue"))
?par
par()
colors()
example(points)


# Exercise: Boxplot


# 1. get familiar with dataset : PlantGrowth
?PlantGrowth

# 2. perform a boxplot stratified by
           #the three treatment groups
x <- PlantGrowth$weight
y <- PlantGrowth$group

# 3. remove the box surrounding the plot
means <- by(x,y, mean)

# 4. resemble the heading as below - hint: \n
par(bty="n")

# 5. Name the boxes on the x Axes - hint: boxplot help
boxplot(x~y, ylab= "plant weight", main = "Treatment Effect \n on Plant Growth",
        cex.main=1.5, col.main="darkblue", names=c("control", "Treatment 1", "Treatment 2"))

# 6. insert a blue dot for the mean in each box
points(means, col="blue", pch=20)

############# last export as pdf


# 2. Pie Charts

# quite often used for slaes and marketing purposes
  # because they are said to be able to manipulate the perception
# not often used in scientific papers

?pie 

# to create the slices and define the size
slices = c(40, 20, 40)

# name (labels) of the slices - WATCH the length
countries = c("US", "UK", "Other")

# to add the slice size to the labels
countries = paste(countries, slices)

# to further specify the labels
countries = paste(countries, "%", sep = "")

# the actual pie chart
pie(slices, labels=countries,
    col=c("maroon", "magenta", "violet"), main = "Sales Distribution")


#### to work with data frames

?iris
attach(iris)

values = table(Species) # table for counts
labels = paste(names(values))
pie(values, labels = labels, main = "Species Distribution")


#### to add a 3D effect

# we need the library "plotrix"

library(plotrix)

# then we can use "pie3D"
# and we can add "explode" - distance should be around 0.1 - 0.05

pie3D(slices,labels=conutries, explode = 0.05,
      col=c("maroon", "magenta", "violet"), main = "Sales Distribution")


# 3. Histograms

# it gives a good idea of probability distribution
# histogram are divided into intervals or bins

?hist

# breaks determine the interval length
# we have the sturges algo as preset
# you can define breaks yourself (but R will do its own calculations)

?cars

ourdata=cars$speed

hist(ourdata)

# as you can see the breaks are not perfect

hist(ourdata, labels = T, breaks=c(0,5,10,20,30))

# or even better

hist(ourdata, labels = T, breaks = 10)

# we can adjust the scales

hist(ourdata, labels = T, ylim = c(0,10), breaks=10)


### we can add a normal curve to our histogram

#fitting the axes for the curve

hey = hist(ourdata, breaks = 10)

xaxis=seq(min(ourdata), max(ourdata), length=10)
yaxis=dnorm(xaxis, mean=mean(ourdata), sd=sd(ourdata))
yaxis = yaxis*diff(hey$mids)*length(ourdata)

# add the normal curve

lines(xaxis, yaxis, col="red")




# we can change from frequency to density

hist(ourdata,fre=F, breaks=10)

# and add the density line

lines(density(ourdata),col ="maroon", lwd =2)



# Exercise Histogram

# 1. get familiar with the lynx dataset

# 2. plot a simple histogram

# 3. chose the right break number (right bin number)

# 4. adjust heading and labs according to graph below

# 5. adjust the y axis scale horizontally

# 6. insert the count number in the graph

# 7. adjust the graph area that every count number is visible

# 8. add coloration to the graph : hint - color vector

# 9. add second heading line : hint = mtext

hist(lynx, breaks=9, ylim=c(0,70),las=1,
     labels=T, col=c("black", "maroon"),
     main="Annual Lynx Trappings",
     xlab="Number of lynx trappings\n per year")
mtext("1821-1934")



##### Advanced Scatterplots

# we already learned the basics of scatterplot in the R Basics course
# I want to show you some more things you can do with scatterplots

# you can plot several xy pairs in one plot

set.seed(67)
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

# at first we create a simple scatterplot

plot(x,y, col=123, pch=10, main="Multi Scatterplot",
     col.main="red", cex.main=1.5, xlab="indep", ylab="depend")

# now we add another layer on our scatterplot

points(z,t, col="blue", pch=4)

# and the last one

points (y,t, col=777, pch =9)

# this gives us a three layer multi scatterplot


#### LEGENDS

# we can add a legend to be able to understand our layered scatterplot

# the first two numbers specify the position on the x y scale.
# than we have legend names, colours (col) and symbols (pch) to be used in t
# with cex you can adjust the size and bty removes the surrounding box

legend(-6,5,9, legend=c("level 1", "level 2", "level 3"),
       col =c(123, "blue", 777), pch=c(10,4,9),cex=0.65, bty="n")



##### Exercise

# Create the following vectors
x = 1:5
y = rep(4,5)
x1 = 1.1:5.1
y1 = 5:1

# now plot those 3 levels in your scatterplot (x-y, x1-y1, x1-x)
# pick a suitable format for your plot
# add a legend without box to your plot

plot(x,y, main = "Exercise Solution", xlab="", ylab="",
     cex.main=1.3, col.main=777, pch=3,col="red", bty ="n")
points(x1,y1, col="green", pch=8)
points(x1, x, col="blue", pch=9)

legend(1,3,5, legend=c("level 1", "level 2", "level 3"),
       col =c("red", "green", "blue"), pch=c(3,8,9),cex=0.75, bty="n")