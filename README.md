# 🚀 Self-Healing Linux Server

## 📖 Project Overview

The **Self-Healing Linux Server** is an automated monitoring and recovery system built using Bash scripting.  
It continuously monitors system services and disk usage every 5 minutes.

If:
- A critical service stops
- Disk usage exceeds threshold

The system will:
- Automatically restart the service
- Log the issue
- Send Telegram notification
- Send Email alert

Additionally, it integrates with:
- Prometheus
- Node Exporter
- Grafana

For real-time monitoring and visualization.

---

## 🎯 Objectives

- Automate Linux server monitoring
- Implement self-healing mechanism
- Provide real-time alerts
- Visualize system metrics
- Improve system reliability

---

## 🛠 Technologies Used

- Bash Scripting
- Cron Jobs
- Prometheus
- Node Exporter
- Grafana
- Telegram Bot API
- Linux (RHEL/CentOS)

---

## 🏗 Project Architecture


+-------------------+
| Node Exporter |
+-------------------+
↓
+-------------------+
| Prometheus |
+-------------------+
↓
+-------------------+
| Grafana |
+-------------------+

Self-Healing Script → Cron (Every 5 min)
→ Telegram Alerts
→ Email Alerts


---

## 📂 Project Structure


self-healing-linux-server/
│
├── config.sh
├── disk_check.sh
├── service_check.sh
├── main.sh
├── monitoring/
│ └── prometheus.yml
└── screenshots/


---

## ⚙ Installation & Setup Guide

### 1️⃣ Clone Repository

```bash
git clone https://github.com/tejaskanade15/self-healing-linux-server.git
cd self-healing-linux-server
2️⃣ Make Scripts Executable
chmod +x *.sh
3️⃣ Configure Alert Settings

Edit config.sh and update:

Disk threshold

Email address

Telegram Bot Token

Chat ID

4️⃣ Setup Cron Job
crontab -e

Add:

*/5 * * * * /path/to/main.sh >> /var/log/cron_self_healing.log 2>&1
📊 Monitoring Stack Setup
Install Node Exporter
sudo dnf install node_exporter -y
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

Check:
http://localhost:9100/metrics

Install Prometheus

Edit prometheus.yml:

scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ["localhost:9100"]

Access:
http://localhost:9090

Install Grafana
sudo dnf install grafana -y
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

Access:
http://localhost:3000

Add Prometheus as data source.

Import dashboard:
Node Exporter Full (ID: 1860)

📩 Alert System

The system sends alerts via:

Telegram Bot API

Email notifications

When:

Disk usage exceeds threshold

Service stops running

🔮 Future Enhancements

Docker containerization

Multi-server monitoring

Slack integration

Web-based dashboard

📌 Conclusion

This project demonstrates automation, monitoring, and self-healing capabilities in Linux systems using open-source tools.
It improves system uptime and reduces manual intervention.

👨‍💻 Author

Tejas Kanade
B.Tech CSE
Major Project – Self Healing Linux Server
