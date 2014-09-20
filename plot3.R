NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot3.png",width=480,height=480)

Baltmore <- NEI[NEI$fips =="24510",]
Balt_type <- aggregate(Emissions~year+type,data=Baltmore,sum)
g <- qplot(year,Emissions,data=Balt_type,facets=.~type)
g+ geom_point() + labs(title = "Baltmore Emissions by Type")

dev.off()