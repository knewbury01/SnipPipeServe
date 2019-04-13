mkdir CogniCryptResultsJavac
mkdir isolateclass

for file in javaccompileClass/*.class; do

    justfile=${file#javaccompileClass/}
    echo "RUNNING ON $justfile"
    cp $file isolateclass/$justfile
    java -cp /Users/knewbury/Desktop/CryptoAnalysis/CryptoAnalysis/build/CryptoAnalysis-2.1-SNAPSHOT-jar-with-dependencies.jar crypto.HeadlessCryptoScanner --rulesDir=/Users/knewbury/Desktop/CryptoAnalysis/JCA_rules --applicationCp=/Users/knewbury/Desktop/snippets/containKeyword/isolateclass ${justfile%.class} &> CogniCryptResultsJavac/${justfile%.class}.txt
    rm isolateclass/$justfile

done

for file in javaccompileMethodClass/*.class; do

    justfile=${file#javaccompileMethodClass/}
    echo "RUNNING ON $justfile"
    cp $file isolateclass/$justfile
    java -cp /Users/knewbury/Desktop/CryptoAnalysis/CryptoAnalysis/build/CryptoAnalysis-2.1-SNAPSHOT-jar-with-dependencies.jar crypto.HeadlessCryptoScanner --rulesDir=/Users/knewbury/Desktop/CryptoAnalysis/JCA_rules --applicationCp=/Users/knewbury/Desktop/snippets/containKeyword/isolateclass ${justfile%.class} &> CogniCryptResultsJavac/${justfile%.class}.txt
    rm isolateclass/$justfile

done

#make summary
./../summary.sh containKeyword/CogniCryptResultsJavac
