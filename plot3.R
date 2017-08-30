#Download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
#Read in data and subset based on dates we need
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- subset(power, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
power$date_and_time <- with(power, as.POSIXlt(paste(Date, Time)), format="%m-%d-%Y %H:%M:%S")
power$day_of_week <- weekdays(power$Date)

#Construct datetime column
power$date_and_time <- with(power, as.POSIXlt(paste(Date, Time)), format="%m-%d-%Y %H:%M:%S")
power$day_of_week <- weekdays(power$Date)


#Create and open png file for plotting
png("plot3.png")

#Construct Plot
plot(power$date_and_time, power$Sub_metering_1, type="o", pch=".", xlab="", ylab="Energy Sub Metering")
lines(power$date_and_time, power$Sub_metering_2, pch=".", col="red")
lines(power$date_and_time, power$Sub_metering_3, pch=".", col="blue")
legend("topright",legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("black","red","blue"), lty=1)

#Close png file
dev.off()