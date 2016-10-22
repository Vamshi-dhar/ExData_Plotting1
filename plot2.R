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
#plot2:
png("plot2.png", width=480, height=480)
plot(household$datetime,household$Global_active_power, type = "l",xlab = "",
     ylab = "Global Active Power(kilowatts)")
dev.off()