library(openintro)
#data(famuss)
data(COL)

myPDF("famussBoxPlot.pdf", 5, 7,
      mar = c(3.5, 3.5, 1, 0.5),
      mgp = c(1.5, 0.25, 0),
)

boxPlot(famuss$height,
        ylab = 'Height',
        ylim = c(55, 80),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
