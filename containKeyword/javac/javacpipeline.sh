############                                                                                  
# Try to run ppa on set of formatted files                                                    
# by performing some steps, if each fails,
# perform the next refinement
#
# sootPPA does not handle java annotations, thus these are removed
# imports are also removed, as sootPPA allows for phantom-refs
#
#############
mkdir javacOrigs
mkdir javaccompileClass
mkdir javaccompileMethodClass
mkdir javacoutputs
mkdir javacclasses

for file in ../xx*.java; do

    echo "trying for $file"

    tempfile=$(cat $file | grep "class" | sed -e 's/.*class\(.*\){/\1/' | sed -e 's/.*\(.*\)extends/\1/' | sed -e 's/.*\(.*\)implements/\1/' | sed 's/.*class//' | sed 's/ //g')
    tempfile=${tempfile}.java
    rm $tempfile
    echo "Rename $file as $tempfile"

    cat javacimports.txt  >> $tempfile

    cat $file | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile

    outputfile=${tempfile%.java}.txt
    javac -d javacclasses $tempfile &> javacoutputs/ORIG$outputfile
    if ! grep -q "error" javacoutputs/ORIG$outputfile; then
       mv classes/${tempfile%.java}.class javacOrigs/${tempfile%.java}.class
       mv $tempfile javacOrigs/$tempfile

       else
	   rm $tempfile
    #wrap just class attempt
    tempfile=J${file#../}

    #trying now with imports                                               
    cat javacimports.txt  >> $tempfile

    echo "class ${tempfile%.java} {" >> $tempfile
    cat $file | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile
    echo "}" >> $tempfile

    #check if this successfully compiled
    outputfile=${tempfile%.java}.txt
    #try compile with javac
    javac -d javacclasses $tempfile &> javacoutputs/CLASS$outputfile
    #if output did not contain error, keep
    if ! grep -q "error" javacoutputs/CLASS$outputfile; then
       mv javacclasses/${tempfile%.java}.class javaccompileClass/${tempfile%.java}.class
       mv $tempfile javaccompileClass/$tempfile
    else
	   #second try, with method and class
	rm $tempfile
	cat javacimports.txt  >> $tempfile
	
	   echo "class ${tempfile%.java} {" >> $tempfile
	   echo "public void placeholder(){" >> $tempfile
	   cat $file | sed '/import/d' | sed '/\.\.\./d'  | sed '/package/d' >> $tempfile
	   echo "} }" >> $tempfile

	   javac -d javacclasses $tempfile &> javacoutputs/METHOD$outputfile
	   if ! grep -q "error" javacoutputs/METHOD$outputfile; then
	       mv javacclasses/${tempfile%.java}.class javaccompileMethodClass/${tempfile%.java}.class
	       mv $tempfile javaccompileMethodClass/$tempfile
	       fi
    fi
    fi
done

#print a summary                                                               
./javacpipesummary.sh
