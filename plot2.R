##reads the data from 2/1/2007-2/2/2007 and adds column names
data <- read.table("household_power_consumption.txt", skip = 66637, nrows=2880, sep = ";")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##converts the date and time to a single Datetime column
data <- mutate(data, Datetime = as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))

##opens the png graphics device at the specified size
png(file="plot2.png", width = 480, height = 480)

##plots Global_active_power vs. time as a line without points
plot(data$Datetime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

##turns off the png device
dev.off()
