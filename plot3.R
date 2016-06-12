source("downloadAndUnpack.R")

# Assignment: Energy Submetering on Y, Day of the Week on X
# Acquire data ( download and unzip)
outputDIR <- getwd()
raw_data <- acquire.data("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", outputDIR)

png(file = file.path(outputDIR, "plot3.png"), width = 480, height = 480)
# set the days of the week in abbreviated format
raw_data$DOW <- weekdays(raw_data$Date, abbreviate = TRUE)

# basic plot of first submetering
plot(raw_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "" ,
     col = "black", xaxt = "n")
lines(raw_data$Sub_metering_2, type="l", col="red")
lines(raw_data$Sub_metering_3, type="l", col="blue")


# Determine where to put the labels.
axis(side = 1, labels = unique(as.character(raw_data$DOW)), 
     at=sapply(X = unique(raw_data$DOW), FUN = function(x) min(which (raw_data$DOW == x) )))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"),lty=1:1, 
       cex=0.8, text.col = "black")
# draw black line around the plot
box(which = "plot", col="black")

dev.off()