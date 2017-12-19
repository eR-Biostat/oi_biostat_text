library(openintro)
data(COL)

myPDF('mammogramPValue.pdf', 4.4, 1.87,
      mar = c(1.5, 1, 0.2, 1),
      mgp = c(2.1, 0.45, 0))

X <- seq(0, 25, 0.05)
Y <- dchisq(X, 1)

plot(X, Y, type = 'l', axes = FALSE, xlim = c(0, 15))
axis(1)
these <- which(X > 0.01748)
polygon(c(X[these[1]], X[these], X[rev(these)[1]]),
        c(0, Y[these], 0), col = COL[1])
lines(X, Y)
abline(h = 0)
dev.off()
