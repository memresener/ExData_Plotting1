globalActivePowerHistogram <-function(x){
  ##Histogram function to give plot1 and save as PNG
  par(mfrow=c(1,1))
  hist(x$Global_active_power,breaks = 15,col = "RED",main="Global Active Power",xlab = "Global Active Power(kilowatts)")
  dev.copy(png,'plot1.png')
  dev.off()
}