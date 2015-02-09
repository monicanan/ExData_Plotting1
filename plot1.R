install.packages("sqldf")
library(sqldf)
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep = ";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset[data_subset == "?"] <- NA
attach(data_subset)
#which(is.na(data_subset) == TRUE)
#which(data_subset == "?")
##plot1
par(mar = c(10, 4, 4, 1))
hist(Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
##copy as png file
dev.copy(png, 'plot1.png', width = 480, height = 480, bg = "transparent")
dev.off()
