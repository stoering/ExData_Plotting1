##reads the data from 2/1/2007-2/2/2007 and adds column names
data <- read.table("household_power_consumption.txt", skip = 66637, nrows=2880, sep = ";")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##converts the date and time to a single Datetime column
data <- mutate(data, Datetime = as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))

##opens the png graphics device at the specified size
png(file="plot4.png", width = 480, height = 480)

##sets up a 2x2 array of panels that will fill by row
par(mfrow=c(2,2))

##plots Global_active_power vs. time as a line without points in panel 1
plot(data$Datetime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

##plots Voltage vs. time in panel 2
plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##plots Sub_metering_1 vs. time as a line without points in panel 3
# Create a first line
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
# Add a second line--Sub_metering_2 in red
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
# Add a third line--Sub_metering_3 in blue
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
# Add a legend to the plot
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, cex=0.8)

##plots Global_reactive_power vs. time as a line for panel 4
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##turns off the png device
dev.off()