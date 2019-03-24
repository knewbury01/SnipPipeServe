#first use the split identifier to split content into uniqe code snippets 
echo "SPLITTING $1"
csplit -n 5 $1 '/---KNEWBURY---/' {1407} #&>/dev/null
#then remove this identifier
for file in xx*;
do
    sed -i '' 's/---KNEWBURY---//' $file    
done

echo -n "Created this many snippets: "
find . -name "xx*" | wc -l 
