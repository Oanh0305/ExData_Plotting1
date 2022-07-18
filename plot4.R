df<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
df$Time<-strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date<-as.Date(df$Date, format = "%d/%m/%Y")
df$Sub_metering_1<-as.numeric(df$Sub_metering_1)
df$Sub_metering_2<-as.numeric(df$Sub_metering_2)
df$Sub_metering_3<-as.numeric(df$Sub_metering_3)
df$Global_active_power<-as.numeric(df$Global_active_power)
df$Voltage<-as.numeric(df$Voltage)
df$Global_reactive_power<-as.numeric(df$Global_reactive_power)


df<-df[df$Date == as.Date("2007-02-01") | df$Date == as.Date("2007-02-02"),]

#Plot4

par(mfrow=c(2,2),mar=c(4,4,4,4))
plot(df$Time,df$Global_active_power,type="l", ylab = "Global Active Power",xlab = "")
plot(df$Time,df$Voltage,type="l", ylab = "Voltage",xlab = "datetime")
with(df1,plot(Time,Energy_sub_metering, type="n",xlab="",ylab="Energy sub metering"))
with(subset(df1,Sub_metering=="Sub_metering_1"), lines(Time,Energy_sub_metering,col="black"))
with(subset(df1,Sub_metering=="Sub_metering_2"), lines(Time,Energy_sub_metering,col="red"))
with(subset(df1,Sub_metering=="Sub_metering_3"), lines(Time,Energy_sub_metering,col="blue"))
legend("topright", lty=1, col=c("black","blue","red"), cex=0.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df$Time,df$Global_reactive_power,type="l", ylab = "Global_reactive_power",xlab = "datetime")

dev.copy(png, file="plot4.png")
dev.off()