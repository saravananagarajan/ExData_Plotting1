
dataPlot_3 <- function(){
  
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

plot3 <- function(dataset = NULL){
  
  #Reading the data
  if(is.null(dataset)){
    dataset <- dataPlot_3()
  }
  
  #Creating the PNG file
  png("plot3.png",height=480, width=480)
  
  #Ploting as required
  plot(dataset$Time,dataset$Sub_metering_1,
       type="l",
       col="black",
       xlab="",
       ylab="Energy sub metering")
  lines(dataset$Time,dataset$Sub_metering_2,
        col="red",
        type="l")
  lines(dataset$Time,dataset$Sub_metering_3,
        col="blue",
        type="l")    
  legend("topright",col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1)
  
  #Closing the PNG file
  dev.off()  
}


plot3()