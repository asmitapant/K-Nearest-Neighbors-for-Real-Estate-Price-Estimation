# Install and load required packages
install.packages("FNN")  
# For knn.reg function
library(FNN)

# 1. Sample Dataset
house_data <- data.frame(
  Size = c(1000, 1500, 1800, 2400, 3000, 3500, 4000, 1200, 2000, 2800),
  Bedrooms = c(2, 3, 3, 4, 4, 5, 5, 2, 3, 4),
  Location = c("A", "A", "B", "B", "C", "C", "A", "B", "C", "A"),
  Price = c(150000, 200000, 220000,
            270000, 320000, 370000, 400000,
            180000, 250000, 310000))

# Convert Location to numeric (A=1, B=2, C=3)
house_data$Location <- as.numeric(as.factor(house_data$Location))

# 2. Normalize the data (important for KNN
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

house_data_norm <- as.data.frame(lapply(house_data[, 1:3], normalize))
house_data_norm$Price <- house_data$Price

# 3. Train/Test Split
set.seed(123)
train_index <- 1:8  # First 8 as training
test_index <- 9:10  # Last 2 as testing

train_features <- house_data_norm[train_index, 1:3]
train_labels <- house_data_norm[train_index, 4]
test_features <- house_data_norm[test_index, 1:3]
test_labels <- house_data_norm[test_index, 4]

# 4. Apply KNN Regression
k <- 3
predicted_norm <- knn.reg(train = 
                            train_features, test = test_features,
                          y = train_labels, k = k)$pred

# Convert predictions back to actual scale
min_price <- min(house_data$Price)
max_price <- max(house_data$Price)
predicted_prices <- predicted_norm * (max_price - min_price) + min_price

# 5. Show Results
results <- data.frame(Actual = house_data$Price[test_index],
                      Predicted = round(predicted_prices, 0))
print(results)

# 6. plot Actual vs Predicted
plot(results$Actual, results$predicted,
     col= "blue", pch= 19, xlab= "Actual price", ylab=
       "predicted price", main= "Actual vs predicted House prices")

# Add a perfect fit line
abline(0,1,col="red", lwd=2)

