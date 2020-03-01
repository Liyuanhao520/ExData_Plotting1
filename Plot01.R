library(dplyr)
library(data.table)
HPC <- read.table("a/household_power_consumption.txt", skip = 1, sep = ";",na.strings = "?")
names(HPC) <- c("Date","Time","Global_active_power","1","1","1","1","1","1")
HPC2 <- subset(HPC,HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007" )
hist(as.numeric(as.character(HPC2$Global_active_power)),col="red",
    main="Global Active Power",xlab="Global Active Power(kilowatts)")
