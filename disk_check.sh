#!/bin/bash
source /opt/self-healing/config.sh

df -h | grep '^/dev/' | while read line
do
USAGE=$(echo "$line" | awk '{print $5}' | sed 's/%//g')
MOUNT=$(echo "$line" | awk '{print $6}')

if [ "$USAGE" -ge "$THRESHOLD" ]
then
MESSAGE="WARNING: Disk usage on $MOUNT is ${USAGE}% on $HOST"

log_message "$MESSAGE"

echo "$MESSAGE" | mail -s "Disk Space Alert on $HOST" "$EMAIL"

send_telegram "Disk Alert on $HOST - $MOUNT at ${USAGE}%"
fi
done
