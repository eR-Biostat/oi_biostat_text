library(openintro)
data(COL)

obs = residuals(lm(RFFT ~ Statin + Age, data=statins.samp))

myPDF("logNdrmChAgePlot.pdf",
      6.0,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2) + 0.1,
      mgp = c(2.8, 0.5, 0))
plot(famuss$age,
     log(famuss$ndrm.ch + 5.0),
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "log(ndrm.ch + 5.0)")
points(famuss$age,
       log(famuss$ndrm.ch + 5.0), 
       cex = 1.3,
       col = COL[1])
mtext("Age (yrs)", 1, 1.9)

abline(lm(log(famuss$ndrm.ch + 5.0) ~ famuss$age))

dev.off()
