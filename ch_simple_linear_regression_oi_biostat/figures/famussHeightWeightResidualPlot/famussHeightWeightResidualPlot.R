library(openintro)
data(COL)

myPDF("famussHeightWeightResidualPlot.pdf", 6, 2.7,
      mfrow = c(1, 2),
      mgp = c(2, 0.25, 0),
      mar = c(3, 3, 1, 0.8))

plot(-187.791 + 5.139 * famuss$height,
     famuss$weight - (-187.791 + 5.139 * famuss$height),
     pch = 20,
     cex = 1.5,
     col = COL[1, 3],
     xlab = 'Predicted Weight',
     ylab = 'Residuals')
abline(h = 0, lty = 2)

boxPlot(famuss$weight - (-187.791 + 5.139 * famuss$height), 
        lcol = COL[1],
        col = COL[1,2],
        xlab = 'Residuals',
        axes=TRUE)

dev.off()

##version w/o boxplot

myPDF('famussHeightWeightResidualPlot.pdf', 6.51, 3.786,
      mar = c(3, 3, 0.5, 1),
      mgp = c(1.8, 0.6, 0))

plot(-187.791 + 5.139 * famuss$height,
     famuss$weight - (-187.791 + 5.139 * famuss$height),
     pch = 20,
     cex = 1.5,
     col = COL[1, 3],
     xlab = 'Predicted Weight',
     ylab = 'Residuals')
abline(h = 0, lty = 2)

dev.off()