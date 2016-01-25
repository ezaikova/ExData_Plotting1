for_class <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, nrows=50)
classes <- sapply(for_class, class)
all <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses =classes)
all$Date <- as.Date(all$Date, format="%d/%m/%Y")
feb <- subset(all, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(feb$Date), feb$Time)
feb$DateTime <- as.POSIXct(datetime)

png(filename="plot3.png", width=480, height=480, units="px")

with(feb, plot(Sub_metering_1 ~ DateTime, type="l", ylab= "Energy sub metering", xlab=""))
lines(feb$Sub_metering_2 ~ feb$DateTime, col="red")
lines(feb$Sub_metering_3 ~ feb$DateTime, col="blue")
legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)


dev.off()