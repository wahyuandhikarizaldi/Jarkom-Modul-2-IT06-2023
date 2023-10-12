echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9 -y




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
ns1     IN      A       192.236.2.3     ; IP Werkudara
baratayuda IN   NS      ns1' > /etc/bind/jarkom/abimanyu.it06.com

service bind9 restart