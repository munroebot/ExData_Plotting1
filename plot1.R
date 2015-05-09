plot_n <- function() {

  power <- read.csv("household_power_consumption.txt",
                    header=TRUE,
                    sep=";",
                    na.strings="?",
                    stringsAsFactors = FALSE)
  
  power_clean <- na.omit(power)
  power_clean$Date <- as.Date(power_clean$Date,format="%d/%m/%Y")
  power_data_plot <- subset(power_clean,Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

  png("plot1.png")

  hist(power_data_plot$Global_active_power,
    main="Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    col = "red"
  )

  dev.off()

}

plot_n()