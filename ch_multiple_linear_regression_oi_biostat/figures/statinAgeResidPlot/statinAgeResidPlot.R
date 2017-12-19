library(openintro)
data(COL)

obs = residuals(lm(RFFT ~ Statin + Age, data=statins.samp))

myPDF("statinAgeResidPlot.pdf",
      6.0,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2) + 0.1,
      mgp = c(2.8, 0.5, 0))
plot(statins.samp$Age,
     obs,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "Residual")
points(statins.samp$Age,
       obs,
       cex = 1.3,
       col = COL[1])
mtext("Age (yrs)", 1, 1.9)

abline(lm(obs ~ statins.samp$Age))

dev.off()

