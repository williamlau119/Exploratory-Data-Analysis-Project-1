##Plot 3
data1 = fread(file = "Household_Power_Consumption.txt", na.strings = "?")
Housedata <-subset(data1, data1$Date %in% c("1/2/2007", "2/2/2007"))
xdate <-strptime(Housedata$Date, "%d/%m/%Y")
#Format date for axis and plotting
datetime <-as.POSIXct(paste(as.Date(xdate), Housedata$Time))
#Format variables for plotting
GAP <-as.numeric(Housedata$Global_active_power)
Sub_metering_1 <- as.numeric(Housedata$Sub_metering_1)
Sub_metering_2 <- as.numeric(Housedata$Sub_metering_2)
Sub_metering_3 <- as.numeric(Housedata$Sub_metering_3)
#Set up screen device
png("plot3.png", width = 480, height = 480)
plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime,Sub_metering_2, type = "l", col = "red")
lines(datetime,Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), bty = "o", lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()