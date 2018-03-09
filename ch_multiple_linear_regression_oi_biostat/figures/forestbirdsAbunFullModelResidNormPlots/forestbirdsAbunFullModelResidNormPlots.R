library(openintro)
library(oibiostat)

data(COL)
data(forest.birds)

forest.birds$log.area = log(forest.birds$patch.area)
forest.birds$log.dist.near.patch = 
  log(forest.birds$distance.nearest.patch)
forest.birds$log.dist.larger.patch = 
  log(forest.birds$distance.larger.patch)
forest.birds$log.years.since.isolation = 
  log(forest.birds$years.since.isolation)


lm.forest.birds = lm(abundance ~ log.area + 
                       log.dist.near.patch +
                       log.dist.larger.patch +
                       altitude +
                       log.years.since.isolation + 
                       grazing.intensity, data = forest.birds)


residuals = resid(lm.forest.birds)
predicted = predict(lm.forest.birds)

myPDF("forestbirdsAbunFullModelResidNormPlots.pdf", 6, 3,
      mfrow = c(1, 2),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 3, .5, .5) + 0.1)
#mar = c(3, 0.2, 1.5, 0.8) + 0.1)

par(mar = c(3,4,1,0))

plot(predicted,
     residuals,
     pch = 19,
     cex = 1,
     col = COL[1, 3],
     xlab = "Predicted Value",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(predicted,
       residuals,
       cex = 1,
       col = COL[1])
#mtext("Predicted Value", 1, 1.9)

abline(lm(residuals ~ predicted), lty = 2)

qqnorm(residuals,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = "Sample Quantiles",
       col = COL[1,3])
axis(1)
axis(2)
qqline(residuals)


dev.off()
