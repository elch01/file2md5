#!/bin/bash
# Use wildcard otherwise you will have to specify a filename.
echo "Enter path"
read path
for png in $path
do
md5sum -b $png | cut -d' ' -f1 | xxd -r -p | base64 >> /tmp/hashes.tmp
awk '{print "/"$0"/"}' /tmp/hashes.tmp > hashes.txt
rm /tmp/hashes.tmp
done
