library(openintro)
library(oibiostat)

data(COL)
data(forest.birds)

library(plyr)

forest.birds$grazing.level = forest.birds$grazing.intensity
forest.birds$grazing.level = mapvalues(forest.birds$grazing.level,
                                       from = c("light", "less than average",
                                                "average", "moderately heavy"),
                                       to = c("moderate", "moderate", "moderate",
                                              "moderate"))


residuals = resid(lm(abundance ~ log.area + grazing.level, data=forest.birds))
predicted = predict(lm(abundance ~ log.area + grazing.level, data=forest.birds))

myPDF("forestbirdsAbunLogAreaGrazingResidPlots.pdf", 6, 3,
      mfrow = c(1, 3),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 3, .5, .5) + 0.1)
#mar = c(3, 0.2, 1.5, 0.8) + 0.1)
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

plot(forest.birds$log.area,
     residuals,
     pch = 19,
     cex = 1,
     col = COL[1, 3],
     xlab = "log(area)",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(forest.birds$log.area,
       residuals,
       cex = 1,
       col = COL[1])
abline(lm(residuals ~ forest.birds$log.area), lty = 2)

boxplot(residuals ~ forest.birds$grazing.level,
        ylab = 'Residual',
        ylim = c(min(residuals), max(residuals)),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])


dev.off()

