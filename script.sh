#!/bin/bash

URL="https://bbs.ruliweb.com/community/board/300143/rss"

XML=$(curl -s "$URL")

TITLES=$(echo "$XML" \
  | tr '\n' ' ' \
  | grep -oP '(?<=<item>).*?(?=</item>)' \
  | grep -oP '(?<=<title>).*?(?=</title>)')

TOP1=$(echo "$TITLES" | sed -n '1p')
TOP2=$(echo "$TITLES" | sed -n '2p')
TOP3=$(echo "$TITLES" | sed -n '3p')

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p data

echo "{
  \"collectedAt\": \"$NOW\",
  \"top1\": \"$TOP1\",
  \"top2\": \"$TOP2\",
  \"top3\": \"$TOP3\"
}" > data/ruliweb_top3.json
