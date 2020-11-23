##reads the data from 2/1/2007-2/2/2007 and adds column names
data <- read.table("household_power_consumption.txt", skip = 66637, nrows=2880, sep = ";")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##opens the png graphics device at the specified size
png(file="plot1.png", width = 480, height = 480)

##plots the histogram of Global_active_power
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##turns off the graphics device
dev.off()
