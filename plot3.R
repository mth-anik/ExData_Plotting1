#reading data
raw_data<-read.csv2("household_power_consumption.txt")

#converting into a tidy data set named 'days'
day1<-subset(raw_data,Date=='1/2/2007')
day2<-subset(raw_data,Date=='2/2/2007')
days<-rbind(day1,day2)

#converting character into time
dt=paste(days$Date,days$Time)
date_time<-strptime(dt,format = '%d/%m/%Y %H:%M:%S')
date_time<-as.POSIXct(date_time)
days$Date<-date_time
names(days)[1]<-'date_time'

#converting the data into numbers
days$Sub_metering_1<-as.numeric(days$Sub_metering_1)
days$Sub_metering_2<-as.numeric(days$Sub_metering_2)
days$Sub_metering_3<-as.numeric(days$Sub_metering_3)

#creting the plot
par(mfrow=c(1,1))
plot(days$date_time,days$Sub_metering_1,type='l',xlab='',ylab = 'Energy Sub Metering')
lines(days$date_time,days$Sub_metering_2,type='l',col='red')
lines(days$date_time,days$Sub_metering_3,type='l',col='blue')
legend('topright',lty = c("solid","solid","solid"),col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=.75,y.intersp = 0.4)
dev.copy(png,file='plot3.png',width=480,height=480)
dev.off()