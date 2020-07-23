library(lubridate)

#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#convert to Date format and extract necessary data
data$Date <- dmy(data$Date)
data <- data[data$Date == ymd("2007/02/01") | data$Date == ymd("2007/02/02"),]

#combine date and time fields into one time vector
time <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#create grid
par(mfrow = c(2,2))

#plot various graphs
#plot 1
plot(time, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")

#plot 2
plot(time, as.numeric(data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3
plot(time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(time, data$Sub_metering_2, col = "red", type = "l")
lines(time, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.75)

#plot 4
plot(time, as.numeric(data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Save to png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()