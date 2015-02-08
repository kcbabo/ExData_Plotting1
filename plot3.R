# plot3.R
# Loads power consumption data for 2007-02-01 and 2007-02-02, creates a 
# line plot of each sub-metering reading over days, and saves the plot 
# in "plot3.png".

# Load all the data
power <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Subset the power data to include only the dates we're interested in
targetRange <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
# Combine date and time in a new column
targetRange$dateTimes <-  as.POSIXct(paste(targetRange$Date, targetRange$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot and save to PNG
png(filename = "plot3.png", width = 480, height = 480)
with(targetRange, plot(dateTimes, Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = ""))
with(targetRange, points(dateTimes, Sub_metering_2, col = "red", type = "l"))
with(targetRange, points(dateTimes, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
