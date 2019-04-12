#the pie chart for portions of results from only the objects analyzed total
RScript objonlypie.r

#the pie chart for portions of results from full pipeline, pure match search
RScriptp purematchfullpie.r

#the pie chart for portions of results from full pipeline, partial match search
RScript partialmatchfullpie.r

#generates the figure of distribution of error types found
./collectErrorDist.sh

#generates the figure of distribution of counts of objects in compiled snippets
./CogniCryptResults/getDistributionCountAnalyzedObjects.sh

#generates the figure of distribution of keyword counts in compiled snippets, configurable to title as pure or partial match count, depending on which data is here
./countKeywordDistsInCogAnalyzed.sh
