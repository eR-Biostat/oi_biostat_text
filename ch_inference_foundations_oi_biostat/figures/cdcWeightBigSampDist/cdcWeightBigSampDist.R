require(openintro)
data(COL)


set.seed(5)
N     <- 100000
means <- rep(0, N)
pb <- txtProgressBar(0, N, style = 3)
for (i in 1:N) {
  tmp <- sample(nrow(cdc), 60)
  tmp <- tmp[!is.na(tmp)][1:60]
  means[i] <- mean(cdc$weight[tmp], na.rm = TRUE)
  setTxtProgressBar(pb, i)
}

myPDF('cdcWeightBigSampDist.pdf', 8, 3.15,
      mar = c(3.3, 4, 1.4, 1),
      mgp = c(2.7,0.55,0))
layout(matrix(1:2, 1),
       c(4.3, 3))
plot(0, 0,
     type = 'n',
     xlim = c(150, 190),
     ylim = c(0,4000),
#     ylim = c(0, 3000 * N / 25000),
     xlab = '',
     ylab = '',
     axes = FALSE)
mtext("Sample Mean", 1, 2)
mtext("Frequency", 2, line = 3, las = 0)
m <- mean(cdc$weight, na.rm = TRUE)
s <- sd(cdc$weight, na.rm = TRUE) / sqrt(60)
rect(m - s / 100, 0,
     m + s / 100, 1350,
     col = '#00000044',
     border = '#00000000')
rect(m - s, 0,
     m + s, 135000,
     col = '#00000011',
     border = '#00000000')
rect(m - 2 * s, 0,
     m + 2 * s, 135000,
     col = '#00000011',
     border = '#00000000')
rect(m - 3 * s, 0,
     m + 3 * s, 135000,
     col = '#00000011',
     border = '#00000000')
histPlot(means,
         col = COL[1],
         breaks = 100,
         #breaks = seq(130,200, length.out = 5),
         add = TRUE)
abline(h = 0)
axis(1, at = seq(140, 190, 5))
axis(2, at = seq(0, 20000, 2000))

par(las = 1, mar = c(4, 4, 1.4, 1))
q <- c(seq(0.00001, 0.0009, 0.00001),
       seq(0.001, 0.999, 0.0001),
       seq(0.9991, 0.99999, 0.00001))
ms <- quantile(means, q)
nq <- qnorm(q)
plot(nq, ms,
     xlab = "",
     ylab = 'Sample means',
     main = '',
     col = COL[1],
     axes = FALSE)
mtext("Theoretical quantiles", 1, 2)
axis(1)
axis(2, seq(140, 190, 10))
box()
dev.off()
