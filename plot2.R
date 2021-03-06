
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
png("plot2.png", width=480, height=480)

#draw the graph

plot(data$dateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")


dev.off()