
png(file="PieObjOnly.png", width     = 3.25,
  height    = 2.25,
  units     = "in",
  res       = 1200,
  pointsize = 4)

slices <- c(17, 16, 1)

lbls <- c("Misuse", "NoMisuse", "AnalysisError")

pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="")

pie(slices, labels = lbls, main = "Categories of Findings for 33 Snippets Containing Objects")
