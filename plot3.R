
#load the dataframe
df<-read.table("household_power_consumption.txt",
               header=TRUE,sep=";",
               colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
               na.strings="?")

# convert the Date and Time variables to Date/Time classes
df$dateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#date selection
selecteddates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(df, Date %in% selecteddates)


#set image size
png("plot3.png", width=480, height=480)

#draw the histogram
plot(data$dateTime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$dateTime, data$Sub_metering_1, col="black")
lines(data$dateTime, data$Sub_metering_2, col="red")
lines(data$dateTime, data$Sub_metering_3, col="blue")
legend("topright", pch=NA,
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)


dev.off()