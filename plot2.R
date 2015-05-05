## Read the original txt file then subset out only  the two days we're interested in.
## Create a new datetime column so we can plot against it.

hpc <- read.csv("~/Coursera Files/ExploratoryDataAnalysis/Course Project 1/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

twoDays <- subset(hpc,Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
twoDays$datetime <- strptime(paste(twoDays$Date, twoDays$Time), "%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480)

with(twoDays, {
plot(datetime, Global_active_power, type="l", xlab="",
ylab="Global Active Power (kilowatts)")
})

dev.off()