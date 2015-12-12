#--------------
# File:         plot4.R
# Description:  Generates plot4.png  
#--------------

hpc.data <- readRDS("hpc.Rdata")

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", bg = "transparent", 
    type = c("cairo", "cairo-png", "Xlib", "quartz"))

par(mfrow = c(2,2))

plot(hpc.data$Global_active_power ~ hpc.data$DateTime, 
     xlab = "", ylab = "Global Active Power (kilowatts)", type = 'n')
lines(hpc.data$Global_active_power ~ hpc.data$DateTime)

plot(hpc.data$Voltage ~ hpc.data$DateTime, 
     xlab = "datetime", ylab = "Voltage", type = 'n')
lines(hpc.data$Voltage ~ hpc.data$DateTime)

plot(hpc.data$Sub_metering_1 ~ hpc.data$DateTime, 
     xlab = "", ylab = "Energy sub metering", type = 'n')
lines(hpc.data$Sub_metering_1 ~ hpc.data$DateTime, col = "black")
lines(hpc.data$Sub_metering_2 ~ hpc.data$DateTime, col = "red")
lines(hpc.data$Sub_metering_3 ~ hpc.data$DateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col = c("black", "red", "blue"), bty = "n")

plot(hpc.data$Global_reactive_power ~ hpc.data$DateTime, 
     xlab = "datetime", ylab = "Global_reactive_power", type = 'n')
lines(hpc.data$Global_reactive_power ~ hpc.data$DateTime)

dev.off()
