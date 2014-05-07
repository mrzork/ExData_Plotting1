#assume that the data is in the same working folder in which the script
#Call Library
library(data.table)

#change the local language settings for the axis are labeled correctly
Sys.setlocale("LC_TIME", "US")
#read data fast
data<-fread("household_power_consumption.txt",na.strings=c("?"))
#data type to Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Select data en period 2007-02-01 ->> 2007-02-02
data2 <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
#data type to numeric
data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$Sub_metering_1<-as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2<-as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3<-as.numeric(data2$Sub_metering_3)
data2$Voltage<-as.numeric(data2$Voltage)
data2$Global_reactive_power<-as.numeric(data2$Global_reactive_power)
ax<-c(weekdays(data2$Date[data2[1,1]],abbreviate =TRUE),weekdays(data2$Date[(dim(data2)[1]/2)+1],abbreviate =TRUE),weekdays(data2$Date[dim(data2)[1]]+1,abbreviate =TRUE))

#Graph 3
#create and config png device
png("plot3.png", width=480, height=480, units="px")
#plot data
plot(data2$Sub_metering_1, type="l",xaxt="n",xlab="", ylab="Energy Sub metering")
points(data2$Sub_metering_2,col="red",type="l")
points(data2$Sub_metering_3,col="blue",type="l")
#config axis label
axis(1, at=c(1,dim(data2)[1]/2, dim(data2)[1]), labels=ax)
#create legend data
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#close png device
dev.off()