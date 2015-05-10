
#Reading the data
dataPlot_1 <- function(){
  
  #Reading only the header of the data set
  header <- read.table("Data\\household_power_consumption.txt",header=F,nrows=1,sep=";")
  #Reading the required data set(from 1/2/2007 - 2/2/2007)
  dat <- read.table("Data\\household_power_consumption.txt",skip=66637,nrows=2880,
                    na.strings="?",sep=";")
  #Assigning the header to the data set
  colnames (dat) <- unlist(header)
  
  #Converting Date and Time column to Date/Time class 
  dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
  dat$Time <- strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")
  dat$Time <- strftime(dat$Time, format = "%H:%M:%S")
  
  #Returning the data set
  dat
}  

#Ploting as required
plot1 <- function(dataset = NULL){
  
  if(is.null(dataset)){
    dataset <- dataPlot_1()
  }  
  
  #Creating the PNG
  png("plot1.png",width=480, height=480)
  
  #Setting up the margin
  par(mar=c(4,4,2,2))
  
  #Plotting the histogram 
  hist(dataset$Global_active_power, xlab="Global Active Power (kilowatts)", 
       col="red",main="Global Active Power")
  
  #Closing the PNG file
  dev.off()  
}
  

plot1()