plot2 <- function(){
  
  
  input1 <- read.table("household_power_consumption.txt",na.strings=c("?", "NA"),header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  
  df <- data.frame(input1)
  
  df <- df[complete.cases(df),]
  
  
  ## find the two dates in question
  df <- df[as.Date(df$Date,"%d/%m/%Y") >= as.Date("2007/02/01"),]
  df <- df[as.Date(df$Date,"%d/%m/%Y") <= as.Date("2007/02/02"),]
  
  
  
  df$DateTime <-strptime(paste0(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
  
  
  
  png("C:/datascientist/WDirectory_assignment3/plot2.png", width=480, height=480)
  x <- df$DateTime
  y <- df$Global_active_power
  plot(x,y, type="l",ann=FALSE)
  title(ylab="Global active power (kilowatts)")
  dev.off()
  
  
  
  
}

