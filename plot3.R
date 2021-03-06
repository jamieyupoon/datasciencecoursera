data <- read.csv("/Users/jamieyu/Documents/data_science/data_exploratory/project_1/household_power_consumption.txt", sep=";", header=TRUE)

data$DateTime <- as.Date(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

data <- subset(data, data$DateTime >= as.Date("2007-02-01 00:00:00") & data$DateTime < as.Date("2007-02-03 00:00:00"))

data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")


#plot3
png(filename="plot3.png", 
    units="in", 
    width=10, 
    height=7, 
    pointsize=12, 
    res=72)

plot(data$DateTime, as.numeric(data$Sub_metering_1), type="l",
  ylab="Energy Sub metering") # adds titles to the axes 
lines(data$DateTime, as.numeric(data$Sub_metering_2),  col="red")
lines(data$DateTime, as.numeric(data$Sub_metering_3),  col="blue")
legend("topright", c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),
       pch = "-", col=c("black", "blue","red"))
dev.off()

