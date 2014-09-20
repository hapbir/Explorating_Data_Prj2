NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot4.png",width=480,height=480)

coal <- grep("Coal",SCC$EI.Sector,ignore.case =TRUE)
scc_lst <- as.character(SCC$SCC[coal])
paten <- paste(scc_lst,collapse="|")
coal_obs <- NEI[grep(paten,NEI$SCC),]
coal_emission <- aggregate(Emissions~year,data=coal_obs,sum)
with(coal_emission, plot(year,Emissions,xlab="Year",ylab="Coal-Comb-Related Total Emission (tons)"))

dev.off()