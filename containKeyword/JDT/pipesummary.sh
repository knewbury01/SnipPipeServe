##########################
#produces a summary of the results
#of compilation pipeline 
#
###########################

origs=$(ls Original | grep ".class" | wc -l)
echo "This number of files succeeded with no wrap alteration: $origs"

class=$(ls compileClass | grep ".class" | wc -l)
echo "This number of files succeeded with just class wrapping: $class"

method=$(ls compileMethodClass | grep ".class" | wc -l)
echo "This number of files succeeded with method AND class wrapping: $method"

success=$((class+method+origs))
total=$(ls ../xx* | wc -l)
percent=$(echo "$success/$total" | wc -l)
echo "Total files attempted $total"
echo "Total succeeding compilations: $success , and as a fraction: $percent"

echo -n "This number of JDT* files created: "
ls JDT* | wc -l

