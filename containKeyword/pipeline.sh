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

for file in *.java; do

    echo "trying for $file"
    #wrap just class attempt
    tempfile=X$file
    echo "class ${tempfile%.java} {" >> $tempfile
    cat $file | sed '/@/d' >> $tempfile
    echo "}" >> $tempfile

    #check if this successfully compiled
    if ./runPPA.sh $tempfile | grep "Soot finished"; then
       mv classes/${tempfile%.java}.class compileClass/${tempfile%.java}.class
       else
	   #second try, with method and class
	   rm $tempfile
	   echo "class ${tempfile%.java} {" >> $tempfile
	   echo "public void placeholder(){" >> $tempfile
	   cat $file | sed '/@/d' >> $tempfile
	   echo "} }" >> $tempfile

	   if ./runPPA.sh $tempfile | grep "Soot finished"; then
	       mv classes/${tempfile%.java}.class compileMethodClass/${tempfile%.java}.class    
	       fi
    fi
done

echo -n "This number of files succeeded with just class wrapping: "
ls -la compileClass | grep ".class" | wc -l
echo -n "This number of files succeeded with method AND class wrapping: "
ls -la compileMethodClass | grep ".class" | wc -l
