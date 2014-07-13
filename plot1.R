t1 <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings=c("?"), header=TRUE)
t1$Date <- as.Date(t1$Date, "%d/%m/%Y")

sub <- t1[t1$Date == "2007-02-01" | t1$Date == "2007-02-02",]
sub$datetime <- strptime(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot1.png", width=480, height=480, units="px")
hist(sub$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()