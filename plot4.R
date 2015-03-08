
## Plot 4 - Code to generate .png file 
# "https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption"
# The code assumes that the file exists in the directory. The assignment only asks that the file is read 
# and does not specify if it should be DL'ed or not. 
nameOfPlot = "plot4.png"
#

dat1 <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
# For developing purposes 
dat <- dat1
dat[,1] <- as.Date.character(dat$Date, "%d/%m/%Y")
dat <- subset(dat, dat$Date >= "2007-02-01")
dat <- subset(dat, dat$Date <= "2007-02-02")

# Check if only two days are registered 
if (!(length(unique(dat[,1])) == 2)){ stop("Wrong number of Dates")}

# Plot 4 & export image 
png(filename = nameOfPlot, width = 480, height = 480, units = "px")
dt = paste(dat$Date,dat$Time) 
dt <- strptime(dt, format = "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
with(dat,{
  plot(dt, dat$Global_active_power,  type = "l", col = "black", main = "", xlab = "", ylab = "Global Active Power")
  plot(dt, dat$Voltage, type = "l", col = "black", xlab ="datetime", ylab ="Voltage")
  plot(dt,dat$Sub_metering_1, type = "l", col = "black", main = "", xlab = "", ylab = "Energy sub metering")
  lines(dt,dat$Sub_metering_2, col = "red", main = title, xlab = xaxis, ylab = yaxis)
  lines(dt, dat$Sub_metering_3, col = "blue", main = title, xlab = xaxis, ylab = yaxis)
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1), col=c("black","blue","red"),bty = "n")
  plot(dt, dat$Global_reactive_power, type = "l", col = "black", xlab ="datetime", ylab ="Global_reactive_power")
})
  dev.off()




