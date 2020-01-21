#Read data from a txt file to a table
data<-read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

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

#Choose data from dates 2007-02-01 and 2007-02-02
working_data<-subset(data, Date =="2007-02-01" | Date == "2007-02-02")

#Create a png file
png("plot1.png", width = 480, height = 480)

#Plot a histogram
hist(working_data$Global_active_power, col = "red", border = "black",
     main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

#Close device
dev.off()
