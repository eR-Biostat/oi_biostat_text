library(openintro)
library(oibiostat)
data(COL)
data(prevend.samp)

myPDF("prevendStatinAgeBoxPlot.pdf", 2.0, 3.0,
      mar = c(2, 4.0, 2.0, 0.5),
      mgp = c(2.8, 0.7, 0))
boxPlot(prevend.samp$Age, prevend.samp$Statin,
        ylab = 'Age in years',
        xlab = '',
        pch = 19,
        cex = 1.0,
        lcol = COL[1],
        col = COL[1,3],
        axes = TRUE)

dev.off()

