plot3 <- function (){
  input <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
  input <- cbind(strptime(paste(input$Date,input$Time),format='%d/%m/%Y %H:%M:%S'),input)
  names(input)[1] <- 'DateTime'
  sub <- subset(input,DateTime >= '2007-02-01' & DateTime < '2007-02-03')
  sub$Date <- NULL
  sub$Time <- NULL
  png(filename="Plot3.png", width=480, height=480)
  plot(sub$DateTime,sub$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
  lines(sub$DateTime,sub$Sub_metering_2,col="red")
  lines(sub$DateTime,sub$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}