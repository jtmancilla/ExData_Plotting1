# Read data file
library(data.table)
data <- fread("power_consumption.txt", na.strings="?", colClasses ="character")
# subset data
D3 <- data[data$"Date" %in% c("1/2/2007","2/2/2007"),]

# create DateTime factor to Date format
D3[,DateTime:= as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S", tz="EST")]
#generate plot on screen device
par(mfcol = c(1,1), bg ="transparent")
plot(DateTime, type= "l", as.numeric(D3$Global_active_power), ylab="Global Active Power(kilowats)", xlab="", main="")
#create a PNG device
dev.copy(png, file="plot2.png", width = 480, height=480, units="px")
dev.off()

