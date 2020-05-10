# reading file
raw_data<-read.csv2("household_power_consumption.txt")

#converting into a tidy data set named 'days'
day1<-subset(raw_data,Date=='1/2/2007')
day2<-subset(raw_data,Date=='2/2/2007')
days<-rbind(day1,day2)

#converting the data into numbers
days$Global_active_power<-as.numeric(days$Global_active_power)

#plotting the data using base plotting system
par(mfrow=c(1,1))
hist(days$Global_active_power,col='red',xlab='Global Active Power(kilowatts)',main = 'Global Active Power')
dev.copy(png,file='plot1.png',width=480,height=480)
dev.off()