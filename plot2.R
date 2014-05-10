
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")

D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]
D3[,Date:=as.Date(Date,"%d/%m/%Y")]
D3[,Time:= paste(Date,Time)]
D3[,Day1:= c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")[as.POSIXlt(D3$Date)$wday + 1]]
par(mfcol = c(1,1), bg ="transparent")
plot(type= "l", as.numeric(D3$Global_active_power), xaxt="n", ylab="Global Active Power(kilowats)", xlab="", main="")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png, file="plot2.png", width = 480, height=480, units="px")
dev.off()

