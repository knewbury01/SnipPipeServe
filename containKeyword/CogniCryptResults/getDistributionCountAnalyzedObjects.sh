######################
#generates a boxplot of the distribution
#of number of objects analyzed
#omits counts of 0
#
#again, sed config'd for MACOSX not linux
######################
rm ObjectDistribution.txt
cat *.txt |  grep "Number of Objects" | grep -E "[1-9]" >> ObjectDistribution.txt
sed -i '' 's/Number of Objects Analyzed: //' ObjectDistribution.txt

#sum the total objects found
total=0
while IFS='' read -r line || [[ -n "$line" ]]; do
    total=$((total+line))
done <ObjectDistribution.txt

echo "Total number of objects to analyze found: $total"

RScript objectDist.r ObjectDistribution.txt
