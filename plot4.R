#read data
file <- "household_power_consumption.txt"
a<- read.csv(file,sep=";", nrow = 10)
cn <- colnames(a)
data <- read.csv(file,sep=";",na.string="?",skip=66636,nrow=2880,
                 col.names=cn,stringsAsFactors = FALSE)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")



#creat plot
png(file="plot4.png",width= 480,height=480)


par(mfrow=c(2,2))   #set par

#plot1
with(data, plot(Time,Global_active_power,type="n",
                ylab="Global Active Power (kilowatts)",
                xlab=""))
lines(data$Time,data$Global_active_power)

#plot2
with(data, plot(Time,Voltage,type="n",
                ylab="Voltage",
                xlab="datetime"))
lines(data$Time,data$Voltage)

#plot3
with(data, plot(Time,Sub_metering_1,type="n",
                ylab="Energy sub metering",
                xlab=""))
lines(data$Time,data$Sub_metering_1)
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#plot4
with(data, plot(Time,Global_reactive_power,type="n",
                ylab="Global_reactive_power",
                xlab="datetime"))
lines(data$Time,data$Global_reactive_power)

dev.off()