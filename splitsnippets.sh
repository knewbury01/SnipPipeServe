##########################
#creates a set of files
#each containing one snippet
#better to do this here than in db query
#bc it will be faster and more reusable
#
#
# REQUIRES GNU csplit
# BSD split limit behaviour is different
#
# usage:
#    ./splitsnippets.sh <file-with-all-snippet-content> <expected-number-snippets>
##########################


#first use the split identifier to split content into uniqe code snippets 
echo "SPLITTING $1"

#counts the number of expected snips and uses for csplit
#in GNU distribution, a {*} would suffice...
#for Mac, this always errors on EOF, so added a keep results...
numsnips=$(cat $1 | grep "UNIQUEIDFORSNIP" | wc -l | sed 's/ //g')
#numsnips=$((numsnips+1))
echo "number of expected snippets: $numsnips"
csplit -k -n 5 $1 '/---UNIQUEIDFORSNIP---./' {$numsnips} #&>/dev/null

#then remove this identifier
for file in xx*;
do
    #for linux: sed -i 's/---UNIQUEIDFORSNIP---//' $file
    sed -i '' 's/---UNIQUEIDFORSNIP---//' $file    
done

#removes the last | sqlite separator in this data
./rmSqliteSeparator.sh

echo -n "Created this many snippets: "
find . -name "xx*" | wc -l 
