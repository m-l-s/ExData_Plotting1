tbl <- read.csv('data/household_power_consumption.txt', sep=';')
dat <- tbl[66637:69516,]    # grab relevant dates without chewing up CPU
rm(tbl)                     # free up some memory

# convert the column of interest from character data to numeric
dat$Global_active_power <- as.numeric((dat$Global_active_power))

# draw the histogram and export to PNG file

png(filename = './plot1.png', width = 480, height = 480, units = 'px')
hist(dat$Global_active_power, col = 'red', main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')
dev.off()