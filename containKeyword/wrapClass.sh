#################
# Wraps some code snippet in a class declaration
# result placed in X{id} file, orig maintained for possible method wrap if need be
# removes annotations as well since these were intro'd in java 5, ppa supports up to 4
#
# 
##################

for file in *.java; do
 
    echo "class X${file%.java} {" >> X$file
    cat $file | sed '/@/d' >> X$file
    echo "}" >> X$file


    
    done
