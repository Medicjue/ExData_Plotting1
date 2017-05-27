### plot1.R ###
data <- read.csv("household_power_consumption.txt", sep = ";")

hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global active power (kilowatts)")
dev.copy(png, filename="plot1.png")
dev.off ()
