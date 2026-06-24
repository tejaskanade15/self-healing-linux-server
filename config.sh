#!/bin/bash

###############################
# SelfHeal Linux Configuration
###############################

# Alert Threshold
THRESHOLD=80

# Email Recipient
EMAIL="tejaskanade80@gmail.com"

# Telegram Bot
TOKEN="8672704932:AAHtECf7TpwQDUruiHgad9r3_bcjuA5BqN8"
CHAT_ID="1470013672"

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
