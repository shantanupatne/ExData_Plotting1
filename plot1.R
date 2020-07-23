library(lubridate)

#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#convert to Date format and extract necessary data
data$Date <- dmy(data$Date)
data <- data[data$Date == ymd("2007/02/01") | data$Date == ymd("2007/02/02"), ]

#plot histogram
hist(as.numeric(data$Global_active_power), breaks = 12, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

#Save to png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()