png(file="ObjectDist.png", width     = 2.25,
  height    = 2.25,
  units     = "in",
  res       = 1200,
  pointsize = 4)

args = commandArgs(trailingOnly=TRUE)
counts<- read.table(args[1], header=F)

show(counts)
table(counts$V1)

barplot(table(counts$V1),

main ="Distribution of Objects Found Across Compiled Snippets",
ylab="Number of Compiled Snippet Containing Object Count",
xlab="Number of Objects",
ylim=c(0, 20)
)