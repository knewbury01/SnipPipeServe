#############################
#WARNING THIS IS RUN FROM splitsnippets.sh
#THUS IT SHOULD NOT BE CALLED MANUALLY
#
# this rm's the "|" character in each file bc of sqlite output
# BUT it rms the FIRST OCCURRENCE
# so if ran twice on same file can result in removing
# a character that was actually supposed to be there
#############################
for file in xx*; do

    #for linux: sed -i 's/|//' $file
    sed -i '' 's/|//' $file

done
