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
#Plot4:
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
plot(household$datetime, household$Global_active_power, type = "l",xlab = "", 
     ylab = "Global Active Power")
plot(household$datetime, household$Voltage,type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(household$datetime, household$Sub_metering_1, type = "l", col = "black",
     xlab = "",ylab = "Energy sub metering")
lines(household$datetime, household$Sub_metering_2, type = "l", col = "red")
lines(household$datetime,household$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red","blue"), lty = 1, 
       legend =c("sub_metering_1","sub_metering_2","sub_metering_3"), bty = "n",
       cex=0.7)
plot(household$datetime, household$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()