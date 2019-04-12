############### 
# Filters files into other directory if the contain interesting keywords
# idea here: no point running ppa on things without the keywords
#
# partial match approach                                                            
#                                                                                    
# example: term: Provider                                                            
# will match: @Provider and Provider(anything                                        
# will also match: FakeProvider 
###############
mkdir containKeyword

for file in xx*; do
    
    if grep -qE "Provider|Security|SecureRandom|MessageDigest|Signature|Cipher|KeyFactory|KeyGenerator|KeyAgreement|KeyStore|CertificateFactory|KeyPair|KeySpec|AlgorithmParameter" $file
    then
	mv $file containKeyword/${file}.java
    fi

done

echo -n "This many snippets contained at least one keyword: "
ls containKeyword/xx* | wc -l
echo -n "This many snippets did not contain at least one keyword: "
ls xx* | wc -l
