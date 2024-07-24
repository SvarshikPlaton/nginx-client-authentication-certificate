#/bin/bash

# This script generates self-signed certificates for the server and the client.
# Generation with Oracle Linux 9 creates an INVALID certificate! Generate on Ubuntu instead.


mkdir ./certs
set -e

openssl req -x509 -days 365 -newkey rsa:4096 -nodes \
    -keyout ./certs/ca.key -out ./certs/ca.crt \
    -subj "/C=UA/ST=Kharkiv/L=Kharkiv/O=SoftServe/CN=192.168.56.101/emailAddress=m.r.nemov@student.csn.khai.edu"
openssl req -x509 -days 365 -newkey rsa:4096 -nodes \
    -keyout ./certs/user.key -CA ./certs/ca.crt -CAkey ./certs/ca.key -out ./certs/user.crt \
    -subj "/C=UA/ST=Kharkiv/L=Kharkiv/O=SoftServe/CN=macintosh/emailAddress=m.r.nemov@student.csn.khai.edu"
openssl pkcs12 -legacy -export \
    -out ./certs/user.pfx -inkey ./certs/user.key -in ./certs/user.crt -certfile ./certs/ca.crt \
    -passout pass:jeff
