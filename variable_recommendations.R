library(recommenderlab)
ls("package:recommenderlab")
print(getwd())
#setwd("/Users/User/Documents")
# Read in the MovieLens data
Ratings <- read.delim("user_ratedmovies.dat", sep = "\t")
head(Ratings) # 855598 x 9
dim(Ratings)
#finding out the unique users and movie since each movie can be repeated in the dataset
length(unique(Ratings$userID)) #2113 distinct users
length(unique(Ratings$movieID)) #10109 distinct movies

# Create a "realRatingMatrix"
#The real rating matrix is essentially a matrix containing ratings.

R <- as(Ratings, "realRatingMatrix")
#the above line coerces ratings to belong to realratingmatrix class


# Get the Rating Matrix

?getRatingMatrix
dim(getRatingMatrix(R))
#just checking dimensions
#checking first 10 rows and columns so as not to overload the PC
getRatingMatrix(R)[1:10, 1:10]

# Normalization of the ratings matrix
R_Normalize <- normalize(R)
R_Normalize

#################################################
## Visualize raw ratings and normalized ratings
#################################################
image(R_Normalize[1:100,1:100], main = "Normalized ratings")


image(R[1:100, 1:100], main = "Raw Ratings")

getRatingMatrix(R_Normalize)[1:10, 1:10]

#de-normalize
R_denormalize <- denormalize(R_Normalize)

# Create a Binary Matrix
R_binarize <- binarize(R_denormalize, minRating = 4)
getRatingMatrix(R_binarize)


image(R_binarize[1:100,1:100], main = "Binarized ratings")

# Visualize the ratings in the form of a histogram

hist(getRatings(R_Normalize), breaks = 100, main = "Histogram of normalized ratings")


hist(rowCounts(R_Normalize), breaks = 100, main = "ratings given by users")


hist(colCounts(R_Normalize), breaks = 100, main = "count of ratings per movie")


?recommenderRegistry
recommenderRegistry$get_entries(dataType = "realRatingMatrix")

recommender_popularity <- Recommender(R[1000:1], method = "POPULAR")

#the different methods are UBCF, IBCF, POPULAR, RERCOMMEND
#All these recommendation algorithms can be found in the paper

names(getModel(recommender_popularity))
getModel(recommender_popularity)$topN
getModel(recommender_popularity)$ratings

# Create top 10 recommendations for 3 users
#Predict() creates recommendations using a recommender model and data about new users
#predict(object, newdata, n = 10, data=NULL, type="topNList", ...)
#object	 is a recommender model, n is the number of recommendations in the top-N list.
#data	is training data needed by some recommender algorithms if newdata is a user index and not user data
#type is the type of recommendation

recom <- predict(recommender_popularity, R[1000:1002], n=10)
recom
as(recom, "list")

# extract sublists
Recom3 <- bestN(recom, n = 3)
Recom3
as(Recom3, "list")

# Predict the ratings for x users
user_ratings <- predict(recommender_popularity, R[1000:1000+x], type = "ratings")
user_ratings
as(user_ratings, "matrix")[,1:10]

# another way to get to trainings
predict_ratings <- predict(recommender_popularity, R[1000:1003], type = "ratingMatrix")
predict_ratings
as(predict_ratings, "matrix")[,1:10]
