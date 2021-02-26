
# Download and upzip data file
if(!file.exists("./data")){dir.create("./data")}
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
unlink(temp)

# Subset data
subset <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Convert dates and times
subset$DateTime <- strptime(paste(subset$Date, subset$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot and save file
png("plot3.png", width = 480, height = 480)
with(subset, plot(DateTime, Sub_metering_1, col = "black",
                  type = "l", 
                  xlab = "",
                  ylab = 'Energy sub metering'))
with(subset, lines(DateTime, Sub_metering_2, col = "red"))
with(subset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
