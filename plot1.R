# Download File 
tem <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tem)
data <- read.table(unz(tem,"household_power_consumption.txt"), sep=";", na="?", header = T, colClasses = 
                         c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
unlink(tem)

#Filter Dates and convert to POSIX
data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'), ]
data$POSIX <-as.POSIXlt.character(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")

#Generate Plot 1
png(filename="plot1.png",width = 640, height = 640)
hist(data$Global_active_power, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.off()