require(openintro)
data(COL)

myPDF("logNdrmChActn3R577xBoxPlot.pdf", 7.5, 5,
      mar = c(3.6, 3.6, 1, 0.5),
      mgp = c(2.4, 0.25, 0)
)

boxPlot(log(famuss$ndrm.ch + 5.0),  famuss$actn3.r577x,
        xlab = 'Genotype',
        ylab = 'log(ndrm.ch + 5.0)',,
        pch = 19,
        pchCex = 1.8,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
