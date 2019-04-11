#######################
#generates a table of the counts of occurrences of keywords 
#in the snippets
#only searches the xx*.java files
#
#grep is setup currently to run on MACOSX, linux will need a tweak
#######################
declare -a arr=("Provider" "Security" "SecureRandom" "MessageDigest" "Signature" "Cipher" "KeyFactory" "KeyGenerator" "KeyAgreement" "KeyStore" "CertificateFactory" "KeyPair" "KeySpec" "AlgorithmParameter")

mkdir wordCountTable.txt


for keyword in "${arr[@]}"; do 

    echo -n "$keyword=" >> wordCountTable.txt
    grep -l -R --include="xx*.java" "$keyword" . | wc -l >> wordCountTable.txt
    
  done

RScript genWordCountTable.r wordCountTable.txt
