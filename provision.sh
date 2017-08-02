#!/bin/sh
echo I am provisioning...
sed -i s/dhcp/static/ /etc/sysconfig/network-scripts/ifcfg-eth0
sudo echo "IPADDR=$1" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sudo echo "PREFIX=24" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sudo echo "GATEWAY=192.168.0.1" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sudo echo "DNS1=8.8.8.8" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sudo echo "HOSTNAME $2" >> /etc/sysconfig/network
sudo echo "$1 $2" >> /etc/hosts
sudo systemctl restart network.service
