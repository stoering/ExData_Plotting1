##reads the data from 2/1/2007-2/2/2007 and adds column names
data <- read.table("household_power_consumption.txt", skip = 66637, nrows=2880, sep = ";")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##converts the date and time to a single Datetime column
data <- mutate(data, Datetime = as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))

##opens the png graphics device at the specified size
png(file="plot3.png", width = 480, height = 480)

##plots Sub_metering_1 vs. time as a line without points
# Create a first line
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
# Add a second line--Sub_metering_2 in red
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
# Add a third line--Sub_metering_3 in blue
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
# Add a legend to the plot
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, cex=0.8)

##turns off the png device
dev.off()
