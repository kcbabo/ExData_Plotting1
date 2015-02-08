# plot1.R
# Loads power consumption data for 2007-02-01 and 2007-02-02, creates a 
# histogram of Global_active_power, and saves the histogram in "plot1.png".

# Load all the data
power <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Subset the power data to include only the dates we're interested in and
# grab the Global_active_power readings from those dates
targetRange <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
gaPower <- as.numeric(targetRange$Global_active_power)

# Create histogram and save to PNG
png(filename = "plot1.png",width = 480, height = 480)
hist(gaPower, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
