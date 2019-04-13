
png(file="PieJavaC.png", width     = 3.25,
  height    = 2.25,
  units     = "in",
  res       = 1200,
  pointsize = 4)

slices <- c(1, 6, 3)

lbls <- c("NoObject", "ContainObj&Misuse", "ContainObj&NoMisuse")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="")

pie(slices, labels = lbls, main = "Categories of Findings for 10 Snippets Compiled by Javac")
