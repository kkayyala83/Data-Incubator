
data = read.csv("Q1_$5.csv")
head(data)

ratecode <- data$rate_code
fareamount <- data$fare_amount
totalamount <- data$total_amount
distance <- data$trip_distance
plot(fareamount, distance)
hist(ratecode, fareamount)
head(ratecode)
mean(fareamount)
mean(totalamount)
cou
(totalamount)

numbers <- c(1:100)
numbers
x <- numbers[1:50]
x