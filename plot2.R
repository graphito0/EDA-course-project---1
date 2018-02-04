# Loading the data
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

#Convert the date variable.
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")

#Subset the data
Data <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert dates and times
Data$datetime <- strptime(paste(Data$Date, Data$Time), "%Y-%m-%d %H:%M:%S")

#Plot
Data$datetime <- as.POSIXct(Data$datetime)
with(Data ,plot(Global_active_power ~ datetime, type = "l", 
                   ylab = "Global Active Power (kilowatts)",xlab = "" ))
#Save as pnj
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

