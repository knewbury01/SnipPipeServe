#############################
#WARNING ONLY RUN THIS ONCE PER FILESET
#
# this rm's the "|" character in each file bc of sqlite output
# BUT it rms the FIRST OCCURRENCE
# so if ran twice on same file can result in removing
# a character that was actually supposed to be there
#############################
for file in *.java; do


    sed -i '' 's/|//' $file

done
