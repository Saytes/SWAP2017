#!/bin/bash

CCDATABASE="./cc.txt"
IPINFOO="ipinfo.io/"

case $# in
    1)
        IN="$1"
        ;;
    2)
        if [ "$1" = "-v" ]; then
            IN="$2"
        fi
        if [ "$1" = "-m" ]; then
            IN="$2"
            echo "IP,Country,Region,Org,Lat,Lon"
        fi
        ;;
    *)
        IN=""
        ;;
esac

if [ "$IN" = "" ]; then
    echo "Usage: $0 [OPTIONS] INPUT-IPS"
    echo "OPTIONS:"
    echo "  -v: Increase verbosity level"
    echo "  -m: Data Map version"
    exit 1
fi

while read line
do
    URL="$line"
    IPINFO=$(curl $IPINFOO$URL 2>/dev/null)
    IP=$(echo "$IPINFO" | grep '"ip"' | cut -d'"' -f4)
    CITY=$(echo "$IPINFO" | grep '"city"' | cut -d'"' -f4)
    CC=$(echo "$IPINFO" | grep '"country"' | cut -d'"' -f4)
    REGION=$(echo "$IPINFO" | grep '"region"' | cut -d'"' -f4)
    ORG=$(echo "$IPINFO" | grep '"org"' | cut -d'"' -f4)
    LOC=$(echo "$IPINFO" | grep '"loc"' | cut -d'"' -f4)
    COUNTRY=$(grep -i ":$CC" $CCDATABASE | cut -d':' -f1)
    case "$1" in
        "-v")
            echo "IP: $IP       City: $CITY     Country: $COUNTRY"
            ;;
        "-m")
            echo "$IP,$CC,$REGION,$ORG,$LOC"
            ;;
        *)
            echo "$IPINFO"
            ;;
    esac
done < "$IN"