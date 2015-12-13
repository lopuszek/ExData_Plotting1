data<-read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?", 
                 nrows=2075259)
data$Date<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
power<-subset(data, Date>='2007-02-01 00:00:00' & Date<='2007-02-03 00:00:00',select=-Time)

with(power,hist(Global_active_power,breaks=12, col="red", main="Global Activ Power", 
                xlab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off()
