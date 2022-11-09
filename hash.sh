#!/bin/bash
# Use wildcard otherwise you will have to specify a filename.
echo "Enter path"
read path
for file in $path
do
md5sum -b $file | cut -d' ' -f1 | xxd -r -p | base64
done
