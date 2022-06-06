#!/bin/bash
# Use wildcard otherwise you will have to specify a filename.
echo "Enter path"
read path
FILES=$path

for png in $path
do
md5sum -b $png | cut -d' ' -f1 | xxd -r -p | base64 >> hashes.txt
awk '{print "/"$0"/"}' hashes.txt > hashes-4chanx.txt
rm hashes.txt
done
