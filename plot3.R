library(data.table)
library(dplyr)
library(lubridate)

unzip("exdata_data_household_power_consumption.zip")
household <- fread("household_power_consumption.txt", header = TRUE, 
                   na.strings = "?")
household <- tbl_df(household)
household <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]
household$datetime <- strptime(paste(household$Date, household$Time), 
                               format = "%d/%m/%Y %H:%M:%S")

#plot3:
png("plot3.png", height = 480, width = 480)
plot(household$datetime,household$Sub_metering_1, col = "black", type = "l", 
     xlab ="",ylab = "Energy sub metering")
lines(household$datetime,household$Sub_metering_2, col = "red", type = "l")
lines(household$datetime,household$Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "red","blue"),lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()