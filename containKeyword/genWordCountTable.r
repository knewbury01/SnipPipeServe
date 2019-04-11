png(file="KeywordCounts.png", width     = 5.25,
  height    = 5.25,
  units     = "in",
  res       = 1200,
  pointsize = 4)

args = commandArgs(trailingOnly=TRUE)
counts<- read.table(args[1], header=F, sep="=")

colnames(counts) <- c("Keyword" , "Count")
show(counts)

library(gridExtra)
library(grid)

grid.table(counts)