############### 
# Filters files into other directory if the contain interesting keywords
# idea here: no point running ppa on things without the keywords
#
###############
mkdir containKeyword

for file in xx*; do
    
    if grep -qE "Provider|Security|SecureRandom|MessageDigest|Signature|Cipher|KeyFactory|KeyGenerator|KeyAgreement|KeyStore|CertificateFactory|KeyPair|KeySpec|AlgorithmParameter" $file
    then
	mv $file containKeyword/${file}.java
    fi

done
