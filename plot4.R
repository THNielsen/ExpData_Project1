plot4 <- function(){
  input1 <- read.table("household_power_consumption.txt",na.strings=c("?", "NA"),header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  
  df <- data.frame(input1)
  
  df <- df[complete.cases(df),]
  
  
  ## find the two dates in question
  df <- df[as.Date(df$Date,"%d/%m/%Y") >= as.Date("2007/02/01"),]
  df <- df[as.Date(df$Date,"%d/%m/%Y") <= as.Date("2007/02/02"),]
  
  
  
  df$DateTime <-strptime(paste0(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
  
  
  
  png("C:/datascientist/WDirectory_assignment3/plot4.png", width=480, height=480)
  
  old.par <- par(mfrow=c(2, 2))
  
  x <- df$DateTime
  y <- df$Global_active_power
  plot(x,y, type="l",ann=FALSE)
  title(ylab="Global active power (kilowatts)")
  
  
  x <- df$DateTime
  y <- df$Voltage
  plot(x,y, type="l",ann=FALSE)
  title(ylab="Voltage")
  
  x <- range(df$DateTime)
  y <- range(df$Sub_metering_1)
  col <- c("black","red","blue")
  names_col <- df[1,c(7,8,9)]
  plot(x,y,type="n",ann=FALSE)
  lines(df$DateTime,df$Sub_metering_1,type="l",col=col[1],lwd=1)
  lines(df$DateTime,df$Sub_metering_2,type="l",col=col[2],lwd=1)
  lines(df$DateTime,df$Sub_metering_3,type="l",col=col[3],lwd=1)
  
  legend("topright",col=col,lwd=c(1,1,1),legend=colnames(names_col))
  ##legend("topright",legend="Sub_metering_2")
  title(ylab="Energy sub metering")
  
  
  x <- df$DateTime
  y <- df$Global_reactive_power
  plot(x,y, type="l",ann=FALSE)
  title(ylab="Global active power (kilowatts)")
  
  
  par(old.par)
  dev.off()
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}