
dataPlot_4 <- function(){
  
  #Reading only the header of the data set
  header <- read.table("Data\\household_power_consumption.txt",header=F,nrows=1,sep=";")
  #Reading the required data set(from 1/2/2007 - 2/2/2007)
  dat <- read.table("Data\\household_power_consumption.txt",skip=66637,nrows=2880,
                    na ="?",sep=";")
  #Assigning the header to the data set
  colnames (dat) <- unlist(header)
  
  #Converting Date and Time column to Date/Time class 
  dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
  dat$Time <- strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")
  
  #Returning the data set
  dat
}  

plot4 <- function(dataset = NULL){
  
  #Reading the data
  if(is.null(dataset)){
    dataset <- dataPlot_4()
  }
  
  #Creating the PNG file
  png("plot4.png",height=480, width=480)
  
  #Setting up the margin
  par(mar=c(4,4,1,1),mfrow=c(2,2))
  
  #Plot 1
  plot(dataset$Time, dataset$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power")
  
  #Plot 2
  plot(dataset$Time, dataset$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  #Plot 3
  plot(dataset$Time,dataset$Sub_metering_1,
       type="l",
       col="black",
       xlab="",
       ylab="Energy sub metering")
  lines(dataset$Time,dataset$Sub_metering_2,
        col="red")
  lines(dataset$Time,dataset$Sub_metering_3,
        col="blue")    
  legend("topright",col=c("black","red","blue"),
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1,
         bty="n",
         box.lwd=0)
  
  #Plot 4
  plot(dataset$Time, dataset$Global_reactive_power,
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
  
  #Closing the PNG file
  dev.off()  
}


plot4()