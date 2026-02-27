#!/bin/bash

THRESHOLD=80
EMAIL="$EMAIL"
HOST=$(hostname)
DATE=$(date)
LOGFILE="/var/log/self_healing.log"

TOKEN="$TELEGRAM_TOKEN"
CHAT_ID="$CHAT_ID"

log_message() {
echo "$(date) -$1">> $LOGFILE
}

send_telegram() {
MESSAGE=$1
curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
-d "chat_id=$CHAT_ID" \
-d "text=$MESSAGE"
}
