library(dplyr)

tbl <- read.csv('data/household_power_consumption.txt', sep=';')
dat <- subset(tbl, Date=='1/2/2007' | Date=='2/2/2007')
rm(tbl)                     # free up some memory

# format the date/time stamp for the x axis
times <- paste(dat$Date, dat$Time) %>% strptime(format='%d/%m/%Y %H:%M:%S')

# send the plot to an output file, do the plot, close the file
png(filename = './plot3.png', width=480, height=480, units='px')
par(lab=c(3, 4, 7))  # format the ticks on the x axis
plot(times, dat$Sub_metering_1, type='l', xlab='', 
     ylab='Energy submetering')
lines(times, dat$Sub_metering_2, col="red")
lines(times, dat$Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
