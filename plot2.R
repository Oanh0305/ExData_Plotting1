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

#Plot2

plot(df$Time,df$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png, file="plot2.png")
dev.off()