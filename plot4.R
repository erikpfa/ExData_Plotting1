# This script will make plot 4 from Exploratory Data Analysis Project 1

# read the data
data <- read.csv("household_power_consumption.txt", na.strings ="?", sep=";", 
                 stringsAsFactors = FALSE )

#convert date and time info
data$DateTime<- data$DateTime<- strptime(paste(data$Date, data$Time),
                                         "%d/%m/%Y %H:%M:%S")


#subset only needed data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#create png file default is 480x480 so no need to specify
png("plot4.png")
#setup 2x2 plot
par(mfrow=c(2,2))
#top left
plot( data$DateTime, data$Global_active_power, type="n",
      ylab="Global Active Power", xlab="")
#add lines
lines(data$DateTime, data$Global_active_power)

#topright
plot( data$DateTime, data$Voltage, type="n",
      ylab="Voltage", xlab="datetime")
#add lines
lines(data$DateTime, data$Voltage)

#bottom left
plot( data$DateTime, data$Sub_metering_1, type="n",
      ylab="Energy sub metering", xlab="")
#add 3 lines of correct color
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
#add legend
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty =(c(1,1,1)), col = c("black","red","blue"),bty="n")

#bottom Right
plot( data$DateTime, data$Global_reactive_power, type="n",
      ylab="Global_reactive_power", xlab="datetime")
#add lines
lines(data$DateTime, data$Global_reactive_power)

dev.off()