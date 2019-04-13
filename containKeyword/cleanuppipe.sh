######################
#
# cleans up the compilation result files
# and also the cognicrypt result files
# produced from prev pipeline run
#
#######################

rm fails/*
rm compileClass/*
rm compileMethodClass/*
rm outputs/*
rm X*
rm CogniCryptResults/*
#this may contain dirs bc of oddities in renaming attempts
rm -rf classes/*
#this one is just an emacs leftover clean, not... safest, but using git so! 
rm *~
