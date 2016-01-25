for_class <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, nrows=50)
classes <- sapply(for_class, class)
all <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses =classes)
feb1 <- subset(all, Date=="1/2/2007")
feb2 <- subset(all, Date=="2/2/2007")
feb <- rbind(feb1,feb2)

png(filename="plot1.png", width=480, height=480, units="px")

hist(feb$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
