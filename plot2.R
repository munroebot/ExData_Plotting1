plot_n <- function() {
  
  power <- read.csv("household_power_consumption.txt",
                    header=TRUE,
                    sep=";",
                    na.strings="?",
                    stringsAsFactors = FALSE)
  
  # Get rid of NAs and filter on the date range we want to analyze (2007-02-01 thru 2007-02-02)
  power_clean <- na.omit(power)
  power_clean$Date <- as.Date(power_clean$Date,format="%d/%m/%Y")
  power_clean_plot <- subset(power_clean,Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
  
  # make a new column (timestamp) that combines both the date and time columns
  power_clean_plot <- within(power_clean_plot, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })
  power_clean_plot$timestamp <- as.POSIXlt(power_clean_plot$timestamp, "%d/%m/%Y %H:%M:%S",tz = Sys.timezone())
    
  # Do the plotting
  png("plot2.png")
  plot(power_clean_plot$timestamp,power_clean_plot$Global_active_power,type="l",xlab="",ylab="Glabal Active Power (kilowatts)")
  dev.off()
}

plot_n()