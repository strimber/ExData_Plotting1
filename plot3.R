## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

hpc <- read.csv("~/Coursera Files/ExploratoryDataAnalysis/Course Project 1/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

twoDays <- subset(hpc,Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
twoDays$datetime <- strptime(paste(twoDays$Date, twoDays$Time), "%Y-%m-%d %H:%M:%S")
png("plot3.png", width=480, height=480)

with(twoDays, {
  plot(datetime, Sub_metering_1,  type="l", col="black", main = NULL, xlab="", ylab='Energy sub metering')
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lty=1, pch=NA)
})

dev.off()