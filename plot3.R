# Set working directory to the folder where dataset is saved.
setwd("C:/Users/dfar/Desktop/Exploratory_data_analysis/prog_assignment1/")

# read in data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char="")

# subset the data to those collected on 1 Febr. 2007 or o 2. Febr. 2007
data_sub <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))

#converting date and time variables
data_sub$Date <- as.Date(data_sub$Date, format = "%d/%m/%Y")
data_sub$datetime <- as.POSIXct(paste(data_sub$Date, data_sub$Time))

## creating plot3.png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data_sub, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black"))
with(data_sub, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(data_sub, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
