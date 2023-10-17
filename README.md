![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/e2eb0730-6a7a-4d55-9cbe-02a80b6ee938)# Jarkom-Modul-2-IT06-2023
**Modul 2 Jaringan Komputer 2023**

## Kelompok IT06
| Nama | NRP |
|---------------------------|------------|
|Wahyu Andhika Rizaldi | 5027211003 |
|Sedtia Prakoso | 5027211014 |

## Topologi 5
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/521748d3-e8a6-47ed-86a7-c168028b075e)


## Configuration
- **Pandudewanata**
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
        address 192.236.1.1
        netmask 255.255.255.0

auto eth2
iface eth2 inet static
        address 192.236.2.1
        netmask 255.255.255.0

auto eth3
iface eth3 inet static
        address 192.236.3.1
        netmask 255.255.255.0
```
- **Nakula**
```
auto eth0
iface eth0 inet static
        address 192.236.1.2
        netmask 255.255.255.0
        gateway 192.236.1.1
```
- **Sadewa**
```
auto eth0
iface eth0 inet static
        address 192.236.1.3
        netmask 255.255.255.0
        gateway 192.236.1.1
```
- **Yudhistira**
```
auto eth0
iface eth0 inet static
        address 192.236.2.2
        netmask 255.255.255.0
        gateway 192.236.2.1
```
- **Werkudara**
```
auto eth0
iface eth0 inet static
        address 192.236.2.3
        netmask 255.255.255.0
        gateway 192.236.2.1
```
- **Prabukusuma**
```
auto eth0
iface eth0 inet static
        address 192.236.3.2
        netmask 255.255.255.0
        gateway 192.236.3.1
```
- **Abimanyu**
```
auto eth0
iface eth0 inet static
        address 192.236.3.3
        netmask 255.255.255.0
        gateway 192.236.3.1
```
- **Wisanggeni**
```
auto eth0
iface eth0 inet static
        address 192.236.3.4
        netmask 255.255.255.0
        gateway 192.236.3.1
```
- **Arjuna**
```
auto eth0
iface eth0 inet static
        address 192.236.3.5
        netmask 255.255.255.0
        gateway 192.236.3.1
```

### Setup dan instalasi

- **Router (Pandudewanata)**
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.236.0.0/16
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
```
- **Client (Nakula dan Sadewa)**
```
echo -e '
nameserver 192.236.2.2 # IP Yudhistira
nameserver 192.236.2.3 # IP Werkudara
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update
apt-get install dnsutils
apt-get install lynx
```
- **DNS Master and DNS Slave (Yudhistira dan Werkudara)**
```
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9
```
- **Load Balancer (Arjuna)**
```
echo -e 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9 nginx
```
- **Worker (PrabuKusuma, Abimanyu, Wisanggeni)**
```
echo -e 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt install nginx php php-fpm -y
apt-get install wget
apt-get install unzip
apt-get install lynx
apt-get install apache2

wget -O '/var/www/abimanyu.it06.com' 'https://drive.google.com/uc?export=download&id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc'
unzip -o /var/www/abimanyu.it06.com -d /var/www/
mv /var/www/abimanyu.yyy.com /var/www/abimanyu.it06
rm /var/www/abimanyu.it06.com
rm -rf /var/www/abimanyu.yyy.com

wget -O '/var/www/arjuna.it06.com' 'https://drive.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX'
unzip -o /var/www/arjuna.it06.com -d /var/www/
mv /var/www/arjuna.yyy.com /var/www/arjuna.it06
rm /var/www/arjuna.it06.com
rm -rf /var/www/arjuna.yyy.com

wget -O '/var/www/parikesit.abimanyu.it06.com' 'https://drive.google.com/uc?export=download&id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS'
unzip -o /var/www/parikesit.abimanyu.it06.com -d /var/www/
mv /var/www/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.it06
rm /var/www/parikesit.abimanyu.it06.com
rm -rf /var/www/parikesit.abimanyu.yyy.com
mkdir /var/www/parikesit.abimanyu.it06/secret

wget -O '/var/www/rjp.baratayuda.abimanyu.it06.com' 'https://drive.google.com/uc?export=download&id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6'
unzip -o /var/www/rjp.baratayuda.abimanyu.it06.com -d /var/www/
mv /var/www/rjp.baratayuda.abimanyu.yyy.com /var/www/rjp.baratayuda.abimanyu.it06
rm /var/www/rjp.baratayuda.abimanyu.it06.com
rm -rf /var/www/rjp.baratayuda.abimanyu.yyy.com
```

## Soal 1 
> Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut

Konfigurasi router dan tambahkan nameserver pada node lainnya.

**Client**
```
ping google.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/b51ca4f6-c828-4df8-80d1-875f252a97bb)

## Soal 2 
> Buatlah website utama dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.

Lakukan setup Arjuna pada DNS master.

**Yudhistira**
```
echo 'zone "arjuna.it06.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.it06.com";
};' > /etc/bind9/named.conf.local

mkdir /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/arjuna.it06.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.it06.com. root.arjuna.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.it06.com.
@       IN      A       192.236.2.2     ; IP Yudhistira
www     IN      CNAME   arjuna.it06.com.' > /etc/bind/jarkom/arjuna.it06.com

service bind9 restart
```

**Client**
```
ping arjuna.it06.com -c 5
ping www.arjuna.it06.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/f86dfb12-91da-41c9-b1ad-b819e47a55b8)

## Soal 3
> Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

Lakukan setup Abimanyu pada DNS Master.

**Yudhistira**
```
echo 'zone "arjuna.it06.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.it06.com";
};

zone "abimanyu.it06.com" {
        type master;
        file "/etc/bind/jarkom/abimanyu.it06.com";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.it06.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it06.com. root.abimanyu.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.it06.com.
@       IN      A       192.236.2.2     ; IP Yudhistira
www     IN      CNAME   abimanyu.it06.com.' > /etc/bind/jarkom/abimanyu.it06.com

service bind9 restart
```

**Client**

```
ping abimanyu.it06.com -c 5
ping www.abimanyu.it06.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/289e5886-b1dd-496a-b421-1ba44f795273)

## Soal 4
> Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

Lakukan setup subdomain Parikesit pada DNS Master.

**Yudhistira**

```
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it06.com. root.abimanyu.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.it06.com.
@       IN      A       192.236.2.2     ; IP Yudhistira
www     IN      CNAME   abimanyu.it06.com.
parikesit IN    A       192.236.3.3     ; IP Abimanyu' > /etc/bind/jarkom/abimanyu.it06.com

service bind9 restart
```

**Client**
```
ping parikesit.abimanyu.it06.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/bca45033-0cac-40f6-bfac-45ab9ce93bf0)


## Soal 5
> Buat juga reverse domain untuk domain utama.

Lakukan setup Reverse Domain Abimanyu pada DNS Master.

**Yudhistira**
```
echo 'zone "2.236.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/2.236.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/2.236.192.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it06.com. root.abimanyu.it06.com. (
                        2003101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.236.192.in-addr.arpa. IN      NS      abimanyu.it06.com.
2                       IN      PTR     abimanyu.it06.com.' > /etc/bind/jarkom/2.236.192.in-addr.arpa

service bind9 restart
```

**Client**

```
host -t PTR 192.236.2.2
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/8202acd0-f791-44f7-bcbf-03a6ec95fe85)

## Soal 6
> Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

Lakukan konfigurasi DNS Slave pada DNS Master, dan di Werkudara sebagai DNS Slave.

Untuk pengetesan, sebelum ping pada client, stop service bind pada DNS Master.

**Yudhistira**

```
echo 'zone "arjuna.it06.com" {
        type master;
        file "/etc/bind/jarkom/arjuna.it06.com";
        allow-transfer { 192.236.2.3; }; // IP Werkudara
};

zone "abimanyu.it06.com" {
        type master;
        notify yes;
        also-notify { 192.236.2.3; }; // IP Werkudara
        allow-transfer { 192.236.2.3; }; // IP Werkudara
        file "/etc/bind/jarkom/abimanyu.it06.com";
};

zone "2.236.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/2.236.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

service bind9 restart
service bind9 stop
```

**Werkudara**
```
echo 'zone "abimanyu.it06.com" {
    type slave;
    masters { 192.236.2.2; }; // IP Yudhistira
    file "/var/lib/bind/abimanyu.it06.com";
};' >> /etc/bind/named.conf.local

service bind9 restart
```

**Client**
```
ping abimanyu.it06.com -c 5
ping www.abimanyu.it06.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/2fcc3958-e8b7-4d4e-abb9-78c3ae7757ea)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/85ec1be9-0955-40b2-9912-2f66b398fd28)

## Soal 7
> Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

Lakukan konfigurasi delegasi subdomain Baratayuda pada DNS Master dan DNS Slave.

**Yudhistira**

```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it06.com. root.abimanyu.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.it06.com.
@       IN      A       192.236.2.2     ; IP Yudhistira
www     IN      CNAME   abimanyu.it06.com.
parikesit IN    A       192.236.3.3     ; IP Abimanyu
ns1     IN      A       192.236.2.3     ; IP Werkudara
baratayuda IN   NS      ns1' > /etc/bind/jarkom/abimanyu.it06.com

echo "options {
    directory \"/var/cache/bind\";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //      0.0.0.0;
    // };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    //dnssec-validation auto;
    allow-query {any;};
    
    auth-nxdomain no;
    listen-on-v6 { any; };
};" > /etc/bind/named.conf.options

service bind9 restart
```

**Werkudara**

```
echo 'zone "baratayuda.abimanyu.it06.com" {
        type master;
        file "/etc/bind/baratayuda/baratayuda.abimanyu.it06.com";
};' >> /etc/bind/named.conf.local

mkdir /etc/bind/baratayuda

cp /etc/bind/db.local /etc/bind/baratayuda/baratayuda.abimanyu.it06.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.it06.com. root.baratayuda.abimanyu.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.it06.com.
@       IN      A       192.236.3.3     ; IP Abimanyu
www     IN      CNAME   baratayuda.abimanyu.it06.com.' > /etc/bind/baratayuda/baratayuda.abimanyu.it06.com

echo "options {
    directory \"/var/cache/bind\";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //      0.0.0.0;
    // };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    //dnssec-validation auto;
    allow-query {any;};

    auth-nxdomain no;
    listen-on-v6 { any; };
};" > /etc/bind/named.conf.options

service bind9 restart
```

**Client**
```
ping baratayuda.abimanyu.it06.com -c 5
ping www.baratayuda.abimanyu.it06.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/b93d48e3-f7ca-413a-b9fc-31193dc786a6)

## Soal 8
> Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

Lakukan konfigurasi subdomain rjp pada Werkudara.

**Werkudara**
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.it06.com. root.baratayuda.abimanyu.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      baratayuda.abimanyu.it06.com.
@               IN      A       192.236.3.3     ; IP Abimanyu
www             IN      CNAME   baratayuda.abimanyu.it06.com.
rjp             IN      A       192.236.3.3     ; IP Abimanyu
www.rjp         IN      CNAME   rjp.baratayuda.abimanyu.it06.com.' > /etc/bind/baratayuda/baratayuda.abimanyu.it06.com

service bind9 restart
```

**Client**
```
ping rjp.baratayuda.abimanyu.it06.com -c 5
ping www.rjp.baratayuda.abimanyu.it06.com -c 5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/73fd8784-a16d-495f-9599-5bce803dd513)

## Soal 9
> Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

Lakukan setup Load Balancer pada Arjuna, dan setup worker pada Prabukusuma, Abimanyu, dan Wisanggeni.

**Arjuna**
 
```
echo 'upstream backend {
  server 192.236.3.2; # IP PrabuKusuma
  server 192.236.3.3; # IP Abimanyu
  server 192.236.3.4; # IP Wisanggeni
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
```

**Worker**

```
service php7.2-fpm start

echo 'server {
        listen 80;

        root /var/www/jarkom;

        index index.php index.html index.htm;
        server_name _;

        location / {
                try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart
```

**Client**
```
lynx http://192.236.3.2
lynx http://192.236.3.3
lynx http://192.236.3.4
lynx http://192.236.3.5
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/385db433-9f9e-4dc1-8106-4f6478185453)

## Soal 10
> Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh (Prabakusuma:8001, Abimanyu:8002, Wisanggeni:8003).

Lakukan konfigurasi port pada Load Balancer dan Worker.

**Arjuna**
```
upstream backend {
  server 192.236.3.2:8001; # IP PrabuKusuma
  server 192.236.3.3:8002; # IP Abimanyu
  server 192.236.3.4:8003; # IP Wisanggeni
}
```

**Worker**
```
echo 'server {
        listen 8001;

        root /var/www/jarkom;

        index index.php index.html index.htm;
        server_name _;

        location / {
                try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}' > /etc/nginx/sites-available/jarkom
```
### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/1fc4d64e-ae65-450f-8701-9dbae14900cb)

## Soal 11
> Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy.

Lakukan setup webserver pada DNS Master dan Abimanyu.

**Yudhistira**
```
# 11
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it06.com. root.abimanyu.it06.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.it06.com.
@       IN      A       192.236.3.3     ; IP Abimanyu
www     IN      CNAME   abimanyu.it06.com.
parikesit IN    A       192.236.3.3     ; IP Abimanyu
ns1     IN      A       192.236.2.2     ; IP Werkudara
baratayuda IN   NS      ns1' > /etc/bind/jarkom/abimanyu.it06.com

service bind9 restart
```

**Abimanyu**
```
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/abimanyu.it06.com.conf

rm /etc/apache2/sites-available/000-default.conf

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.it06

  ServerName abimanyu.it06.com
  ServerAlias www.abimanyu.it06.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/abimanyu.it06.com.conf

a2ensite abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx abimanyu.it06.com
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/d0c3cc05-35fa-4d6e-bcd6-9c79efe15639)

## Soal 12
> Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

Tambahkan konfigurasi alias pada Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.it06
  ServerName abimanyu.it06.com
  ServerAlias www.abimanyu.it06.com

  <Directory /var/www/abimanyu.it06/index.php/home>
          Options +Indexes
  </Directory>

  Alias "/home" "/var/www/abimanyu.it06/index.php/home"

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx abimanyu.it06.com/home
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/d0c3cc05-35fa-4d6e-bcd6-9c79efe15639)

## Soal 13
> Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy.

Tambahkan konfigurasi ServerName dan ServerAlias pada Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.it06
  ServerName parikesit.abimanyu.it06.com
  ServerAlias www.parikesit.abimanyu.it06.com

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it06.com.conf

a2ensite parikesit.abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx parikesit.abimanyu.it06.com
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/d643cafd-a026-4ccd-8001-b63bc4350226)

## Soal 14
> Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

Tambahkan konfigurasi directory listing untuk folder /public dan /secret pada Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.it06
  ServerName parikesit.abimanyu.it06.com
  ServerAlias www.parikesit.abimanyu.it06.com

  <Directory /var/www/parikesit.abimanyu.it06/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.it06/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.it06/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.it06/secret"

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx parikesit.abimanyu.it06.com/public
lynx parikesit.abimanyu.it06.com/secret
```

### Result
**Public**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/afc3bebb-19d9-49b9-87ee-c3a19c8c3200)


**Secret**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/8457852b-0d5c-4f3f-9956-d191a6317556)

## Soal 15
> Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

Tambahkan konfigurasi ErrorDocument pada Abimanyu.

### Script
**Abimanyu**
```
echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.it06
  ServerName parikesit.abimanyu.it06.com
  ServerAlias www.parikesit.abimanyu.it06.com

  <Directory /var/www/parikesit.abimanyu.it06/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.it06/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.it06/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.it06/secret"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx parikesit.abimanyu.it06.com/blablabla
lynx parikesit.abimanyu.it06.com/secret
```

### Result
**404**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/fb432550-c6c0-4e94-99a5-d1ae65638cbd)

**403**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/4d0b71c9-98b9-4d6c-b42b-c8f2f0506cd7)

## Soal 16
> Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi www.parikesit.abimanyu.yyy.com/js 

Tambahkan konfigurasi ServerAlias untuk /js pada Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.it06
  ServerName parikesit.abimanyu.it06.com
  ServerAlias www.parikesit.abimanyu.it06.com

  <Directory /var/www/parikesit.abimanyu.it06/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.it06/secret>
          Options -Indexes
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.it06/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.it06/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.it06/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it06.com.conf
```

**Client**
```
lynx parikesit.abimanyu.it06.com/js
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/f8e3e9d6-aa05-48c5-bdb1-b26b938a2ec0)

## Soal 17
> Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

Tambahkan konfigurasi port untuk rjp pada ports.conf dan Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.it06
  ServerName rjp.baratayuda.abimanyu.it06.com
  ServerAlias www.rjp.baratayuda.abimanyu.it06.com

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.it06.com.conf

echo -e '# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 14000
Listen 14400

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/ports.conf

a2ensite rjp.baratayuda.abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx rjp.baratayuda.abimanyu.it06.com:14000
lynx rjp.baratayuda.abimanyu.it06.com:14400
```

### Result
**Port 14000 atau 14400**
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/04eebb61-911d-4247-a260-2ab1e3a47a5a)

## Soal 18
> Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

Tambahkan konfigurasi Authentication untuk rjp pada Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.it06
  ServerName rjp.baratayuda.abimanyu.it06.com
  ServerAlias www.rjp.baratayuda.abimanyu.it06.com

  <Directory /var/www/rjp.baratayuda.abimanyu.it06>
          AuthType Basic
          AuthName "Restricted Content"
          AuthUserFile /etc/apache2/.htpasswd
          Require valid-user
  </Directory>

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.it06.com.conf

a2ensite rjp.baratayuda.abimanyu.it06.com.conf

service apache2 restart

htpasswd -c -b /etc/apache2/.htpasswd Wayang baratayudait06
```

**Client**
```
lynx rjp.baratayuda.abimanyu.it06.com:14000
lynx rjp.baratayuda.abimanyu.it06.com:14400
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/51ebf60c-ca43-4602-bb6b-f67f3b89736d)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/5fc53577-c62a-4453-8ade-daece98bb59f)
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/ea5ddc18-797b-413e-aaf6-8b05ad201978)

## Soal 19
> Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com.

Tambahkan konfigurasi redirect pada Abimanyu.

**Abimanyu**
```
echo -e '<VirtualHost *:80>
    ServerAdmin webmaster@abimanyu.it06.com
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    Redirect / http://www.abimanyu.it06.com/
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

apache2ctl configtest

service apache2 restart
```

**Client**
```
lynx 192.236.3.3
```

### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/4a869bd2-b17e-411d-bc56-769e9f6489e4)

## Soal 20
> Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

Tambahkan konfigurasi a2enmod rewrite pada Abimanyu.

**Abimanyu**

```
a2enmod rewrite

echo 'RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)(abimanyu)(.*\.(png|jpg))
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png
RewriteRule abimanyu http://parikesit.abimanyu.it06.com/public/images/abimanyu.png$1 [L,R=301]' > /var/www/parikesit.abimanyu.it06/.htaccess

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.it06

  ServerName parikesit.abimanyu.it06.com
  ServerAlias www.parikesit.abimanyu.it06.com

  <Directory /var/www/parikesit.abimanyu.it06/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.it06/secret>
          Options -Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.it06>
          Options +FollowSymLinks -Multiviews
          AllowOverride All
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.it06/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.it06/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.it06/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it06.com.conf

service apache2 restart
```

**Client**
```
lynx parikesit.abimanyu.it06.com/public/images/abimanyu.png
lynx parikesit.abimanyu.it06.com/public/images/abimanyu-student.jpg
lynx parikesit.abimanyu.it06.com/public/images/not-abimanyu.png
lynx parikesit.abimanyu.it06.com/public/images/notabimanyujustmuseum.177013
```
### Result
![image](https://github.com/wahyuandhikarizaldi/Jarkom-Modul-2-IT06-2023/assets/113814423/2f2cc6ce-8571-4791-880d-999e286b6d2b)
