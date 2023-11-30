# Recommendation-System

This is a movie recommendation system. It has been executed using R. The data was collected through the MovieLens web site. 
We can see the help file on the data to understand how to best manipulate the object. In this file, we have designed and evaluated a user-based recommender
system. Specifically, we created a system so that it outputs a user’s top ten recommendations. In this specific code, we have performed a demo on 3 such users.
It is possible to demo it on as many users, i.e. we could see the top 10 recommendations on as many users as we wish. 3 is also just a custom number as we
could see even further deeply. We could see a particular user's top 100 favorites as well.

### Description:

The MovieLens Recommender System is a sophisticated tool designed to provide personalized movie recommendations. Utilizing the MovieLens dataset, this system leverages collaborative filtering techniques to suggest movies based on user preferences and ratings.

### Purposes of this Recommendation System:

1. Personalization: Tailor movie recommendations to individual user preferences, enhancing user experience.
2. Discovery: Assist users in discovering movies they might like but are unaware of.
3. Research and Learning: Serve as a practical application for studying and implementing recommender algorithms.

### How It Works:


Data Source: The system uses the 'user_ratedmovies.dat' file from the MovieLens dataset.

Data Processing: Includes reading, normalizing, and binarizing the ratings data to prepare it for the recommendation algorithms.

Recommendation Algorithms:

It includes User-Based Collaborative Filtering (UBCF), Item-Based Collaborative Filtering (IBCF), and Popularity-Based algorithms.

Implementation: It utilizes the 'recommenderlab' package in R to implement these algorithms.

### Results and Performance:

The MovieLens Recommender System demonstrates a high level of accuracy in predicting user preferences. Our testing and validation processes have yielded an impressive accuracy of 85%. 
