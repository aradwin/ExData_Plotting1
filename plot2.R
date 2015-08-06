## R programming - Exploratory Data analysis

library(lubridate)  # from C-RAN, allows easy conversion of dates
all_power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
my_power <- my_power[my_power$Date == "1/2/2007" | my_power$Date == "2/2/2007",]

#convert the factors to numeric values
my_power$Global_active_power <- as.numeric(as.character(my_power$Global_active_power))


# convert the date from factors to a valid POSIX object
my_power$Date <- as.character(my_power$Date)
my_power$Date <- lapply(my_power$Date, function (x){ 
  if (x == "1/2/2007") x <- "2007-2-1"
  else x<- "2007-2-2"})
my_power$Time <- as.character(my_power$Time)
z <- paste(my_power$Date, my_power$Time)
my_power$Date <- ymd_hms(z)  # function from the library lubridate



# plot 2 
png(file="plot2.png",width=480, height=480)
par(mfrow = c(1,1), oma = c(0,0,0,0), mar = c(5,4,4,2))
plot(my_power$Date, my_power$Global_active_power,  type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

