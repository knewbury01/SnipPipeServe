############                                                                         # Try to run ppa on set of formatted files                                           # USING JDT in pipeline
#############
mkdir Original
mkdir compileClass
mkdir compileMethodClass
mkdir outputs

for file in ../xx*.java; do

    echo "trying for $file"

    #first attempt with no wrap alterations
    tempfile=$(cat $file | grep "class" | sed -e 's/.*class\(.*\){/\1/' | sed -e 's/.*\(.*\)extends/\1/' | sed -e 's/.*\(.*\)implements/\1/' | sed 's/.*class//' | sed 's/ //g')
    tempfile=${tempfile#../}.java

    echo "Rename $file as $tempfile"

    cat imports.txt >> $tempfile

    cat $file | sed '/@/d' | sed 's/<[^<>]*>//' | sed 's/<[^<>]*>//' | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile

    outputfile=${tempfile%.java}.txt
    ./runJDT.sh $tempfile Original &> outputs/ORIG$outputfile
    if ! grep -q "error" outputs/ORIG$outputfile ; then
       mv classes/${tempfile%.java}.class Original/${tempfile%.java}.class
       mv $tempfile Original/$tempfile

       else

	   rm $tempfile

    #SECOND TRY
    #wrap just class attempt
    tempfile=JDT${file#../}

    #add imports
    cat imports.txt >> $tempfile

    echo "class ${tempfile%.java} {" >> $tempfile
    #replace annotations, generics and imports and elipses and packages
    cat $file | sed '/@/d' | sed 's/<[^<>]*>//' | sed 's/<[^<>]*>//' | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile
    echo "}" >> $tempfile

    #check if this successfully compiled
    outputfile=${tempfile%.java}.txt
    ./runJDT.sh $tempfile compileClass &> outputs/CLASS$outputfile 
    if ! grep -q "error" outputs/CLASS$outputfile ; then
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

	   ./runJDT.sh $tempfile compileMethodClass &> outputs/METHOD$outputfile
	   if ! grep -q "error" outputs/METHOD$outputfile ; then
	       mv classes/${tempfile%.java}.class compileMethodClass/${tempfile%.java}.class
	       mv $tempfile compileMethodClass/$tempfile
	       fi
    fi

    fi

    
done

#print a summary
./pipesummary.sh
