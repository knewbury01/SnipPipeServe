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

for file in *.java; do

    echo "trying for $file"
    #wrap just class attempt
    tempfile=X$file

    #trying now with imports
    echo "import javax.net.ssl.*;                                           
import java.util.*;                                                            
import java.lang.*;                                                            
import java.io.*;                                                              
import java.security.*;                                                        
import java.net.*;" >> $tempfile

    echo "class ${tempfile%.java} {" >> $tempfile
    cat $file | sed '/@/d' >> $tempfile
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

	echo "import javax.net.ssl.*;                                                   
import java.util.*;                                                                     
import java.lang.*;                                                                     
import java.io.*;                                                                       
import java.security.*;                                                                 
import java.net.*;" >> $tempfile
	
	   echo "class ${tempfile%.java} {" >> $tempfile
	   echo "public void placeholder(){" >> $tempfile
	   cat $file | sed '/@/d' >> $tempfile
	   echo "} }" >> $tempfile

	   ./runPPA.sh $tempfile &> outputs/METHOD$outputfile
	   if cat outputs/METHOD$outputfile | grep "Soot finished"; then
	       mv classes/${tempfile%.java}.class compileMethodClass/${tempfile%.java}.class
	       mv $tempfile compileMethodClass/$tempfile
	       fi
    fi
done

echo -n "This number of files succeeded with just class wrapping: "
ls -la compileClass | grep ".class" | wc -l
echo -n "This number of files succeeded with method AND class wrapping: "
ls -la compileMethodClass | grep ".class" | wc -l
