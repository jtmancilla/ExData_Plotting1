# Read data file
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")
# subset data
D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]

#generate plot on screen device
par(mfcol = c(1,1), bg ="transparent")
hist(as.numeric(D3$Global_active_power), col="red", xlab ="Global Active Power (kilowatts)", main= "Global Active Power", oma = c(0,0,6,0), xlim=c(0,6), ylim=c(0,1200))

#create a PNG device
dev.copy(png, file="plot1.png", width = 480, height=480, units="px")
dev.off()
