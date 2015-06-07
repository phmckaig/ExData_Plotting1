
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
png("plot4.png", width=480, height=480)

#partition into four quadrants; par=parameters
par(mfcol = c(2, 2))

#draw the graphs
#Top Left Graph
plot(x = data$dateTime, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#Down Left Graph
plot(x = data$dateTime, y = data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = data$dateTime, y = data$Sub_metering_1 , col = "black")
lines(x = data$dateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$dateTime, y = data$Sub_metering_3, col = "blue")
legend("topright",  pch=NA, 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Top Right Graph
plot(x = data$dateTime, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Down Right Graph
plot(x = data$dateTime, y = data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()