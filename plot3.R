

mydata <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata$Time <- strptime(paste(mydata$Date,mydata$Time, sep = " "), "%Y-%m-%d %H:%M:%S")


SampleData <- mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]


png(file = "./plot3.png")

plot(SampleData$Time, SampleData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(SampleData$Time, SampleData$Sub_metering_1, type = "l", col = "black")
points(SampleData$Time, SampleData$Sub_metering_2, type = "l", col = "red")
points(SampleData$Time, SampleData$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()


