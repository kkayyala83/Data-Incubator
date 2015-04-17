
Mean_Std <- function (M)
{
count <- data.frame(0)

z<-data.frame(0)
for(i in 1:10000){
  x<-data.frame(0)
  count_itr = 0
  y=0
  while (y<M){
    
    x<-sample(seq(1,6),1)
    y<-y+x
    count_itr <- count_itr + 1
   
  }
  z[i]<-y
  count[i] <- count_itr
}
z<-do.call(rbind,z)
count <- do.call(rbind, count)
Alpha<-(z-M)

result = c(mean(Alpha), sd(Alpha), mean(count), sd(count))
names(result) = c("Mean_SUM-M", "Std_SUM-M", "Mean_NoOfRolls", "Std_NoOfRolls")

return(result)
}
Mean_Std(20);
Mean_Std(10000)