# PRODIGY_DS_03 - Decision Tree Classifier

## Task 03 - Prodigy InfoTech Data Science Internship

Build a decision tree classifier to predict whether a customer will purchase a product or service based on their demographic and behavioral data using the Bank Marketing dataset from the UCI Machine Learning Repository.

---

## Dataset

- **Source:** [UCI Machine Learning Repository - Bank Marketing](https://archive.ics.uci.edu/dataset/222/bank+marketing)
- **File Used:** `bank-full.csv`
- **Rows:** 45,211
- **Columns:** 17

---

## Tools & Libraries Used

- RStudio
- tidyverse
- rpart
- rpart.plot
- caret

---

## What the Script Does

- Loads and explores the dataset
- Checks for missing values
- EDA visualizations (job, education, age, marital status)
- Splits data into train/test (80/20)
- Builds a Decision Tree classifier
- Evaluates model with confusion matrix
- Plots decision tree and feature importance

---

## Plots Generated

| Plot | Description |
|------|-------------|
| Bar Chart | Target variable distribution |
| Bar Chart | Subscription by Job |
| Bar Chart | Subscription by Education |
| Box Plot | Age vs Subscription |
| Stacked Bar | Subscription rate by Marital Status |
| Decision Tree | Visual tree plot |
| Feature Importance | Top features driving prediction |

---

## Model Performance

| Metric | Value |
|--------|-------|
| Accuracy | ~88% |
| Precision | ~60% |
| Recall | ~40% |
| F1 Score | ~48% |

---

## How to Run

1. Clone this repository
```bash
git clone https://github.com/YOUR_USERNAME/PRODIGY_DS_03.git
```
2. Download `bank-full.csv` from the UCI link above and place it in the same folder
3. Open `Task03_DecisionTree.R` in RStudio
4. Run with `Ctrl + A` then `Ctrl + Enter`

---

## Author

Vedant Chaudhari
Data Science Intern — Prodigy InfoTech
