png(file = "plot4.png")
data <- read.table("household_power_consumption.txt", header=TRUE,
                   sep=";", na.strings = "?")
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data <- cbind(data, strptime(paste(data$Date, data$Time),
                             format = "%d/%m/%Y %H:%M:%S"))
colnames(data)[10] = "datetime"
par(mfcol = c(2, 2))

plot(data$datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(data$datetime, data$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy Sub Metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1), col=c("black", "red", "blue"), bty = "n")

plot(data$datetime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(data$datetime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()