#!/bin/bash
REPO="https://raw.githubusercontent.com/zhets/webmin/main/"
cd
wget -q -O /usr/bin/limit_all_ip "${REPO}limit_all_ip"
chmod +x /usr/bin/*
cd /usr/bin
sed -i 's/\r//' limit_all_ip
cd
clear

# // SERVICE LIMIT IP VMESS
cat >/etc/systemd/system/vmess_ip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=limit_all_ip vmip
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# // SERVICE LIMIT IP VLESS
cat >/etc/systemd/system/vless_ip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=limit_all_ip vlip
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# // SERVICE LIMIT IP TROJAN
cat >/etc/systemd/system/trojan_ip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=limit_all_ip trip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
