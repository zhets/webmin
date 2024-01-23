#!/bin/bash
REPO="https://raw.githubusercontent.com/zhets/webmin/main/"
cd /usr/bin
wget -q -O limit_all_ip "${REPO}limit_all_ip"
chmod +x /usr/bin/limit_all_ip
sed -i 's/\r//' limit_all_ip
cd
cd /etc/systemd/system
wget -q -O ssh_ip.service "${REPO}ssh_ip.service"
wget -q -O vmess_ip.service "${REPO}vmess_ip.service"
wget -q -O vless_ip.service "${REPO}vless_ip.service"
wget -q -O trojan_ip.service "${REPO}trojan_ip.service"
cd
systemctl start vmess_ip
systemctl enable vmess_ip
systemctl resatrt vmess_ip
systemctl start vless_ip
systemctl enable vless_ip
systemctl restart vless_ip
systemctl start trojan_ip
systemctl enable trojan_ip
systemctl restart trojan_ip
