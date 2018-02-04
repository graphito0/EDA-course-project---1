# Loading the data
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

#Convert the date variable.
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")

#Subset the data
Data <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Plot 
with(Data ,hist(Global_active_power, main = "Global Active Power", 
                +      xlab = "Global Active Power (kilowatts)", col = "Red"))
#Save as pnj
 dev.copy(png, file = "plot1.png", height = 480, width = 480)
  dev.off()
 
                  