library(data.table)
library(dplyr)
library(lubridate)

unzip("exdata_data_household_power_consumption.zip")
household <- fread("household_power_consumption.txt", header = TRUE, 
                   na.strings = "?")
household <- tbl_df(household)
household <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]

png("plot1.png", width = 480, height = 480)
hist(household$Global_active_power, col = "red",
     xlab = "Global Active Power(kilowatts)")
dev.off()