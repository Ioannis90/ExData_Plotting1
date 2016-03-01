#####################Read data###########
File = file("household_power_consumption.txt")
consumption = read.table(File, sep = ";", col.names = c("Date","Time","Global_active_power",
                                       "Global_reactive_power","Voltage",
                                       "Global_intensity","Sub_metering_1",
                                       "Sub_metering_2","Sub_metering_3"), 
                         header = TRUE)

consFinal <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#########Create Histogram#############
hist(as.numeric(consFinal$Global_active_power),
     main ="Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab ="Frequency", col = "red")

dev.copy(device = png, file="plot1.png", height=480, width=480)
dev.off()

