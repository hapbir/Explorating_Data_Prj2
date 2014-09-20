NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot2.png",width=480,height=480)

Baltmore <- NEI[NEI$fips =="24510",]
Balt_Emission <- aggregate(Emissions~year,data=Baltmore,sum)
with(Balt_Emission, plot(year,Emissions,xlab="Year",ylab="Baltmore Total Emission (tons)"))

dev.off()