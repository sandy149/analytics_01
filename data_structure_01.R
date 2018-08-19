#Data Structures 

#vectors----
# store one data type
v1 <- 1:10000 # create vector from 1 to 10000
v2 <- c(1,4,15,9)
v2
class(v1)
class(v2)
v3 <- c('a','haren','shiva')
v3
class(v3)
v4 <- c(TRUE, FALSE, T, F)
v4
class(v4)

#summary on vectors
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(v1)
hist(women$height) # histogram of women height
v2[v2>=5]

#create a data set of 60 students from a normal distribution with mean = 60 and standard deviation = 10
x <- rnorm(60, mean = 60 , sd = 10)
plot(x)
hist(x)
plot(density(x)) # draw density 
abline(v=60) # draw vertical line x = 60

# rectangles and density together
hist(x, freq = F)
lines(density(x))
hist(x, breaks=10, col = 1:10, freq = F)
lines(density(x))
length(x)
sd(x)

#sampling
x1 <- LETTERS[5:20]
x1
set.seed(1234)
y1 <- sample(x1)
y1
set.seed(6)
(y2 <- sample(x1, size = 5))

(gender <- sample(c('M', 'F'), size = 10000, replace = TRUE , prob = c(0.6, 0.4)))
t1 <- table(gender)
prop.table(t1)

#pie plot
pie(t1)

#barplot
barplot(t1, col = 1:20, horiz = F)

#matrix----
#store one data type 2 dimensional data

(m1 <- matrix(1:24 , nrow = 4))
(m2 <- matrix(1:24 , nrow = 4, byrow = T))
(m3 <- matrix(1:24, ncol = 4, byrow = T))

(x <- round(runif(60, min = 60, max = 100),2))
#round , trunc , ceiling, float
plot(x)
plot(density(x))

m4 <- matrix(x, ncol = 6)
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)

#filtering matrix
m4[m4 > 67 & m4<83]
m4[10, ]
m4[8:10, ]
m4[8:10, c(1,3,5)]

rowSums(m4[8:10, c(1,3,5)])

#array----


#data frame -----
# frame - roll.no. , Name, gender, course , marks1, marks2
#         Int      , characters  , characters, numeric, numeric
temp_size <- 60
(rollno <- 1:temp_size)
(name <- paste('student', 1:temp_size, sep = '-'))
(gender <- sample(c('M', 'F'),size = temp_size, prob = c(0.7,0.3),replace = TRUE))
(course <- sample(c('BBA', 'MBA', 'FPM'), size=temp_size, prob = c(0.2, 0.5, 0.3), replace = T))
(marks1 <- rnorm(n = temp_size, mean = 53, sd = 14))
(marks2 <- ceiling(rnorm(n = temp_size, mean = 67, sd = 8)))
(grades <- sample(c('A', 'B', 'C'), size = temp_size,replace = T,prob = c(0.3,0.3,0.4)))
students = data.frame(rollno, name, gender, course, marks1, marks2, grades, stringsAsFactors = F)
class(students)

summary(students) # A summary of data frame
students[, c('name')]
students[students$gender=='M', c('rollno', 'gender', "marks1")]
students[students$gender=='F' & students$marks1 > 70, c('rollno', "gender", "marks1")]
barplot(table(students$course)) # an exaple plotting 
str(students)
nrow(students)
dim(students)
head(students)
tail(students)
head(students, n=8)
students[,c('gender','marks1')]
students[ 23:29, ]

# avg marks scored by each gender in marks1
#gender marks
aggregate(students$marks1, by = list(students$gender), FUN= mean)

#max marks scored in subject2 in each course in each gender
aggregate(students$marks2, by= list(students$course, students$gender), FUN = max)

#extra commands
hist(marks1)
table(course)
name[c(5,20,35)]
name[-1]
name[-c(1:10)]
rev(name)
name[60:1]

#dpylr----
#loading library
library(dplyr)

students %>% group_by(gender) %>% summarise(mean(marks1))
students %>% group_by(course, gender) %>% summarise(meanmarks1 = mean(marks1), max(marks2)) %>% arrange(desc(meanmarks1))
students %>% arrange(desc(marks1)) %>% select(name,marks1) %>% filter(gender=='M') %>% top_n(5)


#select 10% of rows on random - sample_fraction
students %>% sample_frac( size = 0.1, replace = F, weight =NULL) %>% arrange(course)
# select 5 rows randomly
students %>% sample_n( size = 5, replace = F, weight = NULL)
students %>% arrange(desc(course), gender, marks1)
students %>% arrange(course, grades, marks1) %>% select(course,grades, marks1)


#factor ----
names(students)
students$gender <- factor(students$gender)
summary(students$gender)

students$course <- factor(students$course, ordered = T, levels = c('FPM', 'MBA', 'BBA'))
summary(students$course)
class(students$grades)
students
summary(students)

#imort and export data ----
write.csv(students,'./data/iimtrichy.csv')
students2 <- read.csv('./data/iimtrichy.csv')
students2 <- students2[,c('rollno', "name", "gender", "course", "marks1", "marks2", "grades")]
students2

students3 <- read.csv(file.choose())
head(students3)

