## Reading all the data from the file. Assuming that the data has been unzipped already

powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE,  stringsAsFactors = FALSE, dec=".")

## Converting the Date column as DATE type

powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")

## Selecting data with Dates as 01-Feb-2007 and 02-Feb-2007

febPowerData <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")

## Combining Date and Time column as one for X - Axis
dateTime <- strptime(paste(febPowerData$Date, febPowerData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

## Converting the Sub_metering_1, Sub_metering_2 & Sub_metering_3 column as NUMERIC type for Y-Axis
subMetering_1 <- as.numeric(febPowerData$Sub_metering_1)
subMetering_2 <- as.numeric(febPowerData$Sub_metering_2)
subMetering_3 <- as.numeric(febPowerData$Sub_metering_3)

## Plotting the histogram and saving it as PNG type
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, subMetering_2, type="l", col="red")
lines(dateTime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch = 20)
dev.off()