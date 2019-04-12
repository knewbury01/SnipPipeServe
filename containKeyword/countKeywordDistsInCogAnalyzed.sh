#######################
#generates a table of the counts of occurrences of keywords 
#in the COMPILED snippets
#only searches the *.java files
#each line in the table is the total unique "first" occurrences of a keyword
#
#grep is setup currently to run on MACOSX, linux will need a tweak
#######################
declare -a compiledirs=("Original" "compileClass" "compileMethodClass")

declare -a arr=("Provider" "Security" "SecureRandom" "MessageDigest" "Signature" "Cipher" "KeyFactory" "KeyGenerator" "KeyAgreement" "KeyStore" "CertificateFactory" "KeyPair" "KeySpec" "AlgorithmParameter")

rm wordCountTableForAnalyzed.txt

#for each compiled snippet dir 
for dir in "${compiledirs[@]}"; do
    
    #for each snippet in that dir
    for file in $dir/*.java; do
	total=0
	for keyword in "${arr[@]}"; do
	    #count the presence of each keyword
	    if grep -lq "\<$keyword\>" $file; then
		total=$((total+1))
	    fi
	done

	echo "$total" >> wordCountTableForAnalyzed.txt 
done
done

RScript KeywordDistsInCogAnalyzed.r wordCountTableForAnalyzed.txt
