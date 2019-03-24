FROM ubuntu:18.04

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc iproute2 netplan

# systemctl
# ADD ./default/bind9 /etc/default/bind9

# bind
# ADD ./bind/named.conf /etc/bind/named.conf
# ADD ./bind/named.conf.local /etc/bind/named.conf.local
# ADD ./bind/named.conf.options /etc/bind/named.conf.local.options

# bind zones
# ADD ./bind/zones/db.takeokunn.xyz /etc/bind/zones/db.takeokunn.xyz

CMD ["/etc/init.d/bind9" "restart"]
