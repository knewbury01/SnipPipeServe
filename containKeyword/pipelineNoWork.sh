mkdir Original

for file in Xxx*.java; do

    file=${file#X}
    tempfile=O$file
    echo "trying for $file"

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

    #check if this successfully compiled                                        
    outputfile=${tempfile%.java}.txt
    ./runPPA.sh $tempfile &> outputs/ORIG$outputfile
    if cat outputs/ORIG$outputfile | grep "Soot finished"; then
       mv classes/${tempfile%.java}.class Original/${tempfile%.java}.class
       mv $tempfile Original/$tempfile
    else
           
    rm $tempfile

    
done

echo -n "This number of files succeeded with no alterations: "
ls Original/ | grep ".class" | wc -l
