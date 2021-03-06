library(dplyr)
library(data.table)
HPC <- read.table("a/household_power_consumption.txt", skip = 1, sep = ";",na.strings = "?")
names(HPC) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
HPC2 <- subset(HPC,HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007" )
TimeDate <- strptime(paste(HPC2$Date, HPC2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(HPC2$Global_active_power)
HPC2$Sub_metering_1 <- as.numeric(HPC2$Sub_metering_1)
HPC2$Sub_metering_2 <- as.numeric(HPC2$Sub_metering_2)
HPC2$Sub_metering_3 <- as.numeric(HPC2$Sub_metering_3)
plot(TimeDate, HPC2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, HPC2$Sub_metering_2, type="l", col="red")
lines(datetime, HPC2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

