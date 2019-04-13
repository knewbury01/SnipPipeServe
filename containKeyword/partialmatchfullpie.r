
png(file="PiePartialMatchFull.png", width     = 3.25,
  height    = 2.25,
  units     = "in",
  res       = 1200,
  pointsize = 4)

slices <- c(138, 164, 17, 16, 2)

lbls <- c("CompilableNoObject", "NotCompilable", "CompilableObjectMisuse", "CompilableObjectNoMisuse", "CompilableObjectError")

pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="")

pie(slices, labels = lbls, main = "Categories of Findings for 337 Snippets Containing Keywords")
