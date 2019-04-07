mkdir Original
mkdir OrigsFailed

for file in Xxx*.java; do

    file=${file#X}
    #complex, but we gotta extract the class name from the file to name it
    #gotta deal with ... chopping off extends/implements
    #and sometimes the brace is there and sometimes not
    tempfile=$(cat $file | grep "class" | sed -e 's/.*class\(.*\){/\1/' | sed -e 's/.*\(.*\)extends/\1/' | sed -e 's/.*\(.*\)implements/\1/' | sed 's/.*class//' | sed 's/ //g')
    tempfile=${tempfile}.java
    
    echo "trying for $file, named as $tempfile"
    
    echo "import javax.net.ssl.*;                                              
import java.util.*;                                                            
import java.lang.*;                                                            
import java.io.*;                                                              
import java.security.*;                                                        
import java.net.*;                                                             
import javax.crypto.*;                                                         
import java.math.BigInteger;                                                   
import java.nio.charset.StandardCharsets;                                      
import groovy.grape.Grape;                                                     
import org.apache.shiro.crypto.hash.Sha256Hash;                                
import org.spongycastle.util.io.pem.PemObject;                                 
import javax.ejb.EJBAccessException;                                           
import java.lang.reflect.Method;" >> $tempfile

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
