library(lubridate)

#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#convert to Date format and extract necessary data
data$Date <- dmy(data$Date)
data <- data[data$Date == ymd("2007/02/01") | data$Date == ymd("2007/02/02"),]

#combine date and time fields into one time vector
time <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#plot graph
plot(time, as.numeric(data$Global_active_power), type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

#Save to png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()