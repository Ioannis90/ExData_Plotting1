#####################Read data###########
File = file("household_power_consumption.txt")
consumption = read.table(File, sep = ";", col.names = c("Date","Time","Global_active_power",
                                                        "Global_reactive_power","Voltage",
                                                        "Global_intensity","Sub_metering_1",
                                                        "Sub_metering_2","Sub_metering_3"), 
                         header = TRUE)

consFinal <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
consFinal$Date <- as.Date(consFinal$Date, format = "%d/%m/%Y")
dateTime <- as.POSIXct(paste(as.Date(consFinal$Date), consFinal$Time))


plot(dateTime, consFinal$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, consFinal$Sub_metering_2, type="l", col="red")
lines(dateTime, consFinal$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
png("plot3.png", width=480, height=480)
dev.off()