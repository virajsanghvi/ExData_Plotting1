library(datasets)
source("loadData.R")

# get data
dataset = getCachedDataSet();

# create device
png(file = "./figure/plot3.png", 
    width = 480, 
    height = 480, 
    bg = "transparent")

# graph
colors = c('black', 'red', 'blue')
plot(dataset$DateTime, dataset$Sub_metering_1,
     type = 'l',
     ylab = 'Energy sub metering', 
     xlab = "",
     col = colors[1]) 
lines(dataset$DateTime, dataset$Sub_metering_2,
      type = 'l', 
      col = colors[2])
lines(dataset$DateTime, dataset$Sub_metering_3,
      type = 'l', 
      col = colors[3])
legend('topright', 
       lty = 1,
       col = colors,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# save
dev.off()