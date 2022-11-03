HR <- read.csv('HR_comma_sep.csv')
head(HR)

#Standardization using 
HR_Standz <- as.data.frame(scale(HR[1:8]))
head(HR_Standz)

#Corvariance Matrix
HR_Mat <- as.matrix(HR_Standz)
head(HR_Mat)
HR_Cov <- cor(HR_Standz)
head(HR_Cov)

#PCA
pca <- prcomp(HR_Standz,center = T,scale. = T)
summary(pca)

#Visualization

library(ggfortify)
autoplot(pca, data = HR, colour = 'salary')