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

## making the plot a nd saving to png

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

## restore locale language
Sys.setlocale("LC_ALL", my_locale)
