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

#Plot3

install.packages("tidyr")
library(tidyr)
df$Time<-as.POSIXct(df$Time)
df1<-gather(df, key="Sub_metering",value="Energy_sub_metering",Sub_metering_1:Sub_metering_3)
with(df1,plot(Time,Energy_sub_metering, type="n",xlab="",ylab="Energy sub metering"))
with(subset(df1,Sub_metering=="Sub_metering_1"), lines(Time,Energy_sub_metering,col="black"))
with(subset(df1,Sub_metering=="Sub_metering_2"), lines(Time,Energy_sub_metering,col="red"))
with(subset(df1,Sub_metering=="Sub_metering_3"), lines(Time,Energy_sub_metering,col="blue"))
legend("topright", lty=1, col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()