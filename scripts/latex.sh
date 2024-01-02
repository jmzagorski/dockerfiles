#!/usr/bin/env bash
if [ -z "$1"  ]
then
    echo "A markdown file is required as the first argument"
    exit 1
fi

filepath=$1
filename_no_ext="${filepath%.*}"

docker run --rm --volume "$(pwd):/data" --user "$(id -u):$(id -g)" pandoc/latex "$1" -o "$filename_no_ext.pdf"
