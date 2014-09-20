NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot5.png",width=480,height=480)

Baltmore <- NEI[NEI$fips =="24510",]
vehicle <- grep("vehicles",SCC$EI.Sector,ignore.case =TRUE)
scc_lst_vehicle <- as.character(SCC$SCC[vehicle])
paten <- paste(scc_lst_vehicle,collapse="|")
vehicle_obs <- Baltmore[grep(paten,Baltmore$SCC),]
Baltlib_Emission_vehicle <- aggregate(Emissions~year,data=vehicle_obs,sum)
with(Baltlib_Emission_vehicle, plot(year,Emissions,xlab="Year",ylab="Vehicle-Related Emission in Baltmore (tons)"))


dev.off()