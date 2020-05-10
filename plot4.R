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
days$Global_active_power<-as.numeric(days$Global_active_power)
days$Sub_metering_1<-as.numeric(days$Sub_metering_1)
days$Sub_metering_2<-as.numeric(days$Sub_metering_2)
days$Sub_metering_3<-as.numeric(days$Sub_metering_3)
days$Voltage<-as.numeric(days$Voltage)
days$Global_reactive_power<-as.numeric(days$Global_reactive_power)

par(mfrow=c(2,2),mar=c(4,4,2,1))

#creating plot 1,1
plot(Global_active_power~date_time,data=days,type='l',ylab='Global active power(kilowatts)',xlab='')

#creating plot 1,2
plot(Voltage~date_time,data=days,type='l',xlab='datetime',ylab = 'Voltage')

#creating plot 2,1
plot(days$date_time,days$Sub_metering_1,type='l',xlab='',ylab = 'Energy Sub Metering')
lines(days$date_time,days$Sub_metering_2,type='l',col='red')
lines(days$date_time,days$Sub_metering_3,type='l',col='blue')
legend('topright',lty = c("solid","solid","solid"),col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=.45,y.intersp = 0.6,x.intersp = 0.4)

#creating the plot 2,2
plot(Global_reactive_power~date_time,data=days,type='l',xlab='datetime',ylab = 'Global_reactive_power')

dev.copy(png,file='plot4.png',width=480,height=480)
dev.off()
