library(openintro)
data(COL)
#data(famuss)

myPDF("famussNdrmChHist.pdf", 4.5, 4.0,
      mgp = c(2.4, 0.7, 0),
      mar = c(3.5, 3.5, 0.5, 1.0))

histPlot(famuss$ndrm.ch,
         breaks = 14,
         xlab = 'Change in muscle strength (ndrm.ch)',
         ylab = "Frequency",
         col = COL[1],
         border = COL[5])

dev.off()

myPDF("famussLogNdrmChHist.pdf", 4.5, 4.0,
      mgp = c(2.4, 0.7, 0),
      mar = c(3.5, 3.5, 0.5, 1.0))

histPlot(log(famuss$ndrm.ch + 5.0),
         breaks = 14,
         xlab = 'Histogram of log(ndrm.ch + 5.0)',
         ylab = "Frequency",
         #         ylim = c(0, 70),
         col = COL[1],
         border = COL[5])

dev.off()
