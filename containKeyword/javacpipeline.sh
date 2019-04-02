############                                                                                  
# Try to run ppa on set of formatted files                                                    
# by performing some steps, if each fails,
# perform the next refinement
#
# sootPPA does not handle java annotations, thus these are removed
# imports are also removed, as sootPPA allows for phantom-refs
#
#############

mkdir javaccompileClass
mkdir javaccompileMethodClass
mkdir javacoutputs
mkdir javacclasses

for file in xx*.java; do

    echo "trying for $file"
    #wrap just class attempt
    tempfile=J$file

    #trying now with imports
    echo "import javax.net.ssl.*;                                           
import java.util.*;                                                            
import javax.crypto.*;
import java.lang.*;                                                            
import java.io.*;                                                              
import java.security.*;                                                        
import java.net.*;" >> $tempfile

    echo "class ${tempfile%.java} {" >> $tempfile
    cat $file | sed '/@/d' >> $tempfile
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

	echo "import javax.net.ssl.*;                                          
import java.util.*;                                                                    import javax.crypto.*;
import java.lang.*;                                                            
import java.io.*;                                                             
import java.security.*;                                                        
       import java.net.*;" >> $tempfile
	
	   echo "class ${tempfile%.java} {" >> $tempfile
	   echo "public void placeholder(){" >> $tempfile
	   cat $file | sed '/@/d' >> $tempfile
	   echo "} }" >> $tempfile

	   javac -d javacclasses $tempfile &> javacoutputs/METHOD$outputfile
	   if ! grep -q "error" javacoutputs/METHOD$outputfile; then
	       mv javacclasses/${tempfile%.java}.class javaccompileMethodClass/${tempfile%.java}.class
	       mv $tempfile javaccompileMethodClass/$tempfile
	       fi
    fi
done

echo -n "This number of files succeeded with just class wrapping: "
ls -la javaccompileClass | grep ".class" | wc -l
echo -n "This number of files succeeded with method AND class wrapping: "
ls -la javaccompileMethodClass | grep ".class" | wc -l
