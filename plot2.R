for_class <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, nrows=50)
classes <- sapply(for_class, class)
all <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses =classes)
all$Date <- as.Date(all$Date, format="%d/%m/%Y")
feb <- subset(all, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(feb$Date), feb$Time)
feb$DateTime <- as.POSIXct(datetime)

png(filename="plot2.png", width=480, height=480, units="px")
plot(feb$Global_active_power ~ feb$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
