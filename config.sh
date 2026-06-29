#!/bin/bash

###############################
# SelfHeal Linux Configuration
###############################

# Alert Threshold
THRESHOLD=80

# Email Recipient
EMAIL="YOUR_EMAIL"

# Telegram Bot
TOKEN="YOUR_TELEGRAM_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

# Host Information
HOST=$(hostname)

# Log File
LOGFILE="/var/log/self_healing.log"

#########################################
# Function : Write to log file
#########################################

log_message() {
echo "[$(date '+%d-%b-%Y %I:%M:%S %p')] $1" >> "$LOGFILE"
}

#########################################
# Function : Telegram Notification
#########################################

send_telegram() {

MESSAGE="$1"

curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
-d chat_id="$CHAT_ID" \
-d parse_mode="Markdown" \
-d text="$MESSAGE" >/dev/null

}
