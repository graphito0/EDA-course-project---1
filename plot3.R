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
attach(Data)
     plot(Sub_metering_1 ~ datetime, type = "l", 
                ylab = "Energying sub metering",xlab = "" ) 
     lines(Sub_metering_2 ~ datetime , col= "Red")
     lines(Sub_metering_3 ~ datetime , col ="Blue")
     legend("topright" ,  lty = 1 , col = c("Black" , "Red" , "Blue") ,
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Save as pnj
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(Data)

