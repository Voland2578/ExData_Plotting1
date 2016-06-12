source("downloadAndUnpack.R")

outputDIR <- getwd()

raw_data <- acquire.data("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", outputDIR)
raw_data$DOW <- weekdays(raw_data$Date, abbreviate = TRUE)


png(file = file.path(outputDIR, "plot4.png"), width = 480, height = 480)


# plot 1
par( mfrow = c( 2, 2 ) )

plot(raw_data$Global_active_power, type="l", ylab = "Global Active Power", xlab = "" ,
     col = "black", xaxt = "n")
# Determine where to put the labels.
axis(side = 1, labels = unique(as.character(raw_data$DOW)), 
     at=sapply(X = unique(raw_data$DOW), FUN = function(x) min(which (raw_data$DOW == x) )))
# draw black line around the plot
box(which = "plot", col="black")

# plot 2
plot(raw_data$Voltage, type="l", ylab = "Voltage", xlab = "datetime" ,
     col = "black", xaxt = "n")
# Determine where to put the labels.
axis(side = 1, labels = unique(as.character(raw_data$DOW)), 
     at=sapply(X = unique(raw_data$DOW), FUN = function(x) min(which (raw_data$DOW == x) )))
# draw black line around the plot
box(which = "plot", col="black")


# plot 3
plot(raw_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "" ,
     col = "black", xaxt = "n")
lines(raw_data$Sub_metering_2, type="l", col="red")
lines(raw_data$Sub_metering_3, type="l", col="blue")

# Determine where to put the labels.
axis(side = 1, labels = unique(as.character(raw_data$DOW)), 
     at=sapply(X = unique(raw_data$DOW), FUN = function(x) min(which (raw_data$DOW == x) )))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"),lty=1:1, 
       cex=0.8, text.col = "black", bty = "n")
# draw black line around the plot
box(which = "plot", col="black")


# Plot 4
plot(raw_data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime" ,
     col = "black", xaxt = "n", yaxt="n")
# Determine where to put the labels.
axis(side = 1, labels = unique(as.character(raw_data$DOW)), 
     at=sapply(X = unique(raw_data$DOW), FUN = function(x) min(which (raw_data$DOW == x) )))
axis(side=2, at=seq(0,max(raw_data$Global_reactive_power), by = 0.1),
     labels = seq(0,max(raw_data$Global_reactive_power), by = 0.1) )
# draw black line around the plot
box(which = "plot", col="black")


dev.off()