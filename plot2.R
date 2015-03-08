data <- read.csv("/Users/jamieyu/Documents/data_science/data_exploratory/project_1/household_power_consumption.txt", sep=";", header=TRUE)

data$DateTime <- as.Date(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

data <- subset(data, data$DateTime >= as.Date("2007-02-01 00:00:00") & data$DateTime < as.Date("2007-02-03 00:00:00"))

data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")


#plot2
png(filename="plot2.png", 
    units="in", 
    width=10, 
    height=7, 
    pointsize=12, 
    res=72)

plot(data$DateTime, as.numeric(data$Global_active_power)/1000, type="l",
     ylab = "Global Active Power (kilowatts)")

dev.off()

