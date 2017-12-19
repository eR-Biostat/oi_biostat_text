library(openintro)
data(COL)

statin.use = (statins.samp$Statin == 1)

myPDF("statinAgeRFFTConfounderPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(statins.samp$Age[statin.use == FALSE],
     statins.samp$RFFT[statin.use == FALSE],
     pch = 21,
     cex = 1.3,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "RFFT Score")
points(statins.samp$Age[statin.use == TRUE],
     statins.samp$RFFT[statin.use == TRUE],
     pch = 21,
     cex = 1.3,
     bg = COL[4, 3],
     col = COL[4])
mtext("Age (yrs)", 1, 1.9)

dev.off()