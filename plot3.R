t1 <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings=c("?"), header=TRUE)
t1$Date <- as.Date(t1$Date, "%d/%m/%Y")

sub <- t1[t1$Date == "2007-02-01" | t1$Date == "2007-02-02",]
sub$datetime <- strptime(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot3.png", width=480, height=480, units="px")
with(sub, plot(sub$datetime, sub$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
points(sub$datetime, sub$Sub_metering_1, type="l")
points(sub$datetime, sub$Sub_metering_2, type="l", col="red")
points(sub$datetime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()