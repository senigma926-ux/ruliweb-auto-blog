#!/bin/bash

URL="https://bbs.ruliweb.com/community/board/300022"

HTML=$(curl -s "$URL")

TOP3=$(echo "$HTML" | grep -oP '(?<=class="subject">).*?(?=</a>)' | head -n 3)

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p data

echo "{
  \"collectedAt\": \"$NOW\",
  \"top1\": \"$(echo "$TOP3" | sed -n '1p')\",
  \"top2\": \"$(echo "$TOP3" | sed -n '2p')\",
  \"top3\": \"$(echo "$TOP3" | sed -n '3p')\"
}" > data/ruliweb_top3.json
