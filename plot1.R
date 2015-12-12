#--------------
# File:         plot1.R
# Description:  Generates plot1.png  
#--------------

hpc.data <- readRDS("hpc.Rdata")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", bg = "transparent", 
    type = c("cairo", "cairo-png", "Xlib", "quartz"))

hist(hpc.data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()
