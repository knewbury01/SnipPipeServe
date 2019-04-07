##########################
#creates a set of files
#each containing one snippet
#better to do this here than in db query
#bc it will be faster and more reusable
#
#
# REQUIRES GNU csplit
# BSD split limit behaviour is different 
##########################


#first use the split identifier to split content into uniqe code snippets 
echo "SPLITTING $1"
csplit -n 5 $1 '/---UNIQUEIDFORSNIP---/' {1407} #&>/dev/null

#then remove this identifier
for file in xx*;
do
    #for linux: sed -i 's/---UNIQUEIDFORSNIP---//' $file
    sed -i '' 's/---UNIQUEIDFORSNIP---//' $file    
done

echo -n "Created this many snippets: "
find . -name "xx*" | wc -l 
