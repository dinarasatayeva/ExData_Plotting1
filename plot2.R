#Read data from a txt file to a table
data<-read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

#Bind Date and Time together
Full_date <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Full_date)

#Assign correct format 
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$Time<-format(data$Time, format = "%H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)


#Subset data
working_data<-subset(data, Date =="2007-02-01" | Date == "2007-02-02")

#Create png file
png("plot2.png", width = 480, height = 480)
with(working_data, plot(Full_date, Global_active_power, type = "l", xlab = "Day", 
                        ylab = "Global Active Power(kilowatts)"))
dev.off()
