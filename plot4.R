
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")
D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]
D3[,Date:=as.Date(Date,"%d/%m/%Y")]
D3[,Time:= paste(Date,Time)]
D3[,Day1:= c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")[as.POSIXlt(D3$Date)$wday + 1]]
par(mfcol = c(2,2), bg ="transparent")
with(D3, {
  plot(type= "l", as.numeric(D3$Global_active_power), xaxt="n", 
       ylab="Global Active Power", xlab="", main="")
  axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
  
  plot(as.numeric(D3$Sub_metering_1), type="l", 
       ylab="Energy sub metering", xaxt="n", xlab="")
  lines(as.numeric(D3$Sub_metering_2), col="red")
  lines(as.numeric(D3$Sub_metering_3), col="blue")
  axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), col=c("black","red","blue"), 
         lwd=1, bty="n", pt.cex = 1, cex = 0.7)
  
  plot(as.numeric(D3$Voltage), type="l", ylab="Voltage", 
       xlab="datetime", xaxt="n")
  axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
  
  plot(as.numeric(D3$Global_reactive_power), type="l",
       ylab="Global_reactive_power", xlab="datetime", xaxt="n")
  axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
  
})
dev.copy(png, file="plot4.png", width = 480, height=480, units="px")
dev.off()