##########################
#produces a summary of the results
#of compilation pipeline 
#
###########################

origs=$(ls javacOrigs | grep ".class" | wc -l)
echo "This number of files succeeded with no wrap alteration: $origs"

class=$(ls javaccompileClass | grep ".class" | wc -l)
echo "This number of files succeeded with just class wrapping: $class"

method=$(ls javaccompileMethodClass | grep ".class" | wc -l)
echo "This number of files succeeded with method AND class wrapping: $method"

success=$((class+method+origs))
total=$(ls xx* | wc -l)
percent=$(echo "$success/$total" | bc -l)
echo "Total succeeding compilations: $success , and as a fraction: $percent"

fails=$((337-total))
echo "This number of compile attempts failed: $fails"
