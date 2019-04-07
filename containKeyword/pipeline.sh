############                                                                                  
# Try to run ppa on set of formatted files                                                    
# by performing some steps, if each fails,
# perform the next refinement
#
# sootPPA does not handle java annotations, thus these are removed
# imports are also removed, as sootPPA allows for phantom-refs
#
#############

mkdir compileClass
mkdir compileMethodClass
mkdir outputs

for file in xx*.java; do

    echo "trying for $file"

    #wrap just class attempt
    tempfile=X$file

    #add imports
    cat imports.txt >> $tempfile

    echo "class ${tempfile%.java} {" >> $tempfile
    #replace annotations, generics and imports 
    cat $file | sed '/@/d' | sed 's/<.*>//' | sed '/import/d' >> $tempfile
    echo "}" >> $tempfile

    #check if this successfully compiled
    outputfile=${tempfile%.java}.txt
    ./runPPA.sh $tempfile &> outputs/CLASS$outputfile 
    if cat outputs/CLASS$outputfile | grep "Soot finished"; then
       mv classes/${tempfile%.java}.class compileClass/${tempfile%.java}.class
       mv $tempfile compileClass/$tempfile
    else
	   #second try, with method and class
	rm $tempfile
         
	cat imports.txt >> $tempfile
	
	   echo "class ${tempfile%.java} {" >> $tempfile
	   echo "public void placeholder(){" >> $tempfile
	   #replace annotations, generics and imports
	   cat $file | sed '/@/d' | sed 's/<.*>//' | sed '/import/d'  >> $tempfile
	   echo "} }" >> $tempfile

	   ./runPPA.sh $tempfile &> outputs/METHOD$outputfile
	   if cat outputs/METHOD$outputfile | grep "Soot finished"; then
	       mv classes/${tempfile%.java}.class compileMethodClass/${tempfile%.java}.class
	       mv $tempfile compileMethodClass/$tempfile
	       fi
    fi

    
done

#put all of the fails into own place
./sortfails.sh


echo -n "This number of files succeeded with just class wrapping: "
ls compileClass | grep ".class" | wc -l
echo -n "This number of files succeeded with method AND class wrapping: "
ls compileMethodClass | grep ".class" | wc -l
#just a test
echo -n "This number of X* files created: "
ls X* | wc -l
echo -n "This number of compile attempts failed: "
ls fails/ | wc -l 
