library(openintro)
#data(dds.discr)
data(COL)

myPDF("ddsExpAge.pdf", 8, 5,
      mar = c(4.2, 4, 1, 0.5),
      mgp = c(2.4, 0.25, 0),
)

boxPlot(dds.discr$expenditures, dds.discr$age.cohort,
        xlab = 'Age (years)',
        ylab = 'Expenditures (USD)',
        ylim = c(0, 80000),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
