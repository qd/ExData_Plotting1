#generates plot3.png
#datafile "exdata_data_household_power_consumption.zip" must be
#in working directory
zipfile <- "exdata_data_household_power_consumption.zip"
con <-unz(zipfile,unzip(zipfile,list = T)$Name)
electric<-read.table(con,header = T,sep=";",na.strings=c("NA","?"),colClasses = c("character","character",rep("numeric",7)))
ylab="Energy Sub Metering"
electric1<-electric[electric$Date=="1/2/2007" | electric$Date=="2/2/2007",]
png("plot3.png")
datetime<-as.numeric(strptime(paste(electric1$Date,electric1$Time),"%d/%m/%Y %H:%M:%S"))
xtime<-datetime
plot(electric1$Sub_metering_1 ~ datetime,type="n",xaxt="n",xlab="",ylab=ylab)
lines(electric1$Sub_metering_1 ~ datetime)
lines(electric1$Sub_metering_2 ~ datetime,col="red")
lines(electric1$Sub_metering_3 ~ datetime,col="blue")
axis(1,c(xtime[1],mean(xtime),2*mean(xtime)-xtime[1]),labels=c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()