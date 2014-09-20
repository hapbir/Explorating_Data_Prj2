NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot6.png",width=480,height=480)

twin_city <- NEI[NEI$fips =="24510" | NEI$fips == "06037",]
TC_vehicle <- grep("vehicles",SCC$EI.Sector,ignore.case =TRUE)
scc_lst_TC_vehicle <- as.character(SCC$SCC[vehicle])
TC_paten <- paste(scc_lst_TC_vehicle,collapse="|")
TC_vehicle_obs <- twin_city[grep(TC_paten,twin_city$SCC),]
TC_Emission_vehicle <- aggregate(Emissions~year+fips,data=TC_vehicle_obs,sum)
g <- qplot(year,Emissions,data=TC_Emission_vehicle,facets=.~flips)
g+ geom_point() + labs(title = "Vehicle Emissions by City")

dev.off()