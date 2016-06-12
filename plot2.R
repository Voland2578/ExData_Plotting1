source("downloadAndUnpack.R")

# Assignment: Global Active Power on Y, Day of the Week on X

# Acquire data ( download and unzip)
outputDIR <- getwd()
raw_data <- acquire.data("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", outputDIR)

png(file = file.path(outputDIR, "plot2.png"), width = 480, height = 480)
# set the days of the week in abbreviated format
raw_data$DOW <- weekdays(raw_data$Date, abbreviate = TRUE)

# basic plot
plot(raw_data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "" ,
     col = "black", xaxt = "n")

# Determine where to put the labels.
axis(side = 1, labels = unique(as.character(raw_data$DOW)), 
     at=sapply(X = unique(raw_data$DOW), FUN = function(x) min(which (raw_data$DOW == x) )))
# draw black line around the plot
box(which = "plot", col="black")

dev.off()