#--------------
# File:         plot3.R
# Description:  Generates plot3.png  
# Data:         See importData.R file
#--------------

## Ensure this data file is in the same folder as this script
hpc.data <- readRDS("hpc.Rdata")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", bg = "transparent", 
    type = c("cairo", "cairo-png", "Xlib", "quartz"))

plot(hpc.data$Sub_metering_1 ~ hpc.data$DateTime, 
     xlab = "", ylab = "Energy sub metering", type = 'n')

lines(hpc.data$Sub_metering_1 ~ hpc.data$DateTime, col = "black")
lines(hpc.data$Sub_metering_2 ~ hpc.data$DateTime, col = "red")
lines(hpc.data$Sub_metering_3 ~ hpc.data$DateTime, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", col = c("black", "red", "blue"))

dev.off()
