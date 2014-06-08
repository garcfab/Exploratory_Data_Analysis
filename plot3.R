rm(list=ls())
# Loading Data
setwd("/Users/fabian/Dropbox/Coursera/Exploratory_Data_Analaysis")
energy_data <- read.table("data/household_power_consumption.txt", sep = ";" , na.strings="?", header=TRUE)

# Formatting Data column
energy_data$Date <- as.Date(energy_data$Date, format="%d/%m/%Y")

# Subsetting from the dates 2007-02-01 and 2007-02-02
energy_data <- subset(energy_data, energy_data$Date >= as.Date("2007-02-01") )
energy_data <- subset(energy_data, energy_data$Date <= as.Date("2007-02-02") )

# Energy Time. Day + Hour
energy_data$Time<-paste(energy_data$Date,energy_data$Time,sep="")
energy_data$Time<-strptime(energy_data$Time,format = "%Y-%m-%d %H:%M:%S")


# Third plot
png("plot3.png",width=480, height=480, units="px")
plot(energy_data$Time,energy_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=energy_data$Time,y=energy_data$Sub_metering_1,lty="solid")
lines(x=energy_data$Time,y=energy_data$Sub_metering_2,lty="solid", col="red")
lines(x=energy_data$Time,y=energy_data$Sub_metering_3,lty="solid", col="blue")
legend("topright",lty = "solid", col = c("black","blue", "red"), legend=c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
dev.off()

