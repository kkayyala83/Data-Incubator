library(sqldf)
library(ggplot2)

data = read.csv("Crimes_-_2001_to_present.csv")
crime_loc <- data.frame(data[, c(3,8)])
str(crime_loc)
crime_loc$Date <- as.character(crime_loc$Date)
crime_loc$Date <- as.POSIXct(crime_loc$Date, format = "%m/%d/%Y %H:%M:%S")
crime_loc$Date <- format(as.Date(crime_loc$Date), "%Y/%m/%d")
crime_loc <- data.frame(crime_loc$Location.Description, crime_loc$Date)
names(crime_loc) <- c("CrimeLocation", "Date")
crime_loc$Date <- format(as.Date(crime_loc$Date), "%Y-%m")
head(crime_loc)
str(crime_loc)


library(sqldf)
library(ggplot2)
CrimePlace <- data.frame(sqldf(" select * from crime_loc where Date like '2014%' and CrimeLocation <> ''"))
CrimePlace <- data.frame(sqldf(" select count(Date) as CrimeCount, CrimeLocation from CrimePlace group by CrimeLocation"))
CrimePlace <- data.frame(sqldf(" select * from CrimePlace where CrimeCount > 3000 order by CrimeLocation"))
CrimePlace
require(ggplot2)
ggplot(data = CrimePlace, aes(y=CrimeCount, x=CrimeLocation)) +  stat_summary(fun.y=mean,geom="bar") +  coord_flip() +
  ggtitle("CrimeRate at Various Locations in 2014")




crime_type <- data.frame(data[, c(3,6)])
crime_type$Date <- as.character(crime_type$Date)
crime_type$Date <- as.POSIXct(crime_type$Date, format = "%m/%d/%Y %H:%M:%S")
crime_type$Date <- format(as.Date(crime_type$Date), "%Y/%m/%d")
crime_type <- data.frame(crime_type$Primary.Type, crime_type$Date)
names(crime_type) <- c("CrimeType", "Date")
crime_type$Date <- format(as.Date(crime_type$Date), "%Y-%m")
head(crime_type)
str(crime_type)

library(sqldf)
library(ggplot2)
CrimeRate <- data.frame(sqldf(" select Date, Count(CrimeType) as CrimeCount from crime_type group by Date"))
CrimeRate <- data.frame(sqldf(" select * from CrimeRate where Date like '2011%' or Date like '2012%' or Date like '2013%' or Date like '2014%'or Date like '2015%'"))

#CrimeRateX <- data.frame(sqldf(" select * from CrimeRate where Date in ('2011%', '2012%', '2013%', '2014%', '2015%')"))
#head(CrimeRateX) 

require(ggplot2)
ggplot(data = CrimeRate, aes(x=Date, y=CrimeCount)) + geom_point() +  labs(x="Month & Year", y="CrimeCount (au)") +
  theme(axis.text.x = element_text(angle=90)) + ggtitle("CrimeRate Variation from 2011 to 2015")





