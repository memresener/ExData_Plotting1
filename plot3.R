subMeteringPlot<-function(x){
  par(mfrow=c(1,1))
  plot(x$PlotDate,pow.cons$Sub_metering_1,type="l",ylab = "Global Active Power (kilowatts)",xlab ="")
  lines(x$PlotDate,x$Sub_metering_2,type="l",ylab = "",xlab ="",col="RED")
  lines(x$PlotDate,x$Sub_metering_3,type="l",ylab = "",xlab ="",col="BLUE")
  legend(x="topright",legend = c("SubMetering 1","SubMetering 2","SubMetering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
  dev.copy(png,'plot3.png')
  dev.off()
  
}