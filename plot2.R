library(dplyr)

tbl <- read.csv('data/household_power_consumption.txt', sep=';')
dat <- subset(tbl, Date=='1/2/2007' | Date=='2/2/2007')
rm(tbl)                     # free up some memory

# format the date/time stamp for the x axis
times <- paste(dat$Date, dat$Time) %>% strptime(format='%d/%m/%Y %H:%M:%S')

# send the plot to an output file, do the plot, close the file
png(filename = './plot2.png', width=480, height=480, units='px')
par(lab=c(3, 4, 7))  # format the ticks on the x axis
plot(times, dat$Global_active_power, type='l', xlab='', 
     ylab='Global Active Power (kilowatts)', xaxt='n')
day_1 <- as.Date(min(dat$Date), format = "%d/%m/%Y")
day_2 <- as.Date(max(dat$Date), format = "%d/%m/%Y")
axis.POSIXct(side = 1, 
             at = seq(day_1, day_2 + 1, by = "day"),
             format = "%a",
             labels = c("Thu", "Fri", "Sat"))
dev.off()
