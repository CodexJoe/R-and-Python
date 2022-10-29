#Loading Dataset using the absolute path
HRM <- read.csv("C:/Users/HP/Desktop/RProgram/codex/HR_comma_sep.csv")

#Overview of the data
head(HRM)

#Checking for Null Value
colSums(is.na(HRM))

#Correlation Coeficient between average_montly_hours and number_project

cor(HRM$average_montly_hours, HRM$number_project)

#linear regression of average_montly_hours = a*number_project+b

#Assigning variables x and y for the two columns under consideration
y <- c(HRM&average_montly_hours)
x <- c(HRM$number_project)

#Creating a data with the two variables
data = data.frame(x,y)

#Viewing first six elements of the new dataset
View(head(data))

#Creating the linear regression model
linearReg <- lm(y ~ x)

#Printing the result of the model
print(linearReg)

# The  model is average_montly_hours = 9.402*number_project+4.278

