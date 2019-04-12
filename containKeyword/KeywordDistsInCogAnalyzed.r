png(file="CompiledKeywordDist.png", width     = 2.5,
  height    = 2.25,
  units     = "in",
  res       = 1200,
  pointsize = 4)

args = commandArgs(trailingOnly=TRUE)
counts<- read.table(args[1], header=F)

show(counts)
table(counts$V1)

barplot(table(counts$V1),

main ="Distribution of Keyword Found in Compiled Snippets (Partial Match)",
ylab="Number of Compiled Snippet Containing Keyword Count",
xlab="Number of Keyword per File",
ylim=c(0, 100)
)