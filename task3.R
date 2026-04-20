library(tidyverse)
library(rpart)
library(rpart.plot)
library(caret)
library(corrplot)

df <- read.csv("C:/Users/Vedant/Desktop/Prodigy Tasks/Task 3/bank-full.csv", sep = ";", stringsAsFactors = TRUE)

dim(df)
str(df)
summary(df)
head(df)
colSums(is.na(df))

x11()
ggplot(df, aes(x = y, fill = y)) +
  geom_bar(width = 0.5, color = "white") +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5, size = 5) +
  scale_fill_manual(values = c("no" = "#e74c3c", "yes" = "#2ecc71")) +
  labs(title = "Target Variable Distribution", x = "Subscribed", y = "Count") +
  theme_minimal() +
  theme(legend.position = "none")

x11()
ggplot(df, aes(x = job, fill = y)) +
  geom_bar(position = "dodge", color = "white") +
  scale_fill_manual(values = c("no" = "#e74c3c", "yes" = "#2ecc71")) +
  labs(title = "Subscription by Job", x = "Job", y = "Count", fill = "Subscribed") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

x11()
ggplot(df, aes(x = education, fill = y)) +
  geom_bar(position = "dodge", color = "white") +
  scale_fill_manual(values = c("no" = "#e74c3c", "yes" = "#2ecc71")) +
  labs(title = "Subscription by Education", x = "Education", y = "Count", fill = "Subscribed") +
  theme_minimal()

x11()
ggplot(df, aes(x = y, y = age, fill = y)) +
  geom_boxplot(color = "grey30") +
  scale_fill_manual(values = c("no" = "#e74c3c", "yes" = "#2ecc71")) +
  labs(title = "Age vs Subscription", x = "Subscribed", y = "Age") +
  theme_minimal() +
  theme(legend.position = "none")

x11()
ggplot(df, aes(x = marital, fill = y)) +
  geom_bar(position = "fill", color = "white") +
  scale_fill_manual(values = c("no" = "#e74c3c", "yes" = "#2ecc71")) +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Subscription Rate by Marital Status", x = "Marital Status", y = "Proportion", fill = "Subscribed") +
  theme_minimal()

set.seed(42)
df$y <- ifelse(df$y == "yes", 1, 0)
df$y <- factor(df$y, levels = c(0, 1), labels = c("No", "Yes"))

split <- createDataPartition(df$y, p = 0.8, list = FALSE)
train <- df[split, ]
test  <- df[-split, ]

cat("Train size:", nrow(train), "\n")
cat("Test size :", nrow(test), "\n")

model <- rpart(y ~ ., data = train, method = "class",
               control = rpart.control(maxdepth = 5, minsplit = 20))

x11()
rpart.plot(model, type = 4, extra = 104, fallen.leaves = TRUE,
           main = "Decision Tree - Bank Marketing",
           box.palette = c("#e74c3c", "#2ecc71"))

preds <- predict(model, test, type = "class")

cm <- confusionMatrix(preds, test$y)
print(cm)

cat("\nAccuracy :", round(cm$overall["Accuracy"] * 100, 2), "%\n")
cat("Precision:", round(cm$byClass["Precision"] * 100, 2), "%\n")
cat("Recall   :", round(cm$byClass["Recall"] * 100, 2), "%\n")
cat("F1 Score :", round(cm$byClass["F1"] * 100, 2), "%\n")

imp <- as.data.frame(model$variable.importance)
imp$Feature <- rownames(imp)
colnames(imp)[1] <- "Importance"

x11()
ggplot(imp, aes(x = reorder(Feature, Importance), y = Importance, fill = Importance)) +
  geom_bar(stat = "identity", color = "white") +
  coord_flip() +
  scale_fill_viridis_c(option = "C") +
  labs(title = "Feature Importance", x = "Feature", y = "Importance") +
  theme_minimal() +
  theme(legend.position = "none")