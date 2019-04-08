############                                                                                  
# Try to run ppa on set of formatted files                                                    
# by performing some steps, if each fails,
# perform the next refinement
#
# sootPPA does not handle java annotations, thus these are removed
# imports are also removed, as sootPPA allows for phantom-refs
#
#############
mkdir Original
mkdir compileClass
mkdir compileMethodClass
mkdir outputs

for file in xx*.java; do

    echo "trying for $file"

    #first attempt with no wrap alterations
    tempfile=$(cat $file | grep "class" | sed -e 's/.*class\(.*\){/\1/' | sed -e 's/.*\(.*\)extends/\1/' | sed -e 's/.*\(.*\)implements/\1/' | sed 's/.*class//' | sed 's/ //g')
    tempfile=${tempfile}.java

    echo "Rename $file as $tempfile"

    cat imports.txt >> $tempfile

    cat $file | sed '/@/d' | sed 's/<[^<>]*>//' | sed 's/<[^<>]*>//' | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile

    outputfile=${tempfile%.java}.txt
    ./runPPA.sh $tempfile &> outputs/ORIG$outputfile
    if cat outputs/ORIG$outputfile | grep -q "Soot finished"; then
       mv classes/${tempfile%.java}.class Original/${tempfile%.java}.class
       mv $tempfile Original/$tempfile

       else

	   rm $tempfile

    #SECOND TRY
    #wrap just class attempt
    tempfile=X$file

    #add imports
    cat imports.txt >> $tempfile

    echo "class ${tempfile%.java} {" >> $tempfile
    #replace annotations, generics and imports and elipses and packages
    cat $file | sed '/@/d' | sed 's/<[^<>]*>//' | sed 's/<[^<>]*>//' | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile
    echo "}" >> $tempfile

    #check if this successfully compiled
    outputfile=${tempfile%.java}.txt
    ./runPPA.sh $tempfile &> outputs/CLASS$outputfile 
    if cat outputs/CLASS$outputfile | grep "Soot finished"; then
       mv classes/${tempfile%.java}.class compileClass/${tempfile%.java}.class
       mv $tempfile compileClass/$tempfile
    else
	#THIRD TRY, with method and class
	rm $tempfile
         
	cat imports.txt >> $tempfile
	
	   echo "class ${tempfile%.java} {" >> $tempfile
	   echo "public void placeholder(){" >> $tempfile
	   #replace annotations, generics and imports and elipses and packages
	   cat $file | sed '/@/d' | sed 's/<[^<>]*>//' | sed 's/<[^<>]*>//' | sed '/import/d'  | sed '/\.\.\./d' | sed '/package/d'  >> $tempfile
	   echo "} }" >> $tempfile

	   ./runPPA.sh $tempfile &> outputs/METHOD$outputfile
	   if cat outputs/METHOD$outputfile | grep "Soot finished"; then
	       mv classes/${tempfile%.java}.class compileMethodClass/${tempfile%.java}.class
	       mv $tempfile compileMethodClass/$tempfile
	       fi
    fi

    fi

    
done

#put all of the fails into own place
./sortfails.sh

#print a summary
./pipesummary.sh
