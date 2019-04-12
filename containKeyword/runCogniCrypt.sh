######################################
#Rules from release 2.0
#build from 5f531d1d4377aefd35cec6658ae95308c6594244
######################################
mkdir CogniCryptResults
mkdir isolateclass

declare -a dir=("Original" "compileClass" "compileMethodClass")

for dir in "${dir[@]}";do
for file in $dir/*.class; do

    justfile=${file#$dir/}
    echo "RUNNING ON $justfile"
    cp $file isolateclass/$justfile
    java -cp $(pwd)/CryptoAnalysis-2.1-SNAPSHOT-jar-with-dependencies.jar crypto.HeadlessCryptoScanner --rulesDir=$(pwd)/JCA_rules --applicationCp=$(pwd)/isolateclass ${justfile%.class} &> CogniCryptResults/${justfile%.class}.txt
    rm isolateclass/$justfile
    
done
done
