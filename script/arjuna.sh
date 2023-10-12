 echo -e '
nameserver 192.168.122.1
' > /etc/resolv.conf
 apt-get update
 apt-get install bind9 nginx

 echo 'upstream backend {
  server 192.173.3.2:8001; # IP PrabuKusuma
  server 192.173.3.3:8002; # IP Abimanyu
  server 192.173.3.4:8003; # IP Wisanggeni
}

server {
  listen 80;
  server_name arjuna.it06.com www.arjuna.it06.com;

  location / {
    proxy_pass http://backend;
  }
}
' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart