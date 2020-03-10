##Plot 1
data1 = fread(file = "Household_Power_Consumption.txt", na.strings = "?")
Housedata <-subset(data1, data1$Date %in% c("1/2/2007", "2/2/2007"))
xdate <-strptime(Housedata$Date, "%d/%m/%Y")
#Format date for axis and plotting
datetime <-as.POSIXct(paste(as.Date(xdate), Housedata$Time))
#Format variables for plotting
GAP <-as.numeric(Housedata$Global_active_power)
#Set up screen device
png("plot1.png", width = 480, height = 480)
hist(GAP, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()