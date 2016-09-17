globalActivePowerLine<-function(x){
  par(mfrow=c(1,1))
  plot(x$PlotDate,x$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab ="")
  dev.copy(png,'plot2.png')
  dev.off()
}