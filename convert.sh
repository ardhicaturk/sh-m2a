#!/bin/bash

read -p "Masukkan directory markdown: "  dir
echo "DIR=$dir"

echo "Convert *.md to *.adoc ...";
rm -rf ascii/ || true # delete existing asciidoc
mkdir ascii # create new directory
find $dir -name "*.md" -type f -exec sh -c \
    'kramdoc --format=GFM --wrap=ventilate --output=ascii/{}.adoc {}' \; # convert to asciidoc
find ascii/md/ -type f -name "*.adoc" -exec rename s/".md"/""/g {} \; # remove .md in name


echo "Convert *.adoc to HTML ...";
rm -rf html; # delete existing HTML
mkdir html; # create HTML directory
cp -R md/assets ascii/
find ./ascii -name "*.adoc" -type f -exec sh -c 'asciidoctor -a data-uri -D html/ {}' \; # convert .adoc to HTML


echo "Convert *.adoc to PDF ...";
rm -rf pdf; # delete existing HTML
mkdir pdf; # create HTML directory
find ./ascii -name "*.adoc" -type f -exec sh -c 'asciidoctor-pdf -D pdf/ {}' \; # convert .adoc to PDF