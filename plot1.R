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

# First plot
png("plot1.png",width=480, height=480, units="px")
hist(energy_data$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowats)", col="red")
dev.off()

