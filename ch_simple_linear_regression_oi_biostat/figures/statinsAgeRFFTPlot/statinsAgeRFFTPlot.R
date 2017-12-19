library(openintro)
data(COL)

myPDF("statinsAgeRFFTPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(statins.samp$Age,
     statins.samp$RFFT,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "RFFT Score")
points(statins.samp$Age,
       statins.samp$RFFT,
       cex = 1.3,
       col = COL[1])
mtext("Age (yrs)", 1, 1.9)

dev.off()

abline(lm(statins.samp$RFFT ~ statins.samp$Age))
lm(statins.samp$RFFT ~ statins.samp$Age)

View(as.matrix(resid(lm(statins.samp$RFFT ~ statins.samp$Age))))

hist(resid(lm(statins.samp$RFFT ~ statins.samp$Age)))
summary(resid(lm(statins.samp$RFFT ~ statins.samp$Age)))
