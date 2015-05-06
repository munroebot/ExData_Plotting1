# 2007-02-01 and 2007-02-02

plot_n <- function() {
  power <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  power_clean <- na.omit(power)

  power_clean$Date <- as.Date(power_clean$Date,format="%d/%m/%Y")
  power_clean$Time <- strptime(power_clean$Time,format="%H:%M:%S")

  png("plot1.png")

  hist(power_clean$Global_active_power,
    main="Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    col = "red"
  )

  dev.off()

}

plot_n()


# EPL2011_12FirstHalf <- subset(EPL2011_12, Date2 > as.Date("2012-01-13") )
