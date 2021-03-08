#!/bin/sh
STORE=$(pass email/saxo); STORE=($STORE)
USER=$(echo ${STORE[1]} | sed 's/@.*//')
xfreerdp /v:${STORE[2]} /u:${USER} /p:${STORE[0]} /sound:sys:pulse,format:1,quality:high /microphone:sys:pulse,format:1,quality:high /size:1990x1047 
