#generates plot1.png
#datafile "exdata_data_household_power_consumption.zip" must be
#in working directory
zipfile <- "exdata_data_household_power_consumption.zip"
con <-unz(zipfile,unzip(zipfile,list = T)$Name)
electric<-read.table(con,header = T,sep=";",na.strings=c("NA","?"),colClasses = c("character","character",rep("numeric",7)))
main="Global Active Power"
electric1<-electric[electric$Date=="1/2/2007" | electric$Date=="2/2/2007",]
png("plot1.png")
hist(electric1$Global_active_power,col='red',xlab=paste(main,"(kilowatts)"),xlim=c(0,6),main=main)
dev.off()