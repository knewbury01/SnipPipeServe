#######################
#generates a table of the counts of occurrences of keywords 
#in the snippets
#only searches the xx*.java files
#
#grep is setup currently to run on MACOSX, linux will need a tweak
#######################
declare -a arr=("Provider" "Security" "SecureRandom" "MessageDigest" "Signature" "Cipher" "KeyFactory" "KeyGenerator" "KeyAgreement" "KeyStore" "CertificateFactory" "KeyPair" "KeySpec" "AlgorithmParameter")

rm wordCountTable.txt
total=0
for keyword in "${arr[@]}"; do 

    echo -n "$keyword=" >> wordCountTable.txt
    grep -l -R --include="xx*.java" " $keyword " . | wc -l >> wordCountTable.txt
    add=$(grep -l -R --include="xx*.java" " $keyword " . | wc -l)
    total=$((total+add))
  done

echo "The total occurrence of keywords is: $total"

RScript genWordCountTable.r wordCountTable.txt
