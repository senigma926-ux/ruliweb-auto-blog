#!/bin/bash

URL="https://m.ruliweb.com/community/board/300022"

HTML=$(curl -s -A "Mozilla/5.0" "$URL")

TOP1=$(echo "$HTML" | grep -oP 'title="\K[^"]+' | sed -n '1p')
TOP2=$(echo "$HTML" | grep -oP 'title="\K[^"]+' | sed -n '2p')
TOP3=$(echo "$HTML" | grep -oP 'title="\K[^"]+' | sed -n '3p')

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p data

echo "{
  \"collectedAt\": \"$NOW\",
  \"top1\": \"$TOP1\",
  \"top2\": \"$TOP2\",
  \"top3\": \"$TOP3\"
}" > data/ruliweb_top3.json
