## Assign the downloaded data file to a variable

File <- "./household_power_consumption.txt"

## read the data into a data frame:

data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data only with the data needed:

workdata <- subset(data, Date %in% c("1/2/2007","2/2/2007") )

## Cast Global_active_power into a numeric

Global_active_power <- as.numeric(workdata$Global_active_power)

##Change date format 

time <- strptime(paste(workdata$Date, workdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


##Open png device and create file
png("plot4.png", width=480, height=480)

##Create 2*2 template for graphis
par(mfcol = c(2,2))

##build Graphics in proper order
plot(time,Global_active_power,type = "l", ylab = "Global Active Power (Kilowatts)", xlab = " ")

plot(time,workdata$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = " ")
lines(time,workdata$Sub_metering_2,type= "l",col="red")
lines(time,workdata$Sub_metering_3,type= "l",col="blue")
legend("topright", lty=1, lwd=2,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

plot(time,workdata$Voltage, type = "l",ylab="Voltage",xlab="datetime")
plot(time,workdata$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

##close device
dev.off()
