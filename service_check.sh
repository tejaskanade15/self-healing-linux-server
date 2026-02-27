#!/bin/bash
source /opt/self-healing/config.sh

SERVICES=(
"sshd"
"httpd"
"firewalld"
"crond"
"NetworkManager"
"postfix"
"mysqld"
"docker"
"grafana-server"
"prometheus"
)

for SERVICE in "${SERVICES[@]}"
do
if systemctl list-unit-files | grep -q "^${SERVICE}.service"
then
systemctl is-active --quiet $SERVICE
if [ $? -ne 0 ]
then
log_message "Service Alert: $SERVICE is DOWN"

systemctl start $SERVICE

echo "Service $SERVICE restarted on $HOST" \
| mail -s "Service Restart Alert on $HOST" "$EMAIL"

send_telegram "Service $SERVICE restarted on $HOST"
fi
fi
done
