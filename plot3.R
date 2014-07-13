#Read data and subset by 2007-02-01 to 2007-02-02
data = read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Render plot to png file
png(file="plot3.png")
par(bg="transparent")
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_1, type="l")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()