
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")

D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]
D3[,Date:=as.Date(Date,"%d/%m/%Y")]
D3[,Time:= paste(Date,Time)]

par(mfcol = c(1,1), bg ="transparent")
hist(as.numeric(D3$Global_active_power), col="red", xlab ="Global Active Power (kilowatts)", main= "Global Active Power", oma = c(0,0,6,0), xlim=c(0,6), ylim=c(0,1200))
dev.copy(png, file="plot1.png", width = 480, height=480, units="px")
dev.off()