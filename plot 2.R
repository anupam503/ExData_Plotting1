setwd("C:/Users/Admin/Desktop/Data science Coursera/coursera data files/Exploratory data peer graded assignment")

file.list <- list.files(path = getwd(),pattern = ".txt",full.names = TRUE)
data <- read.table(file.list,sep = ";",stringsAsFactors = FALSE,dec = ".",header = TRUE)
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(datasubset$Global_active_power)
png("plot2.png", width=480, height=480)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
