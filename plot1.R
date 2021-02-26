
# Download and upzip data file
if(!file.exists("./data")){dir.create("./data")}
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
unlink(temp)

# Subset data
subset <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Plot
hist(as.numeric(subset$Global_active_power), 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# Save file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
