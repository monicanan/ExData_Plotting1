install.packages("sqldf")
library(sqldf)
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep = ";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset[data_subset == "?"] <- NA
attach(data_subset)
#which(is.na(data_subset) == TRUE)
#which(data_subset == "?")
##plot2 
new<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
par(mar = c(8,4,2,1))
plot(new, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (killowatts)")

##copy as png file
dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()
