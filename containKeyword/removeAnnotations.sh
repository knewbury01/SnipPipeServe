for file in X*.java; do

    sed -i '' '/@/d' $file
    
    done
