plot1 <- function (){
  input <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
  input <- cbind(strptime(paste(input$Date,input$Time),format='%d/%m/%Y %H:%M:%S'),input)
  names(input)[1] <- 'DateTime'
  sub <- subset(input,DateTime >= '2007-02-01' & DateTime < '2007-02-03')
  sub$Date <- NULL
  sub$Time <- NULL
  png(filename="Plot1.png", width=480, height=480)
  hist(sub$Global_active_power,col="red",xlab='Global Active Power (kilowatts)',main = "Global Active Power")
  dev.off()
}