

data = read.csv("uni.csv", sep = ",", header = TRUE)


#oppretter en dummyvariabel
x1 = ifelse(data$Sector == "Private",0,1)
x2 = data$Median_SAT


model = lm(data$Grad_rate ~ x1 + x2)

summary(model)
