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

# Launch graphics device
png(filename = "plot1.png")

# Make plot
hist(powerData$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")

# Close graphics device
dev.off()
