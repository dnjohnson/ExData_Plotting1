#Read data and subset by 2007-02-01 to 2007-02-02
data = read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Render plot to png file
png(file="plot2.png")
par(bg="transparent")
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()