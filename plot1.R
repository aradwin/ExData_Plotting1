## R programming - Exploratory Data analysis

library(lubridate)  # from C-RAN, allows easy conversion of dates
all_power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
my_power <- my_power[my_power$Date == "1/2/2007" | my_power$Date == "2/2/2007",]

#convert the factors to numeric values
my_power$Global_active_power <- as.numeric(as.character(my_power$Global_active_power))


# plot #1
png(file="plot1.png",width=480, height=480)
par(mfrow = c(1,1), oma = c(0,0,0,0), mar = c(5,4,4,2))
hist(my_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


