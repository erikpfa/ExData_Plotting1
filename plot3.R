# This script will make plot 3 from Exploratory Data Analysis Project 1

# read the data
data <- read.csv("household_power_consumption.txt", na.strings ="?", sep=";", 
                 stringsAsFactors = FALSE )

#convert date and time info
data$DateTime<- data$DateTime<- strptime(paste(data$Date, data$Time),
                                         "%d/%m/%Y %H:%M:%S")


#subset only needed data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#set backround = NA (transparent) as in the git examples
#create png file default is 480x480 so no need to specify
png("plot3.png",bg=NA)
#create plot no lines
plot( data$DateTime, data$Sub_metering_1, type="n",
      ylab="Energy sub metering", xlab="")
#add 3 lines of correct color
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
#add legend
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty =(c(1,1,1)), col = c("black","red","blue"))
dev.off()