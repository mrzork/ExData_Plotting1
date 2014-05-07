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
ax<-c(weekdays(data2$Date[data2[1,1]],abbreviate =TRUE),weekdays(data2$Date[(dim(data2)[1]/2)+1],abbreviate =TRUE),weekdays(data2$Date[dim(data2)[1]]+1,abbreviate =TRUE))

#Graph 2 
#create and config png device
png("plot2.png", width=480, height=480, units="px")
#create plot
plot(data2$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
#config axis label
axis(1, at=c(1,dim(data2)[1]/2, dim(data2)[1]), labels=ax)
#close png device
dev.off()