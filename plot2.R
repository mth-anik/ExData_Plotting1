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

#creating the plot
par(col='black')
par(mfrow=c(1,1))
plot(Global_active_power~date_time,data=days,type='l',ylab='Global active power(kilowatts)',xlab='')
dev.copy(png,file='plot2.png',width=480,height=480)
dev.off()
