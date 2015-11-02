### plot 3

#change working directory to the right folder
getwd()
setwd("C://Users/yiwang/Documents/ExData_Plotting1")

#load data
DT=read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#change the type of Date into Date class
DT$Date=as.Date(as.character(DT$Date), format="%d/%m/%Y")

#subset data within 2007-02-01 and 2007-02-02
DT1=subset(DT, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#graph2
DT1$Global_active_power=as.numeric(DT1$Global_active_power)
png(file="plot2.png", width=480, height=480)
plot(1:dim(DT1)[1],DT1$Global_active_power*2/1000, type="l",xaxt="n",
     ylab="Global Active Power (kilowatts)" , xlab="")
axis(1, at=c(0, dim(DT1)[1]/2, dim(DT1)[1]), labels=c("Thu","Fri","Sat"))
dev.off()
