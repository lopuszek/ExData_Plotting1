data<-read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?", 
                 nrows=2075259)
data$Date<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
power<-subset(data, Date>='2007-02-01 00:00:00' & Date<='2007-02-03 00:00:00',select=-Time)

with(power, plot(Date, Global_active_power, type="l", xlab="", 
                 ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()
