#generates plot4.png
#datafile "exdata_data_household_power_consumption.zip" must be
#in working directory
zipfile <- "exdata_data_household_power_consumption.zip"
con <-unz(zipfile,unzip(zipfile,list = T)$Name)
electric<-read.table(con,header = T,sep=";",na.strings=c("NA","?"),colClasses = c("character","character",rep("numeric",7)))
ylab="Energy Sub Metering"
electric1<-electric[electric$Date=="1/2/2007" | electric$Date=="2/2/2007",]
png("plot4.png")
datetime<-as.numeric(strptime(paste(electric1$Date,electric1$Time),"%d/%m/%Y %H:%M:%S"))
xtime<-datetime

par(mfrow=c(2,2),mar=c(4,5,2,1))

#Plot(1,1)
plot(electric1$Global_active_power ~ datetime,type="n",xaxt="n",xlab="",ylab="Global Active Power")
lines(electric1$Global_active_power ~ datetime)
axis(1,c(xtime[1],mean(xtime),2*mean(xtime)-xtime[1]),labels=c("Thu","Fri","Sat"))

#Plot(1,2)
plot(electric1$Voltage ~ datetime,type="n",xaxt="n",xlab="datetime",ylab="Voltage")
lines(electric1$Voltage ~ datetime)
axis(1,c(xtime[1],mean(xtime),2*mean(xtime)-xtime[1]),labels=c("Thu","Fri","Sat"))

#Plot(2,1)
plot(electric1$Sub_metering_1 ~ datetime,type="n",xaxt="n",xlab="",ylab=ylab)
lines(electric1$Sub_metering_1 ~ datetime)
lines(electric1$Sub_metering_2 ~ datetime,col="red")
lines(electric1$Sub_metering_3 ~ datetime,col="blue")
axis(1,c(xtime[1],mean(xtime),2*mean(xtime)-xtime[1]),labels=c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

#Plot(2,2)
plot(electric1$Global_reactive_power ~ datetime,type="n",xaxt="n",xlab="datetime",ylab="Global_reactive_power")
lines(electric1$Global_reactive_power ~ datetime)
axis(1,c(xtime[1],mean(xtime),2*mean(xtime)-xtime[1]),labels=c("Thu","Fri","Sat"))
dev.off()