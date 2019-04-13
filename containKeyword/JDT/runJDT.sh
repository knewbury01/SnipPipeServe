################                                                                     
# Runs compile attempt on some formatted code snip                                   
#                                                                                    
# Expected usage:                                                                    
#    ./runJDT.sh <formatted-codesnip-java-file> <output-dir>                         
#                                                                                    
# Expected output: classfile for above                                               
#                                                                                    
################# 
gtimeout 20 java -jar ecj-3.6.jar -classpath rt.jar:. -d $2 $1

