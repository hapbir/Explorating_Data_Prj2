
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot1.png",width=480,height=480)
sum_Emission <- aggregate(Emissions~year,data=NEI,sum)
with(sum_Emission, plot(year,Emissions,xlab="Year",ylab="Total Emission (tons)"))

dev.off()
