##########################
#produces a summary of the results
#of compilation pipeline 
#
###########################

class=$(ls compileClass | grep ".class" | wc -l)
echo "This number of files succeeded with just class wrapping: $class"

method=$(ls compileMethodClass | grep ".class" | wc -l)
echo "This number of files succeeded with method AND class wrapping: $method"

success=$((class+method))
total=$(ls xx* | wc -l)
percent=$(echo "$success/$total" | bc -l)
echo "Total succeeding compilations: $success , and as a fraction: $percent"

echo -n "This number of X* files created: "
ls X* | wc -l

fails=$(ls fails/ | wc -l)
echo "This number of compile attempts failed: $((fails/2))"

echo "(The above two numbers should be equal)"
