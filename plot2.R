 power = read.table("C:\\temp\\household_power_consumption.txt", header=TRUE, sep=";")

 power$Date = as.Date(power$Date,format="%d/%m/%Y")

temp = subset(power, Date == as.Date("2007-02-01", format="%Y-%m-%d" ) | Date == as.Date("2007-02-02", format="%Y-%m-%d") )


temp$Global_active_power = as.numeric(temp$Global_active_power)


#figure 2
temp$DateTime = as.POSIXct(paste(temp$Date, temp$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "c:\\temp\\plot2.png", width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white")
par(mfrow = c(1,1))
plot(temp$DateTime, temp$Global_active_power / 500, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()


