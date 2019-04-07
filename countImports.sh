nokey=0
key=0

for file in containKeyword/xx*;do

    if cat $file | grep -q "import";then
	key=$((key+1))
    fi

done

for file in noKeywords/xx*;do

    if cat $file | grep -q "import";then
        nokey=$((nokey+1))
    fi

done

echo "Number of files containing imports: $((key+nokey))"
echo "Number of files containing imports in noKeywords: $nokey"
echo "Number of files containing imports in containKeyword: $key"
