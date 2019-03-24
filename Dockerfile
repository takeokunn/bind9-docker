FROM ubuntu:18.04

RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/|g' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get install -y bind9 bind9utils bind9-doc --fix-missing

# systemctl
ADD ./default/bind9 /etc/default/bind9

# bind
ADD ./bind/named.conf /etc/bind/named.conf
ADD ./bind/named.conf.local /etc/bind/named.conf.local
ADD ./bind/named.conf.options /etc/bind/named.conf.local.options

# bind zones
ADD ./bind/zones /etc/bind/zones

CMD ["service", "bind9", "restart"]
