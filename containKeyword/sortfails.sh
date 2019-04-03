mkdir fails

for file in X*.java; do

    cp outputs/CLASS${file%.java}.txt fails
    cp outputs/METHOD${file%.java}.txt fails


    done
