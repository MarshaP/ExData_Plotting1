if (!file.exists("data")){
  dir.create("data")
}

setwd("C:\\Users\\mpmar\\Desktop\\data scientists_courses\\data")

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#head(subSetData)
#summary(subSetData$Voltage)
#dim(subSetData)
#names(subSetData)



#cleaning the data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

####plot 1

png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col = "red", main = "Golbal Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

