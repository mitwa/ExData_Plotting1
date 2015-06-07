plot2 <- function (){
  input <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
  input <- cbind(strptime(paste(input$Date,input$Time),format='%d/%m/%Y %H:%M:%S'),input)
  names(input)[1] <- 'DateTime'
  sub <- subset(input,DateTime >= '2007-02-01' & DateTime < '2007-02-03')
  sub$Date <- NULL
  sub$Time <- NULL
  png(filename="Plot2.png", width=480, height=480)
  with(sub,plot(sub$DateTime,sub$Global_active_power,type="l",ylab='Global Active Power (kilowatts)',xlab=""))
  dev.off()
}