
## Plot 2 - Code to generate .png file 
# "https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption"
# The code assumes that the file exists in the directory. The assignment only asks that the file is read 
# and does not specify if it should be DL'ed or not. 
nameOfPlot = "plot2.png"
#

dat1 <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
# For developing purposes 
dat <- dat1
dat[,1] <- as.Date.character(dat$Date, "%d/%m/%Y")
dat <- subset(dat, dat$Date >= "2007-02-01")
dat <- subset(dat, dat$Date <= "2007-02-02")

# Check if only two days are registered 
if (!(length(unique(dat[,1])) == 2)){ stop("Wrong number of Dates")}

# Plot 1 & export image 

title <- " "
yaxis <- "Global Active Power (kilowatts)"
xaxis <- "" 
color <- "black"
png(filename = nameOfPlot, width = 480, height = 480, units = "px")
dt = paste(dat$Date,dat$Time) 
dt <- strptime(dt, format = "%Y-%m-%d %H:%M:%S")
plot(dt, dat$Global_active_power,  type = "l", col = color, main = title, xlab = xaxis, ylab = yaxis)
dev.off()

