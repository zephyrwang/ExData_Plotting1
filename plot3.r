###plot 3

#change working directory to the right folder
getwd()
setwd("C://Users/yiwang/Documents/ExData_Plotting1")

#load data
DT=read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#change the type of Date into Date class
DT$Date=as.Date(as.character(DT$Date), format="%d/%m/%Y")

#subset data within 2007-02-01 and 2007-02-02
DT1=subset(DT, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#graph3
DT1$Sub_metering_1=as.numeric(as.character(DT1$Sub_metering_1))
DT1$Sub_metering_2=as.numeric(as.character(DT1$Sub_metering_2))

png(file="plot3.png", width=480, height=480)
plot(1:dim(DT1)[1],DT1$Sub_metering_1, type="l",xaxt="n", yaxt="n",ylim=c(0, 38),
     ylab="Energy sub metering" , xlab="")
lines(1:dim(DT1)[1],DT1$Sub_metering_2, type="l", col="red")
lines(1:dim(DT1)[1],DT1$Sub_metering_3, type="l", col="blue")
axis(1, at=c(0, dim(DT1)[1]/2, dim(DT1)[1]), labels=c("Thu","Fri","Sat"))
axis(2, at=seq(0,30, by=10))
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(2.5, 2.5,2.5), col=c("black","red","blue"))
dev.off()
