# plot4.R
# Loads power consumption data for 2007-02-01 and 2007-02-02, creates a 
# line plot of each sub-metering reading over days, and saves the plot 
# in "plot4.png".

# Load all the data
power <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Subset the power data to include only the dates we're interested in
targetRange <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
# Combine date and time in a new column
targetRange$dateTimes <-  as.POSIXct(paste(targetRange$Date, targetRange$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot and save to PNG
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), cex = "0.75", oma = c(1, 1, 2, 1))
with(targetRange, {
    # Plot 1 - Top Left
    plot(dateTimes, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    # Plot 2 - Top Right
    plot(dateTimes, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    # Plot 3 - Bottom Left
    plot(dateTimes, Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")
        with(targetRange, points(dateTimes, Sub_metering_2, col = "red", type = "l"))
        with(targetRange, points(dateTimes, Sub_metering_3, col = "blue", type = "l"))
        legend("topright", lty = 1, bty = 'n', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # Plot 4 - Bottom Right
    plot(dateTimes, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()
