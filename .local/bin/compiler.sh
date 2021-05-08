#!/bin/sh



file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"


cd "$dir" || exit


textype() { \
	command="pdflatex"
	( sed 5q "$file" | grep -i -q 'xelatex' ) && command="xelatex"
	$command --output-directory="$dir" "$base" &&
	grep -i addbibresource "$file" >/dev/null &&
	biber --input-directory "$dir" "$base" &&
	$command --output-directory="$dir" "$base" &&
	$command --output-directory="$dir" "$base"
}

case "$ext" in
	tex) textype "$file" ;;
    py) python3 "$file" ;;
esac
