echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9    




echo 'zone "abimanyu.it06.com" {
    type slave;
    masters { 192.236.2.2; }; // Masukan IP Yudhistira
    file "/var/lib/bind/abimanyu.it06.com";
};

zone "baratayuda.abimanyu.it06.com" {
        type master;
        file "/etc/bind/baratayuda/baratayuda.abimanyu.it06.com";
};' > /etc/bind/named.conf.local

service bind9 restart





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