#--------------
# File:         importData.R
# Description:  Creates the Rdata file for use in analysis  
#--------------

## Download the file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=url, destfile="dataset.zip", mode="curl") 

## Extract the file
# This code runs on Linux and may have unexpected results on other platforms
unzip ("dataset.zip", exdir = "./")

## Reference to extracted file
datafile <- "household_power_consumption.txt"

## File is way too big for my computer!!
#data.hpc <- read.table(file = datafile, header = TRUE, sep = ";", na.strings = "?")

## Instead, just read the lines Lines 66638 - 69517 which corresond to the dates for analysis
data.hpc <- read.table(file = datafile, header = FALSE, sep = ";",
                       na.strings = "?", skip = 66637, nrows = 2880)

## Check the data
head(data.hpc) #start date should be 1/2/2007;00:00:00
tail(data.hpc) #end date should be 2/2/2007;23:59:00

## Get the header for the data file
colNames <- scan(file = datafile, sep = ";", nlines = 1, what = "character")
names(data.hpc) <- colNames


## Instructor recommendations
#data.hpc$Date <- as.Date(data.hpc.test$Date)
#as.POSIXlt(data.hpc.test$Time, format = "%H:%M:%S")
#data.hpc$Time <- strptime(data.hpc.test$Time, format = "%H:%M:%S")

## Screw the above recommendations.  Here is a better approach:
data.hpc$DateTime <- with(data.hpc, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

## Save the data as an Rdata file.  It's nice and compact.
saveRDS(data.hpc, "hpc.Rdata")
