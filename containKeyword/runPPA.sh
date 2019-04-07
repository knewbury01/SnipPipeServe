################
# Runs ppa on some formatted code snip
# 
# Expected usage:
#    ./runPPA.sh <formatted-codesnip-java-file>
#
# Expected output: classfile for above
#
#################

gtimeout 20 java -jar /Users/knewbury/Desktop/ppa_0.1.jar -src-prec java -allow-phantom-refs -d classes -cp rt.jar:. ${1%.java}
