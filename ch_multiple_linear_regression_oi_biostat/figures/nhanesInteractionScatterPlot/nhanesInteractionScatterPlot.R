library(openintro)
library(oibiostat)
data("nhanes.samp.adult.500")
data(COL)

diabetic = subset(nhanes.samp.adult.500, Diabetes == "Yes")
non.diabetic = subset(nhanes.samp.adult.500, Diabetes == "No")

myPDF("nhanesInteractionScatterPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))


plot(nhanes.samp.adult.500$TotChol ~ nhanes.samp.adult.500$Age,
     pch = 21,
     cex = 1.3,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "Total Cholesterol")
abline(lm(diabetic$TotChol ~ diabetic$Age), col = "red")
abline(lm(non.diabetic$TotChol ~ non.diabetic$Age), col = "blue")

mtext("Age (yrs)", 1, 1.9)

dev.off()
