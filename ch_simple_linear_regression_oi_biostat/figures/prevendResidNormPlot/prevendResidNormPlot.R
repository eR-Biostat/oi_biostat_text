library(openintro)
library(oibiostat)
data(COL)
data(prevend)

NormalHist <- function(obs, hold, M, SD, col) {
  plot(0, 0,
       type = 'n',
       xlab = 'Residuals',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = M + c(-3, 3) * SD,
       ylim = c(0, max(hold$density)))
  for (i in 1:length(hold$counts)) {
    rect(hold$breaks[i], 0,
         hold$breaks[i + 1], hold$density[i],
         col = col)
  }
  axis(1)
  x <- seq(min(obs) - 2, max(obs) + 2, 0.01)
  y <- dnorm(x, M, SD)
  lines(x, y, lwd = 1.5)
}

# source("famussHeightWeightHelpers.R")

obs = residuals(lm(RFFT ~ Age, data=prevend.samp))
hold <- hist(obs, plot = FALSE)

myPDF("prevendResidNormPlot.pdf", 6, 3,
      mfrow = c(1, 2),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 0.2, 0.5, 0.8))
NormalHist(obs, hold, 
           mean(obs), 
           sd(obs),
           COL[1])

par(mar = c(3,4,1,0))

qqnorm(obs,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = "Sample Quantiles",
       col = COL[1,3])
axis(1)
axis(2)
qqline(obs)

dev.off()