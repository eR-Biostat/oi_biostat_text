library(openintro)
library(oibiostat)
data(forest.birds)
data(COL)

forest.birds$log.area = log(forest.birds$patch.area)
forest.birds$log.dist.near.patch = log(forest.birds$distance.nearest.patch)
forest.birds$log.dist.larger.patch = log(forest.birds$distance.larger.patch)
forest.birds$log.years.since.isolation = log(forest.birds$years.since.isolation)


myPDF("forestbirdsLogPredictorDist.pdf", 6.6, 4,
      mfrow = c(2,2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 2, 1, 1))
#mar = c(3, 0, 1, 1))
histPlot(log(forest.birds$patch.area),
         breaks = 10,
         xlab = 'log(area)',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(log(forest.birds$distance.nearest.patch),
         breaks = 10,
         xlab = "log(distance.nearest.patch)",
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(log(forest.birds$distance.larger.patch),
         breaks = 10,
         xlab = "log(distance.larger.patch)",
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(log(forest.birds$years.since.isolation),
         breaks = 10,
         xlab = "log(years.since.isolation)",
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])

dev.off()
