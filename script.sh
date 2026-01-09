#!/bin/bash

URL="https://m.ruliweb.com/community/board/300022"

HTML=$(curl -s -A "Mozilla/5.0" "$URL")

TOP3=$(echo "$HTML" \
  | grep -oP 'title="\K[^"]+' \
  | head -n 3)

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

mkdir -p data

cat <<EOF > data/ruliweb_top3.json
{
  "collectedAt": "$NOW",
  "top1": "$(echo "$TOP3" | sed -n '1p')",
  "top2": "$(echo "$TOP3" | sed -n '2p')",
  "top3": "$(echo "$TOP3" | sed -
