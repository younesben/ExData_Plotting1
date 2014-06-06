dataTable<-read.csv2("household_power_consumption.txt")
dataTable$Time<-strptime(paste(as.character(dataTable$Date), as.character(dataTable$Time)),"%d/%m/%Y %H:%M:%S")
dataTable$Date<-as.Date(as.character(dataTable$Date),"%d/%m/%Y")
dataTable$Global_active_power<-as.numeric(levels(dataTable$Global_active_power))[dataTable$Global_active_power]
dataTable$Global_reactive_power<-as.numeric(levels(dataTable$Global_reactive_power))[dataTable$Global_reactive_power]
dataTable$Global_intensity<-as.numeric(levels(dataTable$Global_intensity))[dataTable$Global_intensity]
dataTable$Sub_metering_1<-as.numeric(levels(dataTable$Sub_metering_1))[dataTable$Sub_metering_1]
dataTable$Sub_metering_2<-as.numeric(levels(dataTable$Sub_metering_2))[dataTable$Sub_metering_2]
dataTable$Sub_metering_3<-as.numeric(levels(dataTable$Sub_metering_3))[dataTable$Sub_metering_3]
dataTable$Voltage<-as.numeric(levels(dataTable$Voltage))[dataTable$Voltage]
dataTable2 <- subset(dataTable, Date >= as.Date("2007-02-01")  & Date <= as.Date("2007-02-02"))
png(file="plot4.png")
par(mfrow = c(2, 2))
with(dataTable2, plot(Time,Global_active_power,type="l",main="",ylab="Global active Power",xlab=""))
with(dataTable2,  plot(Time,Voltage,type="l",xlab="datetime"))
with(dataTable2,plot(Time,Sub_metering_1,type="l",main="",ylab="Energy sub metering",xlab="") )
with(dataTable2,lines(Time,Sub_metering_2,type="l",col="red"))
with(dataTable2,lines(Time,Sub_metering_3,type="l",col="blue"))
with(dataTable2,legend("topright", col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n"))
with(dataTable2, plot(Time,Global_reactive_power,type="l",main="",xlab="datetime"))
dev.off()

