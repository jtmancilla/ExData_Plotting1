# Read data file
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")
# subset data
D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]
# create DateTime factor to Date format
D3[,DateTime:= as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S", tz="EST")]

#generate plot on screen device
par(mfcol = c(1,1), bg ="transparent")
plot(DateTime, as.numeric(D3$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, as.numeric(D3$Sub_metering_2), col="red")
lines(DateTime, as.numeric(D3$Sub_metering_3), col="blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"))

#create a PNG device
dev.copy(png, file="plot3.png", width = 480, height=480, units="px")
dev.off()

