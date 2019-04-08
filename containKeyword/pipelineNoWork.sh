#####################
#trys to compile the snippets
#with no wrap
#still performs the same tweaks as full pipeline
#separate bc ... complexity?
#
#
######################
mkdir outputs
mkdir Original
mkdir OrigsFailed

for file in xx*.java; do

    #complex, but we gotta extract the class name from the file to name it
    #gotta deal with ... chopping off extends/implements
    #and sometimes the brace is there and sometimes not
    tempfile=$(cat $file | grep "class" | sed -e 's/.*class\(.*\){/\1/' | sed -e 's/.*\(.*\)extends/\1/' | sed -e 's/.*\(.*\)implements/\1/' | sed 's/.*class//' | sed 's/ //g')
    tempfile=${tempfile}.java
    
    echo "trying for $file, named as $tempfile"
    
    cat imports.txt >> $tempfile

    cat $file | sed '/@/d' | sed 's/<.*>//' | sed '/import/d' >> $tempfile

    outputfile=${tempfile%.java}.txt
    ./runPPA.sh $tempfile &> outputs/ORIG$outputfile
    if cat outputs/ORIG$outputfile | grep -q "Soot finished"; then
       mv classes/${tempfile%.java}.class Original/${tempfile%.java}.class
       mv $tempfile Original/$tempfile
    else  
       mv $tempfile OrigsFailed/$tempfile
    fi
done

echo -n "This number of files succeeded with no alterations: "
ls Original/ | grep ".class" | wc -l
