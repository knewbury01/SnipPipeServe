############
# Try to run ppa on set of formatted files
#
#############

for file in X*.java; do

    #try generate the classfile for this                                                      
    ./runPPA.sh $file
    
    done
