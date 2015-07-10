# This script will make plot 2 from Exploratory Data Analysis Project 1

# read the data
data <- read.csv("household_power_consumption.txt", na.strings ="?", sep=";", 
                 stringsAsFactors = FALSE )

#convert date and time info
data$DateTime<- data$DateTime<- strptime(paste(data$Date, data$Time),
                                         "%d/%m/%Y %H:%M:%S")


#subset only needed data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#create png file default is 480x480 so no need to specify
#set backround = NA (transparent) as in the git examples
par(bg=NA)
png("plot2.png")
#create plot no lines
plot( data$DateTime, data$Global_active_power, type="n",
      ylab="Global Active Power (kilowatts)", xlab="")
#add lines
lines(data$DateTime, data$Global_active_power)
dev.off()