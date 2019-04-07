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
#    ./splitsnippets.sh <file-with-all-snippet-content>
##########################


#first use the split identifier to split content into uniqe code snippets 
echo "SPLITTING $1"
#currently config'd for this exact dataset
#should be able to use {*} (untested)
csplit -n 5 $1 '/---UNIQUEIDFORSNIP---/' {1407} #&>/dev/null

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
