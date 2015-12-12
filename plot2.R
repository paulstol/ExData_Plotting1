library(dplyr)

powerFile <- "household_power_consumption.txt"

# Read in data for Feb 1 & 2, 2007
powerData <- read.table(powerFile,
                        sep = ";",
                        dec = ".",
                        na.strings = "?",
                        nrows = 2880,
                        skip = 66637)

# Read in variable names
names(powerData) <- names(read.table(powerFile, 
                                     header = TRUE,
                                     sep = ";",
                                     nrows = 0))

# Add a new column with Date and Time
powerData <- mutate(powerData, DateAndTime = as.POSIXct(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S"))

# Launch graphics device
png(filename = "plot2.png")

# Make plot
plot(powerData$DateAndTime,
     powerData$Global_active_power, 
     type = "l",
     xlab = "",  
     ylab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()