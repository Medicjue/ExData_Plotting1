#### plot3.R ####
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"PowerData.zip")
unzip("PowerData.zip")

data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

dateTime<-paste(data$Date, data$Time)
data$dateTime<-as.POSIXct(dateTime)
names(data)[ncol(data)] <- "dateTime"

with(data, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       +       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
