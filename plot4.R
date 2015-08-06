## R programming - Exploratory Data analysis

library(lubridate)  # from C-RAN, allows easy conversion of dates
all_power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
my_power <- my_power[my_power$Date == "1/2/2007" | my_power$Date == "2/2/2007",]

#convert the factors to numeric values
my_power$Global_active_power <- as.numeric(as.character(my_power$Global_active_power))
my_power$Sub_metering_1 <- as.numeric(as.character(testingdates$Sub_metering_1))
my_power$Sub_metering_2 <- as.numeric(as.character(testingdates$Sub_metering_2))
my_power$Voltage <- as.numeric(as.character(testingdates$Voltage))
my_power$Global_reactive_power <- as.numeric(as.character(my_power$Global_reactive_power))


# convert the date from factors to a valid POSIX object
my_power$Date <- as.character(my_power$Date)
my_power$Date <- lapply(my_power$Date, function (x){ 
  if (x == "1/2/2007") x <- "2007-2-1"
  else x<- "2007-2-2"})
my_power$Time <- as.character(my_power$Time)
z <- paste(my_power$Date, my_power$Time)
my_power$Date <- ymd_hms(z)  # function from the library lubridate


#plot 4
png(file="plot4.png",width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(0,0,0,0))
with(my_power, {
  #topleft
  plot(my_power$Date,my_power$Global_active_power,  type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  #topright
  plot(my_power$Date,my_power$Voltage,  type = "l", ylab = "Voltage", xlab = "datetime")
  
  #bottomleft
  plot(my_power$Date, my_power$Sub_metering_1, col = "black", type = "l", ylab = "Energy Sub Metering", xlab = "")
  lines(my_power$Date, my_power$Sub_metering_2, col = "red", type = "l")
  lines(my_power$Date, my_power$Sub_metering_3, col = "blue", type = "l")
  legend("topright", bty = "n", lty = c(1,1,1), cex= .9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"))
  
  #bottomright
  plot(my_power$Date, my_power$Global_reactive_power,  type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  
})
dev.off()


