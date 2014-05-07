#assume that the data is in the same working folder in which the script
#Call Library
library(data.table)

#read data fast
data<-fread("household_power_consumption.txt",na.strings=c("?"))
#data type to Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Select data en period 2007-02-01 ->> 2007-02-02
data2 <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
#data type to numeric
data2$Global_active_power<-as.numeric(data2$Global_active_power)

#Graph 1 
#create and config png device
png("plot1.png", width=480, height=480, units="px")
#create histogram
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close png device
dev.off()
