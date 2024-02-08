#!/bin/bash
apt update;
apt-get install python3 -y;
apt-get install python3-pip -y;
pip3 install flask

wget -q -O /usr/bin/backend "https://raw.githubusercontent.com/bokir-tampan/ranjau-darate/main/gretonger"
chmod +x /usr/bin/backend

cat >/etc/systemd/system/backend.service << EOF
[Unit]
Description=My Project
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 /usr/bin/backend 0.0.0.0 meki
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart backend
systemctl enable backend
