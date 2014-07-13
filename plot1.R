#Read data and subset by 2007-02-01 to 2007-02-02
data = read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Render plot to png file
png(file="plot1.png")
par(bg="transparent")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()