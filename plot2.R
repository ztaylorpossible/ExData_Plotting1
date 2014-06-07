png(file = "plot2.png")
data <- read.table("household_power_consumption.txt", header=TRUE,
                   sep=";", na.strings = "?")
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data <- cbind(data, strptime(paste(data$Date, data$Time),
                             format = "%d/%m/%Y %H:%M:%S"))
colnames(data)[10] = "datetime"
plot(data$datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()