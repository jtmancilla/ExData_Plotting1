# Read data file
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")

# subset data
D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]
# create DateTime factor to Date format
D3[,DateTime:= as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S", tz="EST")]

#generate plot on screen device
par(mfcol = c(2,2), bg ="transparent", mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))
with(D3, {
  plot(DateTime, type= "l", as.numeric(D3$Global_active_power), ylab="Global Active Power", xlab="", main="")
  
  plot(DateTime, as.numeric(D3$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
  lines(DateTime, as.numeric(D3$Sub_metering_2), col="red")
  lines(DateTime, as.numeric(D3$Sub_metering_3), col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
  
  plot(DateTime, as.numeric(D3$Voltage), type="l", ylab="Voltage", 
       xlab="datetime")
  
  plot(DateTime, as.numeric(D3$Global_reactive_power), type="l",
       ylab="Global_reactive_power", xlab="datetime")  
})
dev.copy(png, file="plot4.png", width = 480, height=480, units="px")
dev.off()