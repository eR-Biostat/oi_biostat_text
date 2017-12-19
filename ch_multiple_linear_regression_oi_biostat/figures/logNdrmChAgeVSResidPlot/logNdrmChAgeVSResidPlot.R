library(openintro)
# data(famuss)
data(COL)

obs = residuals(lm(log(ndrm.ch + 5.0) ~ actn3.r577x + age 
           + sex  + bmi, data=famuss))


myPDF("logNdrmChAgeVSResidPlot.pdf",
      6.0,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2) + 0.1,
      mgp = c(2.8, 0.5, 0))
plot(famuss$age,
     obs,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "Residual")
points(famuss$age,
       obs,
       cex = 1.3,
       col = COL[1])
mtext("Age (yrs)", 1, 1.9)

abline(lm(obs ~ famuss$age))

dev.off()

