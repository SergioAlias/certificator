#!/bin/bash

# certificator.sh
# Small script for ad hoc multiple named certificates generation

echo Running $0...

TEMPLATE=$1
NAMES=$2
XML=$3
OUTDIR=$4
TYPE=$5

mkdir -p $OUTDIR

while IFS=';' read -r cole tutor name extra_col_to_avoid_newlines; do

    unzip $TEMPLATE -d tmp_dir
    if [[ "$TYPE" == [Aa] ]]; then
        sed -i "s/NAME_ALUMNO/$name/g" tmp_dir/$XML
        NAME_NO_SP=$(echo "$name" | tr ' ' '_')
    elif [[ "$TYPE" == [Cc] ]]; then
        sed -i "s/NAME_CENTRO/$cole/g" tmp_dir/$XML
        sed -i "s/NAME_TUTOR/$tutor/g" tmp_dir/$XML
        NAME_NO_SP=$(echo "$cole" | tr ' ' '_')
    fi
    cd tmp_dir
    zip -r "../$NAME_NO_SP.pptx" *
    cd ..
    libreoffice --headless --convert-to pdf "$NAME_NO_SP.pptx"
    mv "$NAME_NO_SP.pdf" $OUTDIR
    rm -rf tmp_dir
    rm "$NAME_NO_SP.pptx"
    echo "################## Done -> "$NAME_NO_SP".pdf"

done < $NAMES

echo "################## Finished certificate generation"
echo "######################################################"
echo "################## PDF files can be found at "$OUTDIR