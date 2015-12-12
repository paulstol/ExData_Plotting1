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
png(filename = "plot4.png")

# Make plot
par(mfrow = c(2, 2), mar = c(4, 4, 3, 2), oma = c(1, 1, 0, 0)) 
with(powerData, {
     # Upper Left Plot
     plot(DateAndTime,
          Global_active_power, 
          type = "l",
          xlab = "",  
          ylab = "Global Active Power")
     
     # Upper Right Plot
     plot(DateAndTime,
          Voltage, 
          type = "l",
          xlab = "datetime",  
          ylab = "Voltage")
     
     #Lower Left Plot
     plot(DateAndTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
     lines(DateAndTime, Sub_metering_2, type = "l", col = "red")
     lines(DateAndTime, Sub_metering_3, type = "l", col = "blue")
     legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), bty = "n")
     
     # Lower Right Plot
     plot(DateAndTime,
          Global_reactive_power, 
          type = "l",
          xlab = "datetime",  
          ylab = "Global_reactive_power")
})

# Close graphics device
dev.off()
