rm -f ca/index* ca/serial* foo.*
touch ca/index.txt
echo '01' > ca/serial
openssl req -subj "/C=US/ST=Illinois/L=Chicago/O=Bjhaid/OU=Administration/CN=foo.bar.com/emailAddress=certmaster@bar.com" -out foo.bar.com.csr -new -newkey rsa:2048 -nodes -keyout foo.bar.com.key -reqexts SAN -config <(cat openssl.cnf <(printf "[SAN]\nsubjectAltName=@alt_names\n\n[alt_names]\nDNS.1 = bar.com\nDNS.2 = foo.bar.com"))
openssl ca -in foo.bar.com.csr -out foo.bar.com.cert.pem -keyfile ca/cacert.key -cert ca/cacert.pem -name server_ca -config <(cat openssl.cnf <(printf "[SAN]\nsubjectAltName=@alt_names\n\n[alt_names]\nDNS.1 = bar.com\nDNS.2 = foo.bar.com\nDNS.3 = foo.bar.com"))
