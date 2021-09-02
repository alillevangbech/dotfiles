#!/bin/sh
# some smart comment which would be helpful in the future.
basename="$(echo "${*}" | sed 's/\.[^\/.]*$//')"

echo $basename

case "$1" in
	*.tex) "$READER" "$basename".pdf ;;
esac

