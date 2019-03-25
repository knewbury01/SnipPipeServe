######################################
#Rules from release 2.0
#build from 5f531d1d4377aefd35cec6658ae95308c6594244
######################################

for file in compileClass/*.class; do

    justfile=${file#compileClass/}
    echo "RUNNING ON $justfile"
    cp $file isolateclass/$justfile
    java -cp /Users/knewbury/Desktop/CryptoAnalysis/CryptoAnalysis/build/CryptoAnalysis-2.1-SNAPSHOT-jar-with-dependencies.jar crypto.HeadlessCryptoScanner --rulesDir=/Users/knewbury/Desktop/CryptoAnalysis/JCA_rules --applicationCp=/Users/knewbury/Desktop/snippets/containKeyword/isolateclass ${justfile%.class} &> CogniCryptResults/${justfile%.class}.txt
    rm isolateclass/$justfile
    
done


for file in compileMethodClass/*.class; do

    justfile=${file#compileMethodClass/}
    echo "RUNNING ON $justfile"
    cp $file isolateclass/$justfile
    java -cp /Users/knewbury/Desktop/CryptoAnalysis/CryptoAnalysis/build/CryptoAnalysis-
2.1-SNAPSHOT-jar-with-dependencies.jar crypto.HeadlessCryptoScanner --rulesDir=/Users/kn
ewbury/Desktop/CryptoAnalysis/JCA_rules --applicationCp=/Users/knewbury/Desktop/snippets
/containKeyword/isolateclass ${justfile%.class} &> CogniCryptResults/${justfile%.class}.
txt
    rm isolateclass/$justfile

done
