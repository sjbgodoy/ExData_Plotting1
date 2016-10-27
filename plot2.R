# Step 1:   Preparation Step: Download and unzip the dataset.
#
#           It sets the working directory where the downloaded datasets will be downloaded from
#           the URL https: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

            dirwork <- ("C:/Users/SebastiãoJosé/Documents")
            setwd(dirwork)
            zippedFile <- "power_consumption.zip"
            download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",zippedFile)
            unzip(zippedFile)

# Step 2:   Get only data from the dates 2007-02-01 and 2007-02-02.
#
            validRecord <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"), value = TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)


# Step 3:   Prepare general variables
            dirwork <- ("C:/Users/SebastiãoJosé/Documents/ExData_Plotting1-master")
            setwd(dirwork)
	    par(bg = 'white')
            png(file="plot2.png",width=480,height=480)
            validRecord$Date <- as.Date(validRecord$Date, format = "%d/%m/%Y")

#           concatenate "Date" and "Time"  fields
#           Add the concatenation in a new field in validRecord, that will be used in the plot 
            validRecord$Dt <- paste(as.Date(validRecord$Date), validRecord$Time)
            validRecord$Dt <- as.POSIXct(validRecord$Dt)

# Step 4:   Generation of the Plot 2      
            plot(validRecord$Global_active_power ~ validRecord$Dt, type = "l",
            ylab = "Global Active Power (kilowatts)", xlab = "")
            dev.off()

