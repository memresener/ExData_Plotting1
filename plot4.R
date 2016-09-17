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