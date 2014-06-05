#read data

file <- "household_power_consumption.txt" 
a<- read.csv(file,sep=";", nrow = 10)
cn <- colnames(a)
data <- read.csv(file,sep=";",na.string="?",skip=66636,nrow=2880,
                 col.names=cn,stringsAsFactors = FALSE)


#creat plot

png(file="plot1.png",width= 480,height=480)

hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab= "Global Active Power (kilowatts)")

dev.off()