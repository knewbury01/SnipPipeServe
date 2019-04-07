######################
#prints some stats for the directory provided
#
#counts the avg loc of each snippet, floor rounded
#also gives total num snips with less than 3 lines code
#
# usage:
#     ./countlinescode.sh <dir-to-summarize> 
######################


loc=0
lowerthan=0
lowerthres=5

for file in $1/xx*; do

    var=$(cat $file | wc -l)
    loc=$((var+loc))

    if (( $loc < $lowerthres )) ;then
	lowerthan=$((lowerthan+1))
    fi
    
    done

numsnips=$(ls xx* | wc -l)
echo "Total loc for $numsnips snippets: $loc"
echo "Average loc $((loc/numsnips))"
echo "Number of snippets with less than $lowerthres loc: $lowerthan"
