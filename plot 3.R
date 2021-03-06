setwd("C:/Users/Admin/Desktop/Data science Coursera/coursera data files/Exploratory data peer graded assignment")
file.list <- list.files(path = getwd(),pattern = ".txt",full.names = TRUE)
data <- read.table(file.list,sep = ";",stringsAsFactors = FALSE,dec = ".",header = TRUE)
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(datasubset$Global_active_power)
png("plot3.png", width=480, height=480)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(datasubset$Sub_metering_1)
subMetering2 <- as.numeric(datasubset$Sub_metering_2)
subMetering3 <- as.numeric(datasubset$Sub_metering_3)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()