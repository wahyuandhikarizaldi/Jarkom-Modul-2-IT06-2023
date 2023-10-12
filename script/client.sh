echo -e '
nameserver 192.236.2.2 # IP Yudhistira
nameserver 192.236.2.3 # IP Werkudara
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update
apt-get install dnsutils
apt-get install lynx