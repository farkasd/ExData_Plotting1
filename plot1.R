# Set working directory to the folder where dataset is saved.
setwd("C:/Users/dfar/Desktop/Exploratory_data_analysis/prog_assignment1/")

# read in data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char="")

# subset the data to those collected on 1 Febr. 2007 or o 2. Febr. 2007
data_sub <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))

#converting date and time variables
data_sub$Date <- as.Date(data_sub$Date, format = "%d/%m/%Y")
data_sub$datetime <- as.POSIXct(paste(data_sub$Date, data_sub$Time))

#creating plot1.png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
