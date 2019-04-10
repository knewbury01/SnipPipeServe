################
#takes an arg of what to build
#
# usage:
#    ./makePdf.sh 663REPORT 
#################

pdflatex $1
biber $1
pdflatex $1
