#!/bin/sh
# some smart comment which would be helpful in the future.
basename="$(echo "${*}" | sed 's/\.[^\/.]*$//')"

echo $basename

case "$1" in
	*.tex) "$READER" "$basename".pdf ;;
	*.html) setsid -f "$BROWSER" "$basename".html >/dev/null 2>&1 ;;
esac

