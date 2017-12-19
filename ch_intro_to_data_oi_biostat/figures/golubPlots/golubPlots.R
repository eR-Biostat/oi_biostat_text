library(openintro)
#data(Golub)
data(COL)

###defining golub.train and golub.test
leuk.type = (Golub$cancer == "aml")
aml.rows = which(leuk.type)

complete.rows = c(1:74)
all.rows = setdiff(complete.rows, aml.rows)

set.seed(5011)
aml.test.rows = sample(aml.rows, 5, replace = FALSE)
set.seed(5011)
all.test.rows = sample(all.rows, 5, replace = FALSE)

test.patients = c(aml.test.rows, all.test.rows)


##set aside 10 patients, others as training
golub.test = Golub[test.patients,]
golub.train = Golub[-test.patients,]

golub.train = Golub[16:35,]


## analysis

gene.matrix = as.matrix(golub.train[,-(1:6)])

leuk.type = (golub.train$cancer == "aml")
table(leuk.type)

aml.mean.expression = apply(gene.matrix[leuk.type == TRUE,], 2, mean)
all.mean.expression = apply(gene.matrix[leuk.type == FALSE,], 2, mean)

diff.mean.expression = (aml.mean.expression - all.mean.expression)




myPDF("golubHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.6, 0.7, 0))
histPlot(diff.mean.expression,
         breaks = 30,
         xlab = 'Difference in Mean Expression (AML-ALL)',
         ylab = "Frequency",
         ylim = c(0, 3750),
         col = COL[1],
         border = COL[5])
dev.off()


myPDF("golubBoxPlot.pdf", 5, 7,
      mar = c(5, 4, 1, 0.5),
      mgp = c(3, 0.25, 0))

boxPlot(diff.mean.expression,
        ylab = 'Difference in Mean Expression (AML-ALL)',
        ylim = c(-30000, 25000),
        pch = 19,
        pchCex = 0.8,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
