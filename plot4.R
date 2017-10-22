if (!file.exists("data")){
  dir.create("data")
}

setwd("C:\\Users\\mpmar\\Desktop\\data scientists_courses\\data")

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



##cleaning the data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

SubMetering1 <- as.numeric(subSetData$Sub_metering_1)
SubMetering2 <- as.numeric(subSetData$Sub_metering_2)
SubMetering3 <- as.numeric(subSetData$Sub_metering_3)

GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)
Voltg <- as.numeric(subSetData$Voltage)



###plot 4

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower,  type="l", xlab = '', ylab = "Global Active Power",  cex=0.2)

plot(datetime, Voltg, type = "l", ylab = "Voltage")


plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.8, col=c("black", "red", "blue"), bty="n")

plot(datetime,GlobalReactivePower, type = "l", ylab="Global_reactive_power" )


dev.off()
