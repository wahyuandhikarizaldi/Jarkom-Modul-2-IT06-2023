 echo -e '
nameserver 192.168.122.1
' > /etc/resolv.conf
apt-get update && apt install nginx php php-fpm -y
apt-get install wget
apt-get install unzip

wget -O '/var/www/abimanyu.it06.com' 'https://drive.google.com/uc?export=download&id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc'
unzip -o /var/www/abimanyu.it06.com -d /var/www/
mv /var/www/abimanyu.yyy.com /var/www/abimanyu.it06
rm /var/www/abimanyu.it06.com
rm -rf /var/www/abimanyu.yyy.com

wget -O '/var/www/arjuna.it06.com' 'https://drive.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX'
unzip -o /var/www/arjuna.it06.com -d /var/www/
mv /var/www/arjuna.yyy.com /var/www/abimanyu.it06
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