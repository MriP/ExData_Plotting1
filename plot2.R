## Reading all the data from the file. Assuming that the data has been unzipped already

powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE,  stringsAsFactors = FALSE, dec=".")

## Converting the Date column as DATE type

powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")

## Selecting data with Dates as 01-Feb-2007 and 02-Feb-2007

febPowerData <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")

## Combining Date and Time column as one for X - Axis
dateTime <- strptime(paste(febPowerData$Date, febPowerData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

## Converting the Global_active_power column as NUMERIC type for Y-Axis
globalActivePower <- as.numeric(febPowerData$Global_active_power)

## Plotting the histogram and saving it as PNG type
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()