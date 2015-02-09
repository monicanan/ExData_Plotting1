install.packages("sqldf")
library(sqldf)
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep = ";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset[data_subset == "?"] <- NA
attach(data_subset)
#which(is.na(data_subset) == TRUE)
#which(data_subset == "?")
##plot4
new<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2), mar = c(10,4,2,1))
plot(new, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(new, Voltage, type = "l", xlab = "datetime")
plot(new, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(new, Sub_metering_2, col = "red")
lines(new, Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = .75, cex = .75)
plot(new, Global_reactive_power, type = "l",xlab = "datetime")
##copy as png file
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
