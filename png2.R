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
png("plot2.png", width=480, height=480)

##build grahic
plot(time,Global_active_power,type = "l", ylab = "Global Active Power (Kilowatts)", xlab = " ")

##close device
dev.off()
