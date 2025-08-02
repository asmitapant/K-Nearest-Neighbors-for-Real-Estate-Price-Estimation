# K-Nearest-Neighbors-for-Real-Estate-Price-Estimation
This R script demonstrates the use of K-Nearest Neighbors (KNN) regression to predict house prices based on three features: size, number of bedrooms, and location.
The workflow includes:

Creating a sample dataset

Encoding categorical data (location) into numeric form

Normalizing features for KNN

Splitting data into training and testing sets

Applying knn.reg() from the FNN package with k = 3

Re-scaling predictions back to original price range

Visualizing actual vs. predicted prices using a scatterplot

The final plot includes a red diagonal line to indicate perfect prediction alignment. This project illustrates the power of KNN for regression tasks in a housing market context.
