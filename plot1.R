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
png("plot1.png")

#Construct plot
hist(power$Global_active_power, breaks=12, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Close png file
dev.off()