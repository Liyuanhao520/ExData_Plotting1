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
voltage <- as.numeric(HPC2$Voltage)

par(mfrow = c(2, 2),mar =  c(4, 4, 2, 1))
with(HPC2,{
plot(TimeDate, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.3)
plot(TimeDate, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(TimeDate, HPC2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(TimeDate, HPC2$Sub_metering_2, type="l", col="red")
lines(TimeDate, HPC2$Sub_metering_3,type="l", col="blue",)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(TimeDate, global_Active_Power, type="l", xlab="datetime", ylab="Global_reactive_power")
