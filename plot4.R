library(datasets)
source("loadData.R")

# get data
dataset = getCachedDataSet();

# create device
png(file = "./figure/plot4.png", 
    width = 480, 
    height = 480, 
    bg = "transparent")

# set up canvas
par(mfrow = c(2, 2))

# graph
with(dataset, {
  # plot 1
  plot(DateTime, Global_active_power,
       type = 'l',
       ylab = 'Global Active Power', 
       xlab = "") 
  
  # plot 2
  plot(DateTime, Voltage,
       type = 'l',
       xlab = "datetime") 
  
  # plot 3
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
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         bty = 'n')
  
  # plot 4
  plot(DateTime, Global_reactive_power,
       type = 'l',
       xlab = "datetime") 
})

# save
dev.off()