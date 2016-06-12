source("downloadAndUnpack.R")

# Acquire data ( download and unzip)
outputDIR <- getwd()
raw_data <- acquire.data("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", outputDIR)

png(file = file.path(outputDIR, "plot1.png"), width = 480, height = 480)
hist(raw_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts) ")
dev.off()