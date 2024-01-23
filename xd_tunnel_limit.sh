#!/bin/bash
REPO="https://raw.githubusercontent.com/zhets/webmin/main/"
function ambil_file() {
cd /usr/bin
echo 'd2dldCAtcSAtTyBsaW1pdF9hbGxfaXAgIiR7UkVQT31saW1pdF9hbGxfaXAiIDsgd2dldCAtcSAtTyByZXN2bSAiJHtSRVBPfXJlc3ZtIiA7IHdnZXQgLXEgLU8gcmVzdmwgIiR7UkVQT31yZXN2bCIgOyB3Z2V0IC1xIC1PIHJlc3RyICIke1JFUE99cmVzdHIiCg==' | base64 -d | bash
chmod +x limit_all_ip resvm resvl restr
sed -i 's/\r//' limit_all_ip
cd
cd /etc/systemd/system
wget -q -O ssh_ip.service "${REPO}ssh_ip.service" 
wget -q -O vmess_ip.service "${REPO}vmess_ip.service" 
wget -q -O vless_ip.service "${REPO}vless_ip.service" 
wget -q -O trojan_ip.service "${REPO}trojan_ip.service"
cd
}
function restarting_service() {
echo 'c3lzdGVtY3RsIHN0YXJ0IHZtZXNzX2lwIHN5c3RlbWN0bCBlbmFibGUgdm1lc3NfaXAgc3lzdGVtY3RsIHJlc2F0cnQgdm1lc3NfaXAgc3lzdGVtY3RsIHN0YXJ0IHZsZXNzX2lwIHN5c3RlbWN0bCBlbmFibGUgdmxlc3NfaXAgc3lzdGVtY3RsIHJlc3RhcnQgdmxlc3NfaXAgc3lzdGVtY3RsIHN0YXJ0IHRyb2phbl9pcCBzeXN0ZW1jdGwgZW5hYmxlIHRyb2phbl9pcCBzeXN0ZW1jdGwgcmVzdGFydCB0cm9qYW5faXAgc3lzdGVtY3RsIHN0YXJ0IHNzaF9pcCBzeXN0ZW1jdGwgZW5hYmxlIHNzaF9pcCBzeXN0ZW1jdGwgcmVzdGFydCBzc2hfaXAK' | base64 -d | sh
}

ambil_file
restarting_service
