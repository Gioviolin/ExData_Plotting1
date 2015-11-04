# So, the location and the reading of the file
HPCfile <- "~/dataproject/exdata-data-household_power_consumption/household_power_consumption.txt"
HPC <- read.table(HPCfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#subsetting to the desired date
subSetData <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]

#############

#str(subSetData), we see they are character so...
#Have to coerce to numeric and create the png
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
