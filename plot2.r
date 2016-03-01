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
Final <- as.numeric(consFinal$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, Final, type = "l", xlab="", 
     ylab = "Global active power (kilowatts)")


dev.copy(device = png, file="plot2.png", height=480, width=480)
dev.off()