library(dplyr)
tbl <- read.csv('data/household_power_consumption.txt', sep=';')
dat <- subset(tbl, Date=='1/2/2007' | Date=='2/2/2007')
rm(tbl)                     # free up some memory

# format the date/time stamp for the x axis
times <- paste(dat$Date, dat$Time) %>% strptime(format='%d/%m/%Y %H:%M:%S')

# set destination for plot
png(filename = './plot4.png', width=480, height=480, units='px')

# set plot parameters multiple plot layout and number of ticks
#   on x axis

par(mfrow=c(2, 2), lab=c(3, 4, 7))

with (dat,  {
    plot(times, Global_active_power, type='l', xlab="", 
         ylab="Global Active Power")
    plot(times, Voltage, type='l', xlab="")
    plot(times, dat$Sub_metering_1, type='l', xlab="", 
         ylab='Energy ubmetering')
    lines(times, dat$Sub_metering_2, col="red")
    lines(times, dat$Sub_metering_3, col='blue')
    legend("topright", lty=1, col=c('black', 'red', 'blue'), bty='n',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    plot(times, Global_reactive_power, type='l', xlab="", 
         ylab='Global reactive power')
})

# close plot output file
dev.off()