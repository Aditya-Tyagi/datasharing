setwd("E:/Study Mat/Intellipaat/RPrograms")
getwd()
# Vectors
a=c(1,2,3)
b=c("Hello","ITS")
c=c(2:10)
vec=c(NA,6,7,8,NA)
is.na(vec)
class(vec)
ifelse(is.na(vec),0,vec)

#Lists
my_list1=list(10,"ITS",20.5)
class(list)
my_list2=list(c(1,2),c("a","b"),c(TRUE, FALSE))
my_list2[2]
my_list2[[1]][1]
my_list2[[2]][1]
my_list2[[3]][2]
#Naming elements of a list-
l1=list(apple=85,banana=45,guava=100)
l1$apple

#Matrix
m1=matrix(c(1,2,3,4),nrow=2,byrow=T)
#getting first row
m1[1,]
#getting first cloumn
m1[,1]
#getting element from first row second cloumn
m1[1,2]
#Transpose
t(m1)
# mean calculation of row & column
mean(m1[,2]) #mean of second column
mean(m1[1,])#mean of first row

#Arrays
a1=array(c(1:24),dim=c(2,4,3))

a1[,,3] #Entire third matrix

a1[1,2,2] # first row second column of second matrix

# Factors
d1=c("Male","Female","Male","Female")
as.factor(d1)

#data frames
a=data.frame(name=c("sam","bob"),age=c(30,40))
#Reading external files
#cust=read.csv("Customer_Churn.csv")
read.csv("E:/Study Mat/Intellipaat/R-Programs/Customer_Churn.csv")
#Reading individual column
##Customer_Churn$gender
cust$gender
#Third column
cust[,3]
#Extracting multiple columns
cust[c(1,3,6)]
head(cust)
tail(cust)
nrow(cust)
ncol(cust)
sample(cust,10)
table(cust)
table(cust$gender)

#apply() family
lst=list(c(1,2),c(3,4),c(5,6))
lapply(lst,mean) 
cust=read.csv("Customer_Churn.csv")
tapply(cust$tenure,cust$Partner,mean)

#dplyr
library(dplyr)
select(cust,1,2,5)
select(cust,ends_with("e"))

filter(cust,gender=="female" & tenure>50)

sample_n(cust,20)
sample_frac(cust,.2)
summarise(cust,tenure_mean=mean(tenure))
summarise(group_by(cust,InternetService),mean(tenure))

#Pipe operator
cust %>% select(1:5) %>% filter(gender=="male")

#Data Visualization

cust=read.csv("Customer_Churn.csv")
plot(cust$Dependents)
plot(cust$Dependents,col="red",xlab="Dependents",main="Distribution of dependents")

hist(cust$tenure,col="red",xlab="Tenure",main="Histogram of Tenure",breaks=30)

#ggplot2
library(ggplot2)
ggplot(data=cust,aes(x=tenure))+geom_histogram(fill="red",col="green",bins=30)
ggplot(data=cust,aes(x=tenure,fill=Partner))+geom_histogram(position="identity",bins=30)
ggplot(data=cust,aes(x=Dependents,fill=DeviceProtection))+geom_bar()
ggplot(data=cust,aes(x=Dependents,fill=DeviceProtection))+geom_bar(position="dodge")
ggplot(data=cust,aes(x=tenure,y=TotalCharges,col=Partner))+geom_point()
ggplot(data=cust,aes(x=InternetService,y=MonthlyCharges))+geom_boxplot(fill="green")
ggplot(data=cust,aes(x=tenure,y=TotalCharges,col=Contract))+geom_point()+geom_smooth()+facet_grid(~Contract)
