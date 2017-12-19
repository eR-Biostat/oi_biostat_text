require(openintro)
require(OIBioStat)
data(COL)
#data(statins.samp)

myPDF("statinAgeBoxPlot.pdf", 2.0, 3.0,
      mar = c(2, 4.0, 2.0, 0.5),
      mgp = c(2.8, 0.7, 0))
boxPlot(statins.samp$Age, statins.samp$Statin,
        ylab = 'Age in years',
        xlab = '',
        pch = 19,
        cex = 1.0,
        lcol = COL[1],
        col = COL[1,3],
        axes = TRUE)

dev.off()



myPDF("statinAgeBoxPlot.pdf", 2.0, 3.0,
      mar = c(5, 4.0, 2.0, 0.5) + 0.1,
      mgp = c(2.8, 0.7, 0))