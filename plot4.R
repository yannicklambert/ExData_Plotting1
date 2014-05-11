 power = read.table("C:\\temp\\household_power_consumption.txt", header=TRUE, sep=";")

 power$Date = as.Date(power$Date,format="%d/%m/%Y")

temp = subset(power, Date == as.Date("2007-02-01", format="%Y-%m-%d" ) | Date == as.Date("2007-02-02", format="%Y-%m-%d") )


temp$Global_active_power = as.numeric(temp$Global_active_power)


temp$DateTime = as.POSIXct(paste(temp$Date, temp$Time), format="%Y-%m-%d %H:%M:%S")



temp$Sub_metering_1 = as.numeric(temp$Sub_metering_1)
temp$Sub_metering_2 = as.numeric(temp$Sub_metering_2)
temp$Sub_metering_3 = as.numeric(temp$Sub_metering_3)


#Figure 4
png(filename = "c:\\temp\\plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white")

par(mfrow = c(2, 2))
plot(temp$DateTime, temp$Global_active_power / 500, type="l", xlab="", ylab="Global Active Power")
plot(temp$DateTime, temp$Voltage, type="l", xlab="DateTime", ylab="Voltage")
plot(temp$DateTime, temp$Sub_metering_1 - 2, type="l", xlab="", ylab="Energy sub metering")
lines(temp$DateTime, (temp$Sub_metering_2 - 2) / 10, lwd="2", col="red")
lines(temp$DateTime, temp$Sub_metering_3, lwd="3", col="blue")
plot(temp$DateTime, temp$Global_active_power / 5000, type="l", xlab="datetime", ylab="global_active_power")
dev.off()

