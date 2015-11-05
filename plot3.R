# So, the location and the reading of the file
HPCfile <- "~/dataproject/exdata-data-household_power_consumption/household_power_consumption.txt"
HPC <- read.table(HPCfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subsetting to the desired date
subSetData <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]

###########changing the languange locale, in order to get the right days names in english
## preserve the existing locale
my_locale <- Sys.getlocale("LC_ALL")
## change locale to English
Sys.setlocale("LC_ALL", "English")
############

## Coercing, making the plot and saving to png

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

## restore locale
Sys.setlocale("LC_ALL", my_locale)
