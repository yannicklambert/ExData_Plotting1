 power = read.table("C:\\temp\\household_power_consumption.txt", header=TRUE, sep=";")

 power$Date = as.Date(power$Date,format="%d/%m/%Y")

temp = subset(power, Date == as.Date("2007-02-01", format="%Y-%m-%d" ) | Date == as.Date("2007-02-02", format="%Y-%m-%d") )


temp$Global_active_power = as.numeric(temp$Global_active_power)

#Figure 1
png(filename = "c:\\temp\\plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white")
par(mfrow = c(1,1))
hist(temp$Global_active_power / 500, col="red", main="Global Active Power",  xlab="Global Active Power (Kilowatt")
dev.off()


