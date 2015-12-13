#--------------
# File:         plot2.R
# Description:  Generates plot2.png  
# Data:         See importData.R file
#--------------

## Ensure this data file is in the same folder as this script
hpc.data <- readRDS("hpc.Rdata")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", bg = "transparent", 
    type = c("cairo", "cairo-png", "Xlib", "quartz"))

plot(hpc.data$Global_active_power ~ hpc.data$DateTime, 
     xlab = "", ylab = "Global Active Power (kilowatts)", type = 'n')
lines(hpc.data$Global_active_power ~ hpc.data$DateTime)

dev.off()
