# plot2.R
# Loads power consumption data for 2007-02-01 and 2007-02-02, creates a 
# line plot of Global_active_power over days, and saves the plot in "plot2.png".

# Load all the data
power <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Subset the power data to include only the dates we're interested in
targetRange <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
# Combine date and time in a new column
targetRange$dateTimes <-  as.POSIXct(paste(targetRange$Date, targetRange$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot and save to PNG
png(filename = "plot2.png", width = 480, height = 480)
with(targetRange, plot(dateTimes, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
