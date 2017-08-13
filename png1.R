## Assign the downloaded data file to a variable

File <- "./household_power_consumption.txt"

## read the data into a data frame:

data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data only with the data needed:

workdata <- subset(data, Date %in% c("1/2/2007","2/2/2007") )

## Cast Global_active_power into a numeric

Global_active_power <- as.numeric(workdata$Global_active_power)

## Use the function hist to create the graphic with the parameters needed for title, label and color

hist(Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")