#!/bin/bash

URL="https://bbs.ruliweb.com/community/board/300022/rss"

XML=$(curl -s "$URL")

TOP1=$(echo "$XML" | grep -oP '(?<=<title><!\[CDATA\[).*?(?=\]\]></title>)' | sed -n '2p')
TOP2=$(echo "$XML" | grep -oP '(?<=<title><!\[CDATA\[).*?(?=\]\]></title>)' | sed -n '3p')
TOP3=$(echo "$XML" | grep -oP '(?<=<title><!\[CDATA\[).*?(?=\]\]></title>)' | sed -n '4p')

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p data

echo "{
  \"collectedAt\": \"$NOW\",
  \"top1\": \"$TOP1\",
  \"top2\": \"$TOP2\",
  \"top3\": \"$TOP3\"
}" > data/ruliweb_top3.json
