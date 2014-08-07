library(datasets)
source("loadData.R")

# get data
dataset = getCachedDataSet();

# create device
png(file = "./figure/plot1.png", 
    width = 480, 
    height = 480, 
    bg = "transparent")

# graph
hist(dataset$Global_active_power, 
     xlab = 'Global Active Power (kilowatts)', 
     ylab = 'Frequency', 
     main = "Global Active Power",
     col = "red",
     border = TRUE)

# save
dev.off()