loadSelectData <-function(){
  
  ##Loads data and fixes formats to make it plottable 
  
  pow.cons<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
  
  pow.cons$PlotDate<-as.POSIXct(as.POSIXct(paste(pow.cons$Date, pow.cons$Time), format="%d/%m/%Y %H:%M:%S"))
  pow.cons<-pow.cons[year(pow.cons$PlotDate)==2007,]
  pow.cons<-pow.cons[month(pow.cons$PlotDate)==2,]
  pow.cons<-pow.cons[mday(pow.cons$PlotDate)<3,]
  pow.cons$Global_active_power<-as.numeric(as.character(pow.cons$Global_active_power))
  pow.cons$Global_reactive_power<-as.numeric(as.character(pow.cons$Global_reactive_power))
  
  pow.cons$Sub_metering_1<-as.numeric(as.character(pow.cons$Sub_metering_1))
  pow.cons$Sub_metering_2<-as.numeric(as.character(pow.cons$Sub_metering_2))
  pow.cons$Sub_metering_3<-as.numeric(as.character(pow.cons$Sub_metering_3))
  pow.cons$Voltage<-as.numeric(as.character(pow.cons$Voltage))
  

  return(pow.cons)
  
}
globalActivePowerHistogram <-function(x){
  ##Histogram function to give plot1 and save as PNG
  par(mfrow=c(1,1))
  hist(x$Global_active_power,breaks = 15,col = "RED",main="Global Active Power",xlab = "Global Active Power(kilowatts)")
  dev.copy(png,'plot1.png')
  dev.off()
}
globalActivePowerLine<-function(x){
  par(mfrow=c(1,1))
  plot(x$PlotDate,x$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab ="")
  dev.copy(png,'plot2.png')
  dev.off()
}
subMeteringPlot<-function(x){
  par(mfrow=c(1,1))
  plot(x$PlotDate,pow.cons$Sub_metering_1,type="l",ylab = "Global Active Power (kilowatts)",xlab ="")
  lines(x$PlotDate,x$Sub_metering_2,type="l",ylab = "",xlab ="",col="RED")
  lines(x$PlotDate,x$Sub_metering_3,type="l",ylab = "",xlab ="",col="BLUE")
  legend(x="topright",legend = c("SubMetering 1","SubMetering 2","SubMetering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
  dev.copy(png,'plot3.png')
  dev.off()
  
}
multiPlot<-function(x){
  par(mfrow=c(2,2))
  plot(x$PlotDate,x$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab ="")
  
  plot(x$PlotDate,x$Voltage,type="l",ylab = "Voltage",xlab ="")
  
  plot(x$PlotDate,pow.cons$Sub_metering_1,type="l",ylab = "Global Active Power (kilowatts)",xlab ="")
  lines(x$PlotDate,x$Sub_metering_2,type="l",ylab = "",xlab ="",col="RED")
  lines(x$PlotDate,x$Sub_metering_3,type="l",ylab = "",xlab ="",col="BLUE")
  legend(x="topright",legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
  
  plot(x$PlotDate,x$Global_reactive_power,type="l",ylab = "Global Reactive Power (kilowatts)",xlab ="")
  dev.copy(png,'plot4.png')
  dev.off()
  
}
##To run enable the following lines with the data file in your working directory:

##pow<-loadSelectData()
##globalActivePowerHistogram(pow)
##globalActivePowerLine(pow)
##subMeteringPlot(pow)
##multiPlot(pow)
