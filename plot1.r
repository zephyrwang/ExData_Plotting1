###plot 1

#change working directory to the right folder
getwd()
setwd("C://Users/yiwang/Documents/ExData_Plotting1")

#load data
DT=read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#change the type of Date into Date class
DT$Date=as.Date(as.character(DT$Date), format="%d/%m/%Y")

#subset data within 2007-02-01 and 2007-02-02
DT1=subset(DT, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#graph 1
DT1$Global_active_power=as.numeric(DT1$Global_active_power)
png(file="plot1.png", width=480, height=480)
hist(DT1$Global_active_power*2/1000, col="red", xaxt="n", ylim=c(0, 1200), main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
axis(1, at=seq(0,6, by=2))
dev.off()
