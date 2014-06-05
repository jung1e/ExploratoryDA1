#read data
file <- "household_power_consumption.txt"
a<- read.csv(file,sep=";", nrow = 10)
cn <- colnames(a)
data <- read.csv(file,sep=";",na.string="?",skip=66636,nrow=2880,
                 col.names=cn,stringsAsFactors = FALSE)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#creat plot
png(file="plot2.png",width= 480,height=480)

with(data, plot(Time,Global_active_power,type="n",
                ylab="Global Active Power (kilowatts)",
                xlab=""))
lines(data$Time,data$Global_active_power)
dev.off()