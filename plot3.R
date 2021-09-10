# Download File 
tem <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tem)
data <- read.table(unz(tem,"household_power_consumption.txt"), sep=";", na="?", header = T, colClasses = 
                         c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
unlink(tem)

#Filter Dates and convert to POSIX
data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'), ]
data$POSIX <-as.POSIXlt.character(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")

#Generate Plot 3
png(filename="plot3.png",width = 640, height = 640)
with(data, plot(POSIX, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(POSIX, Sub_metering_2, col = 'red'))
with(data, lines(POSIX, Sub_metering_3, col = 'blue'))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lty = 1)
dev.off()