credit_score <- read.csv('CleanCreditScoring.csv')
head(credit_score)
summary(credit_score)

# Analyze the Income variable and conclude
summary(credit_score$Income)
var(credit_score$Income)

# Relation between the variable Amount and Income by calculating 
# the correlation coefficient applying the linear regression

# Correlation Coefficient
correlation <- cor(credit_score$Income, credit_score$Amount)

# Liear Regression
x <- c(credit_score$Income)
y <- c(credit_score$Amount)

data <- data.frame(x,y)
LinearReg <- lm(y~x)
print(LinearReg)
summary(LinearReg)


# Standardization 
x_standardize <- as.data.frame(scale(credit_score[9:14])) # 9 depicts the position of Expanses
head(x_standardize)

# Covariance Matrix
cov_Matrx <- as.matrix(x_standardize)
covariant_credit_score <- cor(x_standardize)
print(covariant_credit_score)

# PCA
pca <- prcomp(x_standardize,center = T,scale. = T)
summary(pca)

# MCA

library(FactoMineR)
credit_score_category_data = credit_score[1:4446, 17:26] #Extracting category data
head(credit_score_category_data)
res.mca <- MCA(credit_score_category_data, 
               graph=FALSE)
print(res.mca)
#plot(res.mca)

eig.val <- res.mca$eig

barplot(eig.val[, 2], 
        names.arg = 1:nrow(eig.val), 
        main = "Variances Explained by Dimensions (%)",
        xlab = "Principal Dimensions",
        ylab = "Percentage of variances",
        col ="steelblue")

library("factoextra")

fviz_screeplot(res.mca, addlabels = TRUE, ylim = c(0, 45))

fviz_mca_biplot (res.mca, repel = TRUE, 
                 ggtheme = theme_minimal())

