## Assign the downloaded data file to a variable

File <- "./household_power_consumption.txt"

## read the data into a data frame:

data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data only with the data needed:

workdata <- subset(data, Date %in% c("1/2/2007","2/2/2007") )

##Change date format 

time <- strptime(paste(workdata$Date, workdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Open png device and create file
png("plot3.png", width=480, height=480)

##create graphic
plot(time,workdata$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = " ")
lines(time,workdata$Sub_metering_2,type= "l",col="red")
lines(time,workdata$Sub_metering_3,type= "l",col="blue")

##add legend
legend("topright", lty=1, lwd=2,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

##close device
dev.off()