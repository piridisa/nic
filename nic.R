
getwd()

library("ggplot2")
library("ggfortify")
library("ggbiplot")

# dataset mtcars from R
mtcars <- mtcars
mtcars.pca <- prcomp(mtcars[,c(1:7,10,11)], center = TRUE,scale. = TRUE)
summary(mtcars.pca)

# plot the cars (without ellipse)
ggbiplot(mtcars.pca, labels=rownames(mtcars))

# with ellipse (summarizing the cars by country)
mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))

ggbiplot(mtcars.pca,ellipse=TRUE,  labels=rownames(mtcars), groups=mtcars.country)


# the rotation measure provides the first 2 PC loadings
# each column of rotation matrix contains the PC loadings vector
mtcars.pca$rotation[1:9,1:2]

# dimensions of data by rows and columns
dim(mtcars.pca$x)

# outputs the mean of variables
mtcars.pca$center

# outputs the standard deviation of variables
mtcars.pca$scale

