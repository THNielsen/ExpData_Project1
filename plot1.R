plot1 <- function(){
  
  input1 <- read.table("household_power_consumption.txt",na.strings=c("?", "NA"),header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  
 ## remove the NA's
  
  input1 <- input1[complete.cases(input1),]
  
  
  ##print(day2-day1)
  input1 <- input1[as.Date(input1$Date,"%d/%m/%Y") >= as.Date("2007/02/01"),]
  input1 <- input1[as.Date(input1$Date,"%d/%m/%Y") <= as.Date("2007/02/02"),]
  
  
  
  png("C:/datascientist/WDirectory_assignment3/plot1.png", width=480, height=480)
  
  
  hist(input1$Global_active_power, col = "red",main="Global active power",xlab="Global active power (kilowatts)")
  dev.off()
  
  
}