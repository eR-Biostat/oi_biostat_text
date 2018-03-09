library(openintro)
library(oibiostat)
data(COL)
data("forest.birds")

forest.birds$log.area = log(forest.birds$patch.area)
forest.birds$log.dist.near.patch = log(forest.birds$distance.nearest.patch)
forest.birds$log.dist.larger.patch = log(forest.birds$distance.larger.patch)
forest.birds$log.years.since.isolation = log(forest.birds$years.since.isolation)

myPDF("forestbirdsScatterPlotMatrix.pdf",
#      6, 3.3,
     6,6,
     mar = c(3, 4.5, 0.5, 1.2),
     mgp = c(2.0, 0.5, 0),
     mai = c(0.1, 0.1, 0.1, 0.1))

pairs(~ abundance + log.area + log.dist.near.patch
      + log.dist.larger.patch  + altitude + log.years.since.isolation +
        grazing.intensity, data=forest.birds,
      pch = 21,
      cex = 0.7,
      cex.axis = (0.8),
      bg = COL[1, 3],
      col = COL[1])

dev.off()
