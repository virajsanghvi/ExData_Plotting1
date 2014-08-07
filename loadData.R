# Gets data from the dates 2007-02-01 and 2007-02-02
getDataset = function (datafile = "../household_power_consumption.txt") {
  con = file(datafile);
  open(con);
  datatext = "";
  currentLine = 1;
  while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
    if (currentLine == 1 || length(grep("^(2|1)\\/2\\/2007;", line))) {
      datatext = paste(datatext, line, sep = "\r");
    }
    
    currentLine = currentLine + 1;
  } 
  close(con);
    
  dataset = read.table(text = datatext, header = TRUE, sep = ";", na.strings = "?");
  dataset$DateTime = strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S");
  dataset;
}

# gets data if not cached
getCachedDataSet = function (datafile = "../household_power_consumption.txt") {
  if (!exists("dataset")) {
    dataset = getDataset(datafile);
  }
  dataset;
}