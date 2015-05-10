
dataPlot_2 <- function(){
  
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

plot2 <- function(dataset = NULL){
  
  #Reading the data
  if(is.null(dataset)){
    dataset <- dataPlot_2()
  }
  
  #Creating the PNG file
  png("plot2.png",height=480, width=480)
  
  #Setting the margin
  par(mar=c(4,4,2,2))
  
  #Ploting as required
  plot(dataset$Time, dataset$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  
  #Closing the PNG file
  dev.off()  
}


plot2()