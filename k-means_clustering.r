#k-Means Clustering demo on Iris flower set




################FIRST LOAD AND VIEW THE DATA SET##########################

# step 01 - Load necessary data sets
data("iris")

# step 02 - View structure of data sets
str(iris)

# step 03 - view a statistical summary of data set
summary(iris)

# step 04 - view top data of iris data sets in table manner
head(iris)





################NOW PRE PROCESS THE DATA SET##############################

#Since clustering is a type of Unsupervised Learning, we would not require Class 
#Label(output) during execution of our algorithm. We will, therefore, remove Class 
# Attribute "Species" and store it in another variable.We would then normalize the 
#attributes between 0 and 1 using our own function.

# step 05 - remove the class species from the data set
iris.new<- iris[,c(1,2,3,4)]

# step 06 view new iris data set
head(iris.new)

# step 07 - store the removes class species in a new variable
iris.class<- iris[,("Species")]

# step 08 - step 06 view removed iris data set
head(iris.class)

# step 09 - now to normalize the data set between 0 and 1 first initialize the function
normalize <- function(x){return((x-min(x))/ (max(x)-min(x)))}

# step 10 - now apply the above function to each class in the given new data set
iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)

# step 11 - now view the newly normalized data set
head(iris.new)





####################Apply k-means clustering algorithm##########################

# step 12 - now apply the k means clustering data set to the pre-processed data set
# we  assume 3 as the number of centroids in the k means clustering
result<- kmeans(iris.new,3)

# step 13 - now visualizes the number of records processed in each cluster
result$size

# step 14 - check the center values of each cluster 
result$centers

# step 14 - check the cluster vectors where each value falls 
result$cluster







#####################Verify Results of Clustering##################################
#To verify the resultants of the k means clustering process plot each items and check with the removes items

# step 15 - First before plotting the graphs set the order how you going to organize the graphs in the given plot space
# par means parameters, mfrow means matrix 2*2 which make space for 4 graphs side by side 
#, mar means margin around each graph (bottom,left,top,right)
par(mfrow=c(2,2), mar=c(5,4,2,2))

# step 16 - # Plot to see how Sepal.Length and Sepal.Width data points have been distributed in clusters
plot(iris.new[c(1,2)], col=result$cluster )

# step 17 - # Plot to see how Sepal.Length and Sepal.Width data points have been distributed originally as per 
#"class" attribute in dataset
plot(iris.new[c(1,2)], col=iris.class)

# step 18 - # Plot to see how Petal.Length and Petal.Width data points have been distributed in clusters
plot(iris.new[c(3,4)], col=result$cluster)

# step 19 - # Plot to see how Petal.Length and Petal.Width data points have been distributed originally as per 
#"class" attribute in dataset
plot(iris.new[c(3,4)], col=iris.class)

# step 20  - view the data in a table
table(result$cluster,iris.class)

# finally check the accuracy of the final output

      #Total number of correctly classified instances are: 36 + 47 + 50= 133
      #Total number of incorrectly classified instances are: 3 + 14= 17
      #Accuracy = 133/(133+17) = 0.88 i.e our model has achieved 88% accuracy!













