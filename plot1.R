

mydata <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata$Time <- strptime(paste(mydata$Date,mydata$Time, sep = " "), "%Y-%m-%d %H:%M:%S")


SampleData <- mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02",]


png(file = "./plot1.png")

hist(SampleData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()


