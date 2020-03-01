library(dplyr)
library(data.table)
HPC <- read.table("a/household_power_consumption.txt", skip = 1, sep = ";",na.strings = "?")
names(HPC) <- c("Date","Time","Global_active_power","1","1","1","1","1","1")
HPC2 <- subset(HPC,HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007" )
TimeDate <- strptime(paste(HPC2$Date, HPC2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(HPC2$Global_active_power)
plot(TimeDate, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

