library(datasets)
source("loadData.R")

# get data
dataset = getCachedDataSet();

# create device
png(file = "./figure/plot2.png", 
    width = 480, 
    height = 480, 
    bg = "transparent")

# graph
plot(dataset$DateTime, dataset$Global_active_power,
     type = 'l',
     ylab = 'Global Active Power (kilowatts)', 
     xlab = "") 

# save
dev.off()