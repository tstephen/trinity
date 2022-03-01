#
# Convert PDF to Asciidoc
# 
# Place pdf in `static/pdfs` dir and supply filename without .pdf suffix
# Asciidoc will be output to content/sources
#

TMP=tmp
INDIR=static/pdfs
OUTDIR=content/sources

# make any dirs needed
if [ ! -d $TMP ]; then
  mkdir $TMP
fi

# Convert the pdf into pictures, one file per page
pdftoppm -png $INDIR/$1.pdf $TMP/$1
# Scan each image into a text file
cd $TMP
for i in $1-??.png; do tesseract "$i" "text-$i" -l eng; done;
cd ..
# recombine the text files as a single asciidoc file
# inc. rejoin words split across lines with a hyphen
cat $TMP/text-$1* | sed -z "s/-\n//g" > $OUTDIR/$1.adoc
