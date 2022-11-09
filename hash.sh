#!/bin/bash
# Use wildcard otherwise you will have to specify a filename.
echo "Enter path"
read path
touch hashes.txt
for file in $path
do
md5sum -b $file | cut -d' ' -f1 | xxd -r -p | base64
done > hashes.txt
awk '{print "/"$0"/"}' hashes.txt > hashes-4chanx.txt
rm hashes.txt
