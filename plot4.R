data<-read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?", 
                 nrows=2075259)
data$Date<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
power<-subset(data, Date>='2007-02-01 00:00:00' & Date<='2007-02-03 00:00:00',select=-Time)


par(mfrow=c(2,2))
with(power, plot(Date, Global_active_power, type="l", xlab="", 
                 ylab="Global Active Power (kilowatts)"))

with(power, plot(Date, Voltage, type="l", xlab=""))

with(power, plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(power, lines(Date, Sub_metering_2, col="red"))
with(power, lines(Date, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1))

with(power, plot(Date, Global_reactive_power, type="l", xlab=""))
par(mfrow=c(1,1))
dev.copy(png,file="plot4.png")
dev.off()
