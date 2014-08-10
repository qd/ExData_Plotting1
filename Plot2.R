#generates plot2.png
#datafile "exdata_data_household_power_consumption.zip" must be
#in working directory
zipfile <- "exdata_data_household_power_consumption.zip"
con <-unz(zipfile,unzip(zipfile,list = T)$Name)
electric<-read.table(con,header = T,sep=";",na.strings=c("NA","?"),colClasses = c("character","character",rep("numeric",7)))
main="Global Active Power"
electric1<-electric[electric$Date=="1/2/2007" | electric$Date=="2/2/2007",]
png("plot2.png")
xtime<-as.numeric(strptime(paste(electric1$Date,electric1$Time),"%d/%m/%Y %H:%M:%S"))
plot(electric1$Global_active_power ~ xtime,type="l",xaxt="n",xlab="",ylab="Global Active Power (kW)")
axis(1,c(xtime[1],mean(xtime),2*mean(xtime)-xtime[1]),labels=c("Thu","Fri","Sat"))
dev.off()